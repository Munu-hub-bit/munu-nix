{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── GNOME Core ──────────────────────────────
  services.desktopManager.gnome.enable = true;

  # Authentication
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "x-directory/normal" = [ "nemo.desktop" ];
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

    ## Screenshots & screen capture
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
    nemo-with-extensions
    gnome-disk-utility
    gnome-system-monitor

    ## Theming
    adw-gtk3
    bibata-cursors
    papirus-icon-theme

    ## GNOME Stuff
    gnome-tweaks
    gnome-browser-connector

    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock #idk maybe use the other one
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.vitals
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
}
