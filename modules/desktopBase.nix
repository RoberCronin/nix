{self, ...}: {
    flake.modules.nixos.desktopBase = {
        imports = with self.modules.nixos; [
            displayManager
            audio
            bluetooth
            input
            printing
            fonts
            virtualization
            desktopOptions

            alacritty
            betterControl
            browser
            desktopApps
            dunst
            kdeconnect
            rofi
            thunar
            vscode
            wofi
            qtTheme
        ];
    };

    flake.modules.homeManager.desktopBase = {
        imports = with self.modules.homeManager; [
            alacritty
            betterControl
            browser
            dunst
            rofi
            vscode
            wofi
            qtTheme
        ];
    };
}
