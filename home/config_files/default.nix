{
    config,
    lib,
    inputs,
    ...
}: {
    imports = [
        ./.config
        ./.local
    ];

    # Thanks to ncfavier for this function
    # https://github.com/ncfavier/config/blob/954cbf4f569abe13eab456301a00560d82bd0165/modules/nix.nix#L12-L14
    lib.meta = {
        configPath = "${config.home.homeDirectory}/nix";
        mkMutableSymlink = path:
            config.lib.file.mkOutOfStoreSymlink
            (config.lib.meta.configPath + lib.strings.removePrefix (toString inputs.self) (toString path));
    };

    home.file = {
        ".bashrc" = {
            source = config.lib.meta.mkMutableSymlink ./.bashrc;
        };

        ".bash_profile" = {
            source = config.lib.meta.mkMutableSymlink ./.bash_profile;
        };
    };
}
