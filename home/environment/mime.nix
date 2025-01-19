{ config, lib, pkgs, ... }:
{
    xdg.mimeApps = {
    enable = true;

    defaultApplications = {
        "x-scheme-handler/http"="userapp-Firefox-S47AJ2.desktop";
        "x-scheme-handler/https"="userapp-Firefox-S47AJ2.desktop";
        "x-scheme-handler/chrome"="userapp-Firefox-S47AJ2.desktop";
        "text/html"="userapp-Firefox-S47AJ2.desktop";
        "application/x-extension-htm"="userapp-Firefox-S47AJ2.desktop";
        "application/x-extension-html"="userapp-Firefox-S47AJ2.desktop";
        "application/x-extension-shtml"="userapp-Firefox-S47AJ2.desktop";
        "application/xhtml+xml"="userapp-Firefox-S47AJ2.desktop";
        "application/x-extension-xhtml"="userapp-Firefox-S47AJ2.desktop";
        "application/x-extension-xht"="userapp-Firefox-S47AJ2.desktop";
    };
  };
}
