The file 'hostname_CHANGE_THIS_FILE.nix' must be copied to 'hostname.nix' then the variables in the 'let ... in' block should be changed to reflect the current system. Then in order to stop git from trying to add this system-specific file run the following commands:
* git add --intent-to-add hostname.nix
* git update-index --assume-unchanged hostname.nix

You also must copy your hardware-configuration.nix to this folder then run:
* git add --intent-to-add hardware-configuration.nix
* git update-index --assume-unchanged hardware-configuration.nix
