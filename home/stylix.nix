{pkgs, ...}: {
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        #autoEnable = false;
        #        targets = {
        #            alacritty.enable = true;
        #        };
    };
}
