{
    config,
    lib,
    pkgs,
    ...
}: {
    home.activation.vscodeRestoreExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
        cd "$XDG_CONFIG_HOME/Code/User" &&
        cat vscode-extensions.txt | xargs -n 1 ${pkgs.vscode}/bin/code --install-extension
    '';

    xdg.configFile = {
        "Code/User/keybindings.json" = {
            source = config.lib.meta.mkMutableSymlink ./User/keybindings.json;
        };
        "Code/User/settings.json" = {
            source = config.lib.meta.mkMutableSymlink ./User/settings.json;
        };
        "Code/User/tasks.json" = {
            source = config.lib.meta.mkMutableSymlink ./User/tasks.json;
        };
        "Code/User/vscode-extensions.txt" = {
            source = config.lib.meta.mkMutableSymlink ./User/vscode-extensions.txt;
        };
    };
}
