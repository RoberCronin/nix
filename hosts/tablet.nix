{...}: {
    imports = [
        # ../system/modules/auto-cpufreq.nix
        ../system/modules/wacom.nix
        ../system/modules/hardware/power-key.nix
        ../system/modules/hardware/tpm.nix
    ];

    services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="serio", DRIVERS=="atkbd", ATTR{firmware_id}=="PNP: PNP0303", ATTR{id/extra}=="00", ATTR{id/id}=="00", ATTR{id/proto}=="00", ATTR{id/type}=="06", ATTR{power/wakeup}="disabled"
    '';
}
