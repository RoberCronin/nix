{
    config,
    inputs,
    ...
}: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nix.settings.trusted-users = ["root" config.user];
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    nixpkgs.overlays = [
        inputs.nix-cachyos-kernel.overlays.pinned
    ];

    # nix.gc.automatic = true;
    # nix.gc.options = "--delete-older-than 30d";

    # links /libexec from derivations to /run/current-system/sw
    environment.pathsToLink = ["/libexec"];

    system.stateVersion = "23.05";
}
