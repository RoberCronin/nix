{
    flake.modules.general.functions = {
        inputs,
        config,
        lib,
        ...
    }: {
        # Thanks to ncfavier for this function
        # https://github.com/ncfavier/config/blob/954cbf4f569abe13eab456301a00560d82bd0165/modules/nix.nix#L12-L14
        lib.meta = {
            configPath = config.flakePath;
            mkMutableSymlink = path:
                config.lib.file.mkOutOfStoreSymlink
                (config.lib.meta.configPath + lib.strings.removePrefix (toString inputs.self) (toString path));
        };
    };
}
