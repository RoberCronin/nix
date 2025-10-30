{...}: {
    imports = [
        ../system/modules/auto-cpufreq.nix
        ../system/modules/wacom.nix
        ../system/modules/hardware/power-key.nix
        ../system/modules/hardware/tpm.nix
    ];
    # options = {
    #     hostname = lib.mkOption {
    #         type = lib.types.str;
    #         default = "tablet";
    #         description = "Networking hostname";
    #     };
    #
    #     user = lib.mkOption {
    #         type = lib.types.str;
    #         default = "robert";
    #         description = "The name of the current user";
    #     };
    #
    # tpm.enable = lib.mkOption {
    #     type = lib.types.bool;
    #     default = false;
    #     description = "Whether to enable tpm on startup.";
    # };
    #
    # nvidia.enable = lib.mkOption {
    #     type = lib.types.bool;
    #     default = false;
    #     description = "Whether to enable nvidia drivers.";
    # };
    #
    # auto-cpufreq.enable = lib.mkOption {
    #     type = lib.types.bool;
    #     default = true;
    #     description = "Whether to enable auto-cpufreq.";
    # };
    #
    # xfce.enable = lib.mkOption {
    #     type = lib.types.bool;
    #     default = false;
    #     description = "Whether to enable xfce.";
    # };
    #
    # sunshine.enable = lib.mkOption {
    #     type = lib.types.bool;
    #     default = false;
    #     description = "Whether to enable sunshine game streaming.";
    # };
    #
    # wacom = lib.mkOption {
    #     type = lib.types.bool;
    #     default = true;
    #     description = "Whether to enable wacom drivers.";
    # };
    # };
}
