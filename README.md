# NixOS and Home-Manager configuration

These are my configurations for my machines. They aren't meant to be used by others, but they might be useful as a reference.
I organize my config with the dendritic pattern, i.e. everything lives under a shared base, and each host picks which modules it needs (see `./modules/hosts/<host>/default.nix` for examples).

This project contains configurations for the following hosts:

* desktop
* laptop
* bigLaptop
* tablet
* server


## Usage

To rebuild the system:

```
sudo nixos-rebuild switch --flake .#desktop
```

To rebuild home:

```
home-manager switch -b backup --flake .#desktop
```

Replace `desktop` with the desired host.

## TODO
* Add a `default` host that will work on new machines. Currently when I get a new machine I need to write a config for it without having my environment set up. So this would speed up the initial setup.

