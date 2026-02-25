{
    pkgs,
    pkgs-stable,
    ...
}: {
    environment.systemPackages = with pkgs; [
        obs-studio
        pkgs-stable.krita
        blender
        audacity
        pkgs-stable.freecad
        jstest-gtk
    ];
}
