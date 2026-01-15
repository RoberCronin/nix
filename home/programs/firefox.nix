{pkgs, ...}: let
    settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.rights.3.shown" = true;
        "browser.profiles.created" = true;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
        "browser.shell.checkDefaultBrowser" = false;

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;

        # performance settings
        "gfx.webrender.all" = true;

        "browser.theme.toolbar-theme" = true;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "layout.css.prefers-color-scheme.content-override" = 0;
        "browser.toolbars.bookmarks.visibility" = "always";
        "sidebar.visibility" = "hide-sidebar";
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_6e3f516b-0653-4d26-87c5-bc71749229ee_-browser-action","firefoxcolor_mozilla_com-browser-action","_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","downloads-button","unified-extensions-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","screenshot-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_6e3f516b-0653-4d26-87c5-bc71749229ee_-browser-action","firefoxcolor_mozilla_com-browser-action","_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action","addon_darkreader_org-browser-action","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","vertical-tabs","unified-extensions-area"],"currentVersion":23,"newElementCount":4}'';
    };
    search = {
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
    };
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
}
