{
    flake.modules.nixos.nvim = {
        inputs,
        pkgs,
        ...
    }: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.browser];
        environment.systemPackages = with pkgs; [
            neovim
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
