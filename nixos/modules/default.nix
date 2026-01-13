{...}: {
    imports = [
        ./hardware

        ./auto-cpufreq.nix
        ./sunshine.nix
        ./virtualbox.nix
        ./wacom.nix
        ./x11.nix
    ];
}
