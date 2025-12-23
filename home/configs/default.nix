{...}: {
    imports = [
        ./config
        ./local
    ];

    home.file = {
        ".bashrc" = {
            source = ./bashrc;
        };

        ".bash_profile" = {
            source = ./bash_profile;
        };
    };
}
