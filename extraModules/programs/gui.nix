{
    flake.modules.nixos.gui = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            krita
            blender
            audacity
            freecad
            jstest-gtk
        ];
    };
}
