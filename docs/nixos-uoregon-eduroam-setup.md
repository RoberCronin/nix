# Setting Up University of Oregon Wi-Fi (`eduroam` & `UO Secure`) on NixOS

University of Oregon uses **EAP-TLS** certificate-based authentication via SecureW2 (required after the Fall 2026 security updates). This workflow keeps all credentials and certificates imperative (outside of your `.nix` configuration and the Nix store) while satisfying NixOS's systemd sandboxing and user permissions.

---

## Prerequisites in `networking.nix`

Ensure NetworkManager is enabled in your NixOS configuration (no credentials or certificates need to be declared in Nix):

```nix
networking.networkmanager.enable = true;
```

---

## Problems & Root Causes on NixOS

1. **Missing Python/CLI Dependencies in SecureW2 Script**
   - **Problem:** `SecureW2_JoinNow.run` fails with `No module named 'dbus'` or `unable to locate openssl executable`. Wrapping it in `steam-run` overrides `PATH` and hides Nix `python3.withPackages` environments.
   - **Solution:** Run the script directly in an ephemeral `nix-shell` providing `python3.withPackages` (`dbus-python`, `pygobject3`, `requests`), `networkmanager`, and `openssl`.

2. **`ProtectHome=yes` on NixOS `wpa_supplicant.service`**
   - **Problem:** SecureW2 saves certificates to `~/.joinnow/`, causing `wpa_supplicant` to fail with `OpenSSL: tls_connection_ca_cert - Failed to load root certificates ... No such file or directory`.
   - **Solution:** Copy the CA cert, client cert, and `.p12` private key to `/etc/ssl/uoregon-wifi/`.

3. **Unprivileged `wpa_supplicant` User vs. `nmcli` User Validation**
   - **Problem:** On NixOS, `wpa_supplicant` runs as the `wpa_supplicant` user/group (not `root`), while `nmcli connection modify` validates file readability as your regular user. Setting `root:root` (`600`) blocks `nmcli`; setting `$USER:root` (`640`) causes `wpa_supplicant` to fail with `Failed to load private key ... Permission denied`.
   - **Solution:** Set ownership on `client.p12` to `$USER:wpa_supplicant` with `640` permissions so both `nmcli` and `wpa_supplicant` can read it.

---

## Step-by-Step Setup Workflow

### 1. Remove Old Cached Profiles (If Upgrading)
If you previously connected to `eduroam` or `UO Secure` using password-based `PEAP`/`MSCHAPv2`, forget or delete those old profiles first so they don't conflict:

```bash
nmcli connection show
# Delete any stale profiles by name or UUID:
# nmcli connection delete "eduroam"
```

### 2. Download the SecureW2 Installer
Download the Linux onboarding script (`SecureW2_JoinNow.run`) from the [UO SecureW2 Portal](https://securew2.com). *(If you are off-campus or disconnected, you can temporarily use `UO Guest` to download it.)*

### 3. Run the Installer in `nix-shell`
From the directory containing `SecureW2_JoinNow.run`, run:

```bash
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python pygobject3 requests ])" networkmanager openssl --run "sh ./SecureW2_JoinNow.run"
```

- Press **Enter** at the `Next/Cancel? [Next]` prompt.
- Complete the Duck ID and Duo authentication in the browser window that opens.
- If you run this off-campus, it will say *"Configuration succeeded. Configured Network is however not in range."*—press `Ctrl+C` at the `Retry/Continue?` prompt and continue to Step 4.

### 4. Move Certificates to `/etc/ssl/uoregon-wifi/`
Copy the generated files out of `~/.joinnow/` and set the required ownership and permissions:

```bash
sudo mkdir -p /etc/ssl/uoregon-wifi
sudo cp ~/.joinnow/ssltlsrootrsa2022*bundle.pem /etc/ssl/uoregon-wifi/ca.pem
sudo cp ~/.joinnow/tls-client-certs/*.crt /etc/ssl/uoregon-wifi/client.crt
sudo cp ~/.joinnow/tls-client-certs/*.p12 /etc/ssl/uoregon-wifi/client.p12

sudo chmod 644 /etc/ssl/uoregon-wifi/ca.pem /etc/ssl/uoregon-wifi/client.crt
sudo chown "\$USER":wpa_supplicant /etc/ssl/uoregon-wifi/client.p12
sudo chmod 640 /etc/ssl/uoregon-wifi/client.p12
```

### 5. Point NetworkManager Profiles to the New Paths
Check the exact connection names created by SecureW2:

```bash
nmcli connection show
```

Update both `eduroam` and `UO Secure` (replace the bracketed IDs if yours differ) and activate `eduroam`:

```bash
for conn in "eduroam [c882a10e]" "UO Secure [35b1dbfd]"; do
  nmcli connection modify "\$conn" \
    802-1x.ca-cert /etc/ssl/uoregon-wifi/ca.pem \
    802-1x.client-cert /etc/ssl/uoregon-wifi/client.crt \
    802-1x.private-key /etc/ssl/uoregon-wifi/client.p12
done

nmcli connection up "eduroam [c882a10e]"
```

### 6. Clean Up Temporary Files (Optional)
Once connected, remove the temporary files from your home directory:

```bash
rm -rf ~/.joinnow ~/Downloads/SecureW2_JoinNow.run
```

---

## Recommended Post-Setup Tweaks

- **Prevent `UO Guest` from hijacking your connection:** If you used `UO Guest` to download the installer, disable auto-connect on it so NetworkManager always prefers `eduroam`:
  ```bash
  nmcli connection modify "UO Guest" connection.autoconnect no
  ```
- **Set connection priority:** Give `eduroam` a higher autoconnect priority than `UO Secure` (or vice versa):
  ```bash
  nmcli connection modify "eduroam [c882a10e]" connection.autoconnect-priority 10
  nmcli connection modify "UO Secure [35b1dbfd]" connection.autoconnect-priority 5
  ```
- **Using `eduroam` at other universities:** Because `eduroam` uses your full `duckid@uoregon.edu` identity and UO's client certificate, this profile will automatically work at any participating `eduroam` institution worldwide.

---

## Troubleshooting & Renewal

- **Inspect live EAP-TLS / `wpa_supplicant` errors:**
  ```bash
  sudo journalctl -u NetworkManager -u wpa_supplicant --since "2 minutes ago" --no-pager | grep -iE "eduroam|openssl|tls|pkcs|key|eap|fail|error"
  ```
- **Verify profile TLS fields (without exposing secrets):**
  ```bash
  nmcli connection show "eduroam [c882a10e]" | grep -E "802-1x\.|802-11-wireless-security\."
  ```
- **Check certificate expiration date:**
  ```bash
  nix-shell -p openssl --run "openssl x509 -in /etc/ssl/uoregon-wifi/client.crt -noout -dates"
  ```
- **Renewing expired certificates:** Re-run Steps 2–6 to overwrite the files in `/etc/ssl/uoregon-wifi/` with the new `.crt` and `.p12`, and re-apply `chown "$USER":wpa_supplicant` and `chmod 640` to `client.p12`.

