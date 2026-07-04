{inputs, ...}: let
    pkgs-stable = import inputs.nixpkgs-stable {
        system = "x86_64-linux";
        config.allowUnfree = true;
    };
in {
    flake.modules.nixos.dev = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            # Development
            lazydocker
            devenv
            lazygit
            stdenv
            gnumake
            tree-sitter
            cmake

            # Compiling/Languages
            typst
            clang-tools
            python3
            uv
            texliveFull
            lua
            cargo
            rustc
            nodejs_22
            gcc
            ghc
            elixir

            # Editors
            arduino-ide
            zed-editor
        ];
    };
}
