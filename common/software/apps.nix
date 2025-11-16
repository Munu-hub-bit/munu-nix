{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Networking Tools
    wget
    curl
    nmap
    inetutils
    dnsutils
    cifs-utils

    # Filesystem & Storage Utilities 
    ntfs3g
    exfatprogs
    unrar
    usbutils
    pciutils
    gnome-disk-utility
    smartmontools
    gsmartcontrol
    parted

    # System & CLI Utilities
    git
    iw
    tree
    jq
    htop
    btop
    gnupg
    openssl
    eza
    lm_sensors
    exiftool
    kitty
    starship
    yazi
    kdePackages.kate

    # Multimedia / Audio Tools
    pavucontrol
    ffmpeg-full

    # Windows Compatibility (Wine)
    wineWowPackages.unstableFull
    winetricks
  ];

  # Neovim as default
  programs.neovim = {
    enable = true;
    defaultEditor = true;  # sets EDITOR and VISUAL globally
  };

  # Terminal defaults
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  xdg.terminal-exec = {
    enable = true;
    package = pkgs.kitty; # needed here aswell as a system package
  };

  # Proper font installation (used by Waybar, GTK, etc.)
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome
    ];
  };
}
