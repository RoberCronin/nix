{ config, pkgs, ... }:
let
    username = config.hostdata.user;
    hostname = config.hostdata.hostname;
in
{
  #imports =
  #  [ 
  #    /etc/nixos/hardware-configuration.nix
  #  ];

  #nixpkgs.config.allowUnfree = true;
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/home/robert/.config/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels" ];
  ##nix.gc.automatic = true;
  ##nix.gc.options = "--delete-older-than 8d";
  ##boot.loader.grub.enable = true;
  ##boot.loader.grub.device = "nodev";
  #boot.loader.grub.useOSProber = true;

  ## Use latest kernel
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  ## Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  ##{{- if eq .chezmoi.fqdnHostname "laptop" }}
  #services.logind = {
  #  extraConfig = "HandlePowerKey=suspend\nIdleActionSec=1800";
  #  lidSwitch = "suspend";
  #}; 
  ##{{- end }}

  ## Networking
  #networking.networkmanager.enable = true;
  #networking.firewall.allowedTCPPorts = [80 443 1401];
  #networking.firewall.allowedUDPPorts = [53 1194 1195 1196 1197 1300 1301 1302 1303 1400];
  ##{{- if eq .chezmoi.fqdnHostname "laptop" }}
  #networking.hostName = "laptop"; 
  ##{{- end }}
  #{{- if eq .chezmoi.fqdnHostname "desktop" }}
  #networking.hostName = "desktop"; 
  ##{{- end }}

  ## Set your time zone.
  #time.timeZone = "America/Los_Angeles";

  ## Select internationalisation properties.
  #i18n.defaultLocale = "en_US.UTF-8";
  #i18n.supportedLocales = [
  #  "en_US.UTF-8/UTF-8"
  #  "ja_JP.UTF-8/UTF-8"
  #];
  #i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "en_US.UTF-8";
  #  LC_IDENTIFICATION = "en_US.UTF-8";
  #  LC_MEASUREMENT = "en_US.UTF-8";
  #  LC_MONETARY = "en_US.UTF-8";
  #  LC_NAME = "en_US.UTF-8";
  #  LC_NUMERIC = "en_US.UTF-8";
  #  LC_PAPER = "en_US.UTF-8";
  #  LC_TELEPHONE = "en_US.UTF-8";
  #  LC_TIME = "en_US.UTF-8";
  #};

  # links /libexec from derivations to /run/current-system/sw 
  #environment.pathsToLink = [ "/libexec" ];

  ## Enable the X11 windowing system.
  #services.xserver.enable = true;

  ## Display manager 
  #services.xserver.displayManager.lightdm.enable = true;

  ## Window managers and Desktop environments
  ##programs.labwc.enable = true;
  ##programs.hyprland = {
  ##  xwayland.enable = true;
  ##};
  #
  ## DE/WM 
  #services.xserver.desktopManager.xterm.enable = false;
  ##services.xserver.windowManager.openbox.enable = true;
  #services.xserver.windowManager.i3.enable = true;
  ##{{- if eq .chezmoi.fqdnHostname "desktop" }}
  ##services.desktopManager.plasma6 = {
  ##  enable = true;
  ##};
  #services.xserver.desktopManager.xfce.enable = true;
  ##{{- end}}

  ## Configure keymap in X11
  #console.useXkbConfig = true;
  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #  options = "caps:super";
  #};

  ## Sound settings
  #services.pulseaudio.enable = false;
  #security.rtkit.enable = true;
  #services.pipewire = {
  #  enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
  #};

  ## input settings
  #services.libinput.enable = true;
  #i18n.inputMethod.enable = true;
  #i18n.inputMethod.type = "fcitx5";
  #i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  #services.libinput.mouse.accelProfile = "flat";
  ##services.libinput.mouse.additionalOptions = ''
  ##Option "Accel Profile Enabled" "0 1 0"
  ##'';

  # Define a user account
  #users.users.robert = {
  #  isNormalUser = true;
  #  description = "Robert Cronin";
  #  extraGroups = [ "uinput" "fuse" "docker" "networkmanager" "wheel" "uucp" "dialout" ];
  #};

  #services.udev.extraRules = ''
  #SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", GROUP="plugdev", MODE="0666"
  #'';


  #virtualisation
  #virtualisation = {
  #  containers.enable = true;
  #  docker.enable = true;
  #  podman = {
  #    enable = true;
  #    defaultNetwork.settings.dns_enabled = true;
  #  };
  #};

  ## graphics drivers related section
  ##{{- if eq .chezmoi.fqdnHostname "desktop" }}
  #services.xserver.videoDrivers = ["nvidia"];
  #hardware.nvidia = {
  #  # Modesetting is required.
  #  modesetting.enable = true;
  #  powerManagement.enable = false;
  #  powerManagement.finegrained = false;

  #  # Use the NVidia open source kernel module (not nouveu)
  #  open = false;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};
  #nixpkgs.config.cudaSupport = true;
  ##{{- end }}

  #services = {
  #  input-remapper.enable = true;
  #  syncthing = {
  #    enable = true;
  #    user = "robert";
  #    dataDir = "/home/robert/Documents";
  #    configDir = "/home/robert/.config/syncthing";
  #  };
  #  
  #  printing.enable = true;
  #  printing.drivers = [pkgs.cnijfilter2 pkgs.gutenprint];
  #  #{{- if eq .chezmoi.fqdnHostname "laptop" }}
  #  fprintd.enable = true;
  #  #{{- end }}
  #  #flatpak.enable = true;
  #  gvfs.enable = true; # Mount, trash, and other functionalities
  #  tumbler.enable = true; # Thumbnail support for images
  #  resolved.enable = true;
  #  mullvad-vpn.enable = true;
  #  blueman.enable = true;
  #  envfs.enable = true;
  #};
  #
  #security.pam.mount.fuseMountOptions = [ "user_allow_other" ];
  ##{{- if eq .chezmoi.fqdnHostname "laptop" }}
  #services.auto-cpufreq.enable = true;
  #services.auto-cpufreq.settings = {
  #  battery = {
  #    governor = "powersave";
  #    turbo = "never";
  #  };
  #  charger = {
  #    governor = "performance";
  #    turbo = "auto";
  #  };
  #};
  ##{{- end }}
  #programs.fuse.userAllowOther = true;
  #security.polkit.enable = true;
  #programs.kdeconnect.enable = true; 
  ##programs.haguichi.enable = true;
  ##networking.firewall.checkReversePath = "loose";
  ##networking.wireguard.enable = true;
  ##hardware.bluetooth = {
  ##  enable = true;
  ##  powerOnBoot = true;
  ##  settings = {
  ##    General = {
  ##      Name = "laptop_bluetooth";
  ##      ControllerMode = "dual";
  ##      FastConnectable = "true";
  ##      Experimental = "true";
  ##    };
  ##    Policy = {
  ##      AutoEnable = "true";
  ##    };
  ##  };
  ##};
  ##hardware.steam-hardware.enable = true;
  ##networking.iproute2.enable = true;
  #programs.xfconf.enable = true;

  # xdg portals
  #xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #xdg.portal.config.common.default = "*";
  
  # packages Packages
#  environment.systemPackages = with pkgs; [
#    # languages
#    python3Full
#    texliveTeTeX
#    lua
#    hugo
#    cargo
#    rustc
#    nodejs_22
#    gcc
#    
#    # Dev utils
#    vscode
#    xclip # nvim copyq integration 
#    direnv
#    gh
#    distrobox
#    direnv
#    git
#    stdenv
#    gnumake
#    tree-sitter
#    
#    # Terminal utils
#    makima
#    unrar
#    catfs
#    xdragon
#    yazi
#    bat
#    ns-usbloader
#    chezmoi
#    winePackages.unstableFull
#    protontricks
#    zoxide
#    feh
#    fzf
#    wget
#    bashmount
#    fastfetch
#    btop
#    ripgrep
#    killall
#    brightnessctl
#    vim
#    dtrx
#    unzip
#    zip
#    tmux
#    jump
#    starship
#    bash-completion
#    xorg.xmodmap
#    lazygit
#    lazydocker
#    sshfs
#    
#    # wayland
#    swaybg
#    waybar
#    wlogout
#    wofi
#    xdg-desktop-portal-hyprland
#    
#    # Fun utils
#    pipes
#    lolcat 
#    sl 
#    cmatrix
#    pipes-rs
#    cowsay
#    asciiquarium
#    ttyper
#    
#    # GUI applications
#    onedrivegui
#    xmacro
#    arduino-ide
#    system-config-printer
#    pavucontrol
#    r2modman
#    #gpick
#    alacritty
#    arandr
#    xfce.mousepad
#    xfce.xfce4-whiskermenu-plugin
#    nitrogen
#    lxappearance
#    jstest-gtk
#    copyq
#    gparted
#    xfce.thunar
#    xfce.exo
#    xfce.thunar-volman
#    xfce.thunar-archive-plugin
#    xfce.thunar-media-tags-plugin
#    
#    # Window Manager Utils
#    dunst
#    picom
#    rofi
#    trayer
#    networkmanagerapplet
#    xss-lock
#    i3status
#    i3lock
#    i3blocks
#    volumeicon
#
#    plank
#    #obconf
#    openbox-menu
#    lxqt.obconf-qt
#    tint2
#    
#    # System/other
#    pulseaudioFull
#    polybarFull
#    catppuccin-gtk
#    papirus-icon-theme
#    home-manager
#    #podman
#    #docker
#    libnotify
#    webp-pixbuf-loader
#    xfce.exo
#    poppler
#    ffmpegthumbnailer
#    libgsf
#    dex
#  ];
#  
#  nixpkgs.config.packageOverrides = pkgs: {
#    catppuccin-gtk = pkgs.catppuccin-gtk.override {
#      accents = [ "mauve" ]; # You can specify multiple accents here to outpu>
#      size = "compact";
#      tweaks = [ "normal" ]; # You can also specify multiple tweaks here
#      variant = "macchiato";
#    };
#  };

  # run unpached binaries
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [
  #  alsa-lib at-spi2-atk at-spi2-core atk cairo cups curl dbus expat fontconfig freetype fuse3 gdk-pixbuf glib gtk3 icu libGL libappindicator-gtk3 libdrm libglvnd libnotify libpulseaudio libunwind libusb1 libuuid libxkbcommon mesa nspr nss openssl pango pipewire stdenv.cc.cc systemd vulkan-loader xorg.libX11 xorg.libXScrnSaver xorg.libXcomposite xorg.libXcursor xorg.libXdamage xorg.libXext xorg.libXfixes xorg.libXi xorg.libXrandr xorg.libXrender xorg.libXtst xorg.libxcb xorg.libxkbfile xorg.libxshmfence zlib
  #];

  # font settings
  #fonts.fontDir.enable = true;
  #fonts.enableDefaultPackages = true;
  #fonts.packages = with pkgs; [
  #  noto-fonts
  #  noto-fonts-extra
  #  dejavu_fonts
  #  noto-fonts-cjk-sans
  #  noto-fonts-emoji
  #  liberation_ttf
  #  source-han-sans-japanese
  #  source-han-serif-japanese
  #  ubuntu_font_family
  #  unifont
  #  julia-mono
  #  #nerd-fonts
  #];
  #fonts.fontconfig = {
  #  antialias = true;
  #  defaultFonts = {
  #    serif = ["Ubuntu"];
  #    sansSerif = ["Ubuntu"];
  #    monospace = ["Ubuntu Source"];
  #  };
  #};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #system.stateVersion = "23.05"; # Did you read the comment?
}

