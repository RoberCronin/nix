{
    flake.modules.nixos.base = {pkgs, ...}: {
        services.printing = {
            enable = true;
            listenAddresses = ["*:631"];
            allowFrom = ["all"];
            browsing = true;
            defaultShared = true;
            openFirewall = true;
            drivers = with pkgs; [
                cnijfilter2
                gutenprint
                gutenprintBin
                hplip
                hplipWithPlugin
            ];
        };

        services.avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };
}
