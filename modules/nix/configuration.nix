{inputs, ...}: {
    flake.modules.nixos.base = {pkgs, ...}: {
        nixpkgs.config.allowUnfree = true;
        nix.settings.experimental-features = ["nix-command" "flakes"];
        nix.settings.trusted-users = ["root" "robert"];
        nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

        environment.systemPackages = with pkgs; [
            home-manager
        ];

        nixpkgs.overlays = [
            inputs.nix-cachyos-kernel.overlays.pinned
        ];

        # nix.gc.automatic = true;
        # nix.gc.options = "--delete-older-than 30d";

        # links /libexec from derivations to /run/current-system/sw
        environment.pathsToLink = ["/libexec"];

        system.stateVersion = "23.05";
    };

    flake.modules.homeManager.base = {config, ...}: {
        nixpkgs.config = {
            allowUnfree = true;
        };

        home = {
            username = config.mainUser;
            homeDirectory = "/home/${config.mainUser}";

            stateVersion = "23.11";
        };
    };
}
