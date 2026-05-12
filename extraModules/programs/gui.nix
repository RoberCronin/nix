{
    flake.modules.nixos.gui = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            obs-studio
            krita
            blender
            audacity
            freecad
            jstest-gtk
        ];
    };
}
