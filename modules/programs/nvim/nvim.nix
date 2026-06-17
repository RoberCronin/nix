{
    flake.modules.nixos.base = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            neovim
            wl-clipboard
            opencode # ACP provider for Agentic.nvim
            tree-sitter
            luaPackages.tree-sitter-cli

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
            elixir-ls

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
