{
    inputs,
    lib,
    ...
}: {
    imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.flake-parts.flakeModules.easyOverlay
    ];

    options.flake.homeConfigurations = lib.mkOption {
        default = {};
        type = lib.types.lazyAttrsOf lib.types.raw;
    };

    config.systems = [];
}
