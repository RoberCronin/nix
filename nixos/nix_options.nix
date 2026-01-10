{inputs, ...}: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" "robert"];
    nix.nixPath = [
        "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
        "/nix/var/nix/profiles/per-user/root/channels"
        ("nixos-config=" + ./default.nix)
    ];

    # nix.gc.automatic = true;
    # nix.gc.options = "--delete-older-than 30d";

    # links /libexec from derivations to /run/current-system/sw
    environment.pathsToLink = ["/libexec"];

    system.stateVersion = "23.05";
}
