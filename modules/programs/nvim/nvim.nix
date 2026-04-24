{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            neovim
            wl-clipboard

            # LSP, language server
            cmake-language-server # c/c++ lsp
            lua-language-server
            basedpyright # python lsp
            nixd
            glsl_analyzer
            tinymist # typst lsp
            harper # grammar and spelling

            # Code Styling/formatters
            typstyle # typst
            alejandra # nix
            jsonfmt # json
            clang-tools # c/c++
            isort # python import sorter
            black # python
            stylua #lua
            # nodePackages_latest.prettier # javascript, css, html
        ];
    };

    flake.modules.homeManager.base = {config, ...}: {
        xdg.configFile = {
            "nvim" = {
                source = config.lib.meta.mkMutableSymlink ./_config;
                recursive = true;
            };
        };
    };
}
