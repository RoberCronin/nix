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
            clang-tools # c/c++
            isort # python import sorter
            black # python
            stylua #lua
            prettier # javascript, css, html, json
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
