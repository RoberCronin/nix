{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            neovim
            wl-clipboard
            pkgs.vimPlugins.avante-nvim # The Avante package
            pkgs.gcc # Required to compile/link Avante's native components
            pkgs.ripgrep

            # LSP, language server
            cmake-language-server # c/c++ lsp
            lua-language-server
            typescript-language-server
            basedpyright # python lsp
            nixd
            glsl_analyzer
            tinymist # typst lsp
            harper # grammar and spelling
            haskell-language-server

            # Code Styling/formatters
            typstyle # typst
            alejandra # nix
            clang-tools # c/c++
            isort # python import sorter
            black # python
            stylua #lua
            prettier # javascript, css, html, json
            ormolu # haskell
        ];

        environment.sessionVariables = {
            NVIM_AVANTE_PATH = "${pkgs.vimPlugins.avante-nvim}";
        };
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
