# NixOS and Home-Manager configuration
These are my configurations for my NixOS systems. These configs aren't meant to be used by other people, but they may be useful as reference.

To rebuild home:
* home-manager switch -b backup --flake .#default

To rebuild system:
* sudo nixos-rebuild switch --flake .#default
