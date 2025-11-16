{...}: {
    imports = [
        ../modules/nixos/wacom.nix
        ../modules/nixos/hardware/power-key.nix
        ../modules/nixos/hardware/tpm.nix
    ];

    services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{firmware_id}=="PNP: PNP0303", ATTR{id/extra}=="00", ATTR{id/id}=="00", ATTR{id/proto}=="00", ATTR{id/type}=="06", ATTR{power/wakeup}="disabled"
    '';
}
