{...}: {
    xdg.desktopEntries.xarchiver = {
        name = "Xarchiver";
        exec = "xarchiver %f";
        comment = "Create, extract and modify archives";
        genericName = "Archive manager";
        terminal = false;
        icon = "xarchiver";
        type = "Application";
        categories = ["GTK" "Utility" "Archiving" "Compression"];
        mimeType = ["application/epub+zip" "application/gzip" "application/java-archive" "application/vnd.android.package-archive" "application/vnd.appimage" "application/vnd.comicbook-rar" "application/vnd.comicbook+zip" "application/vnd.debian.binary-package" "application/vnd.ms-cab-compressed" "application/vnd.ms-htmlhelp" "application/vnd.oasis.opendocument.text" "application/vnd.openofficeorg.extension" "application/vnd.openxmlformats-officedocument.wordprocessingml.document" "application/vnd.rar" "application/vnd.snap" "application/vnd.squashfs" "application/x-7z-compressed" "application/x-archive" "application/x-arj" "application/x-bzip" "application/x-bzip-compressed-tar" "application/x-bzip1" "application/x-bzip1-compressed-tar" "application/x-bzip2" "application/x-bzip2-compressed-tar" "application/x-bzip3" "application/x-bzip3-compressed-tar" "application/x-cb7" "application/x-cbt" "application/x-cd-image" "application/x-compress" "application/x-compressed-tar" "application/x-cpio" "application/x-cpio-compressed" "application/x-java-archive" "application/x-lha" "application/x-lrzip" "application/x-lrzip-compressed-tar" "application/x-lz4" "application/x-lz4-compressed-tar" "application/x-lzip" "application/x-lzip-compressed-tar" "application/x-lzma" "application/x-lzma-compressed-tar" "application/x-lzop" "application/x-rar" "application/x-rpm" "application/x-rzip" "application/x-rzip-compressed-tar" "application/x-source-rpm" "application/x-tar" "application/x-tarz" "application/x-tzo" "application/x-xpinstall" "application/x-xz" "application/x-xz-compressed-tar" "application/x-zip-compressed-fb2" "application/x-zpaq" "application/x-zstd-compressed-tar" "application/zip" "application/zstd"];
    };

    xdg.desktopEntries.nvim-alacritty = {
        name = "Close launcher";
        exec = "echo closed launcher.";
        genericName = "";
        terminal = false;
        comment = "";
        type = "Application";
        icon = "alacritty";
        categories = [];
        mimeType = [];
    };

    xdg.desktopEntries.firefox-school = {
        name = "Firefox School";
        exec = "firefox -p school";
        genericName = "Web Browser";
        terminal = false;
        comment = "Browse the web";
        type = "Application";
        icon = "firefox";
        categories = [];
        mimeType = [
            "x-scheme-handler/http"
            "x-scheme-handler/https"
            "x-scheme-handler/chrome"
            "text/html"
            "application/x-extension-htm"
            "application/x-extension-html"
            "application/x-extension-shtml"
            "application/xhtml+xml"
            "application/x-extension-xhtml"
            "application/x-extension-xht"
        ];
    };

    xdg = {
        enable = true;
        mimeApps = {
            enable = true;
            defaultApplications = {
                "application/pdf" = "okularApplication_pdf.desktop";
                "inode/directory" = "thunar.desktop";

                "text/english" = "org.xfce.mousepad.desktop";
                "text/plain" = "org.xfce.mousepad.desktop";
                "text/x-makefile" = "org.xfce.mousepad.desktop";
                "text/x-c++hdr" = "org.xfce.mousepad.desktop";
                "text/x-c++src" = "org.xfce.mousepad.desktop";
                "text/x-chdr" = "org.xfce.mousepad.desktop";
                "text/x-csrc" = "org.xfce.mousepad.desktop";
                "text/x-java" = "org.xfce.mousepad.desktop";
                "text/x-moc" = "org.xfce.mousepad.desktop";
                "text/x-pascal" = "org.xfce.mousepad.desktop";
                "text/x-tcl" = "org.xfce.mousepad.desktop";
                "text/x-tex" = "org.xfce.mousepad.desktop";
                "application/x-shellscript" = "org.xfce.mousepad.desktop";
                "text/x-c" = "org.xfce.mousepad.desktop";
                "text/x-c++" = "org.xfce.mousepad.desktop";
                "application/xml" = "org.xfce.mousepad.desktop";

                "x-scheme-handler/http" = "org.mozilla.firefox.desktop";
                "x-scheme-handler/https" = "org.mozilla.firefox.desktop";
                "x-scheme-handler/chrome" = "org.mozilla.firefox.desktop";
                "text/html" = "org.mozilla.firefox.desktop";
                "application/x-extension-htm" = "org.mozilla.firefox.desktop";
                "application/x-extension-html" = "org.mozilla.firefox.desktop";
                "application/x-extension-shtml" = "org.mozilla.firefox.desktop";
                "application/xhtml+xml" = "org.mozilla.firefox.desktop";
                "application/x-extension-xhtml" = "org.mozilla.firefox.desktop";
                "application/x-extension-xht" = "org.mozilla.firefox.desktop";

                "image/avif" = "org.nomacs.ImageLounge.desktop";
                "image/bmp" = "org.nomacs.ImageLounge.desktop";
                "image/gif" = "org.nomacs.ImageLounge.desktop";
                "image/heic" = "org.nomacs.ImageLounge.desktop";
                "image/heif" = "org.nomacs.ImageLounge.desktop";
                "image/jpeg" = "org.nomacs.ImageLounge.desktop";
                "image/jxl" = "org.nomacs.ImageLounge.desktop";
                "image/png" = "org.nomacs.ImageLounge.desktop";
                "image/tiff" = "org.nomacs.ImageLounge.desktop";
                "image/webp" = "org.nomacs.ImageLounge.desktop";
                "image/x-eps" = "org.nomacs.ImageLounge.desktop";
                "image/x-ico" = "org.nomacs.ImageLounge.desktop";
                "image/x-portable-bitmap" = "org.nomacs.ImageLounge.desktop";
                "image/x-portable-graymap" = "org.nomacs.ImageLounge.desktop";
                "image/x-portable-pixmap" = "org.nomacs.ImageLounge.desktop";
                "image/x-xbitmap" = "org.nomacs.ImageLounge.desktop";
                "image/x-xpixmap" = "org.nomacs.ImageLounge.desktop";

                "application/epub+zip" = "xarchiver.desktop";
                "application/gzip" = "xarchiver.desktop";
                "application/java-archive" = "xarchiver.desktop";
                "application/vnd.android.package-archive" = "xarchiver.desktop";
                "application/vnd.appimage" = "xarchiver.desktop";
                "application/vnd.comicbook-rar" = "xarchiver.desktop";
                "application/vnd.comicbook+zip" = "xarchiver.desktop";
                "application/vnd.debian.binary-package" = "xarchiver.desktop";
                "application/vnd.ms-cab-compressed" = "xarchiver.desktop";
                "application/vnd.ms-htmlhelp" = "xarchiver.desktop";
                "application/vnd.oasis.opendocument.text" = "xarchiver.desktop";
                "application/vnd.openofficeorg.extension" = "xarchiver.desktop";
                "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "xarchiver.desktop";
                "application/vnd.rar" = "xarchiver.desktop";
                "application/vnd.snap" = "xarchiver.desktop";
                "application/vnd.squashfs" = "xarchiver.desktop";
                "application/x-7z-compressed" = "xarchiver.desktop";
                "application/x-archive" = "xarchiver.desktop";
                "application/x-arj" = "xarchiver.desktop";
                "application/x-bzip" = "xarchiver.desktop";
                "application/x-bzip-compressed-tar" = "xarchiver.desktop";
                "application/x-bzip1" = "xarchiver.desktop";
                "application/x-bzip1-compressed-tar" = "xarchiver.desktop";
                "application/x-bzip2" = "xarchiver.desktop";
                "application/x-bzip2-compressed-tar" = "xarchiver.desktop";
                "application/x-bzip3" = "xarchiver.desktop";
                "application/x-bzip3-compressed-tar" = "xarchiver.desktop";
                "application/x-cb7" = "xarchiver.desktop";
                "application/x-cbt" = "xarchiver.desktop";
                "application/x-cd-image" = "xarchiver.desktop";
                "application/x-compress" = "xarchiver.desktop";
                "application/x-compressed-tar" = "xarchiver.desktop";
                "application/x-cpio" = "xarchiver.desktop";
                "application/x-cpio-compressed" = "xarchiver.desktop";
                "application/x-java-archive" = "xarchiver.desktop";
                "application/x-lha" = "xarchiver.desktop";
                "application/x-lrzip" = "xarchiver.desktop";
                "application/x-lrzip-compressed-tar" = "xarchiver.desktop";
                "application/x-lz4" = "xarchiver.desktop";
                "application/x-lz4-compressed-tar" = "xarchiver.desktop";
                "application/x-lzip" = "xarchiver.desktop";
                "application/x-lzip-compressed-tar" = "xarchiver.desktop";
                "application/x-lzma" = "xarchiver.desktop";
                "application/x-lzma-compressed-tar" = "xarchiver.desktop";
                "application/x-lzop" = "xarchiver.desktop";
                "application/x-rar" = "xarchiver.desktop";
                "application/x-rpm" = "xarchiver.desktop";
                "application/x-rzip" = "xarchiver.desktop";
                "application/x-rzip-compressed-tar" = "xarchiver.desktop";
                "application/x-source-rpm" = "xarchiver.desktop";
                "application/x-tar" = "xarchiver.desktop";
                "application/x-tarz" = "xarchiver.desktop";
                "application/x-tzo" = "xarchiver.desktop";
                "application/x-xpinstall" = "xarchiver.desktop";
                "application/x-xz" = "xarchiver.desktop";
                "application/x-xz-compressed-tar" = "xarchiver.desktop";
                "application/x-zip-compressed-fb2" = "xarchiver.desktop";
                "application/x-zpaq" = "xarchiver.desktop";
                "application/x-zstd-compressed-tar" = "xarchiver.desktop";
                "application/zip" = "xarchiver.desktop";
                "application/zstd" = "xarchiver.desktop";
            };
        };
    };
}
