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
            
            "image/avif"="nomacs.desktop";
            "image/bmp"="nomacs.desktop";
            "image/gif"="nomacs.desktop";
            "image/heic"="nomacs.desktop";
            "image/heif"="nomacs.desktop";
            "image/jpeg"="nomacs.desktop";
            "image/jxl"="nomacs.desktop";
            "image/png"="nomacs.desktop";
            "image/tiff"="nomacs.desktop";
            "image/webp"="nomacs.desktop";
            "image/x-eps"="nomacs.desktop";
            "image/x-ico"="nomacs.desktop";
            "image/x-portable-bitmap"="nomacs.desktop";
            "image/x-portable-graymap"="nomacs.desktop";
            "image/x-portable-pixmap"="nomacs.desktop";
            "image/x-xbitmap"="nomacs.desktop";
            "image/x-xpixmap"="nomacs.desktop";
        };
    };

    xdg.desktopEntries.nomacs = {
        name = "nomacs";
        exec = "nomacs %f";
        comment = "nomacs is a free, open source image viewer.";
        genericName = "Image Viewer";
        terminal = false;
        icon = "org.nomacs.ImageLounge";
        type = "Application";
        categories = [ "Graphics" "RasterGraphics" "Viewer" "2DGraphics" ];
        mimeType = [ "image/avif" "image/bmp" "image/gif" "image/heic" "image/heif" "image/jpeg" "image/jxl" "image/png" "image/tiff" "image/webp" "image/x-eps" "image/x-ico" "image/x-portable-bitmap" "image/x-portable-graymap" "image/x-portable-pixmap" "image/x-xbitmap" "image/x-xpixmap" ];
    };
}
