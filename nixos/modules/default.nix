{...}: {
    imports = [
        ./hardware

        ./auto-cpufreq.nix
        ./sunshine.nix
        ./virtual_box.nix
        ./wacom.nix
        ./x11.nix
    ];
}
