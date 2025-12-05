{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── KDE Plasma Core ──────────────────────────────
  # Wayland is the default. No need to enable X11.
  services.desktopManager.plasma6.enable = true;

  # Authentication
  security.polkit.enable = true;

  # Use GNOME Keyring instead of KDE Wallet
  services.gnome.gnome-keyring.enable = true;

  # Ensure PAM uses GNOME Keyring for TTY + login managers
  security.pam.services.login.enableGnomeKeyring = true;

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "dolphin.desktop" ];
      "x-directory/normal" = [ "dolphin.desktop" ];
    };
  };

  # ────────────────────────────── System Packages ──────────────────────────────
  environment.systemPackages = with pkgs; [
    ## Core tools you like
    axel
    bc
    ripgrep
    libqalculate
    libnotify
    playerctl
    brightnessctl
    ddcutil
    wireplumber
    networkmanager
    easyeffects
    wl-clipboard
    upower
    tesseract
    imagemagick

    ## Screenshots & screen capture (KDE-aware)
    grim
    slurp
    swappy
    wf-recorder

    ## Terminals / app launchers
    alacritty
    foot
    fuzzel

    ## Media
    mpv
    mpvpaper

    ## Clipboard & input utilities
    cliphist
    ydotool
    wtype

    ## File management / GUI tools
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.plasma-systemmonitor
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.plasma-firewall
    kdePackages.systemsettings
    kdePackages.plasma-workspace

    ## Theming
    bibata-cursors
    papirus-icon-theme
    kdePackages.qtstyleplugin-kvantum

    ## Extra KDE Utilities
    seahorse
    libunity
    plasma-panel-colorizer
    kdePackages.sddm-kcm
  ];

  # ────────────────────────────── Fonts ──────────────────────────────
  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    material-symbols
    rubik
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.mononoki
    nerd-fonts.space-mono
    maple-mono.Normal-NF
  ];

  # ────────────────────────────── File Management Services ──────────────────────────────
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # ────────────────────────────── KDE Globals (Terminal preference) ─────────────────────
  environment.etc."xdg/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop
  '';
}
