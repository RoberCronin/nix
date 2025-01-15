{ lib, pkgs, ... }:
{
    home = {
        packages = with pkgs; [
            hello
        ];

        username = "robert";
        homeDirectory = "/home/robert";

        stateVersion = "23.11";
    };
}
