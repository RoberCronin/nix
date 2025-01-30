The file 'hostname_CHANGE_THIS_FILE.nix' must be copied to 'hostname.nix' then the variables in the 'let ... in' block should be changed to reflect the current system.
You also must copy your hardware-configuration.nix to this folder then run:
git add --intent-to-add hostname.nix
git update-index --assume-unchanged hostname.nix
git add --intent-to-add hardware-configuration.nix
git update-index --assume-unchanged hardware-configuration.nix

To rebuild home:
* home-manager switch -b backup --flake .#default

To rebuild system:
* sudo nixos-rebuild switch --flake .#default
