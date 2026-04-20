{
    flake.modules.nixos.browser = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            firefox
        ];
    };

    flake.modules.homeManager.browser = {pkgs, ...}: let
        settings = import ./_settings.nix;
        search = import ./_search.nix {inherit pkgs;};
    in {
        programs.firefox = {
            enable = true;
            profiles = {
                default = {
                    id = 0;
                    name = "default";
                    isDefault = true;
                    containersForce = true;
                    inherit settings;
                    inherit search;
                };

                school = {
                    id = 1;
                    name = "school";
                    isDefault = false;
                    containersForce = true;
                    inherit settings;
                    inherit search;
                };
            };
        };
    };
}
