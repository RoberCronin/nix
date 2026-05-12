{pkgs, ...}: {
    force = true;
    default = "google";
    order = ["google"];
    engines = {
        "Nix Packages" = {
            urls = [
                {
                    template = "https://search.nixos.org/packages";
                    params = [
                        {
                            name = "type";
                            value = "packages";
                        }
                        {
                            name = "query";
                            value = "{searchTerms}";
                        }
                    ];
                }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
        };

        "Nix Options" = {
            urls = [
                {
                    template = "https://search.nixos.org/options";
                    params = [
                        {
                            name = "query";
                            value = "{searchTerms}";
                        }
                    ];
                }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
        };

        "NixOS Wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@nw"];
        };

        "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
    };
}
