{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Use GNOME Keyring instead of KDE Wallet
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;  # for TTY or fallback logins

  environment.variables.QT_QPA_PLATFORMTHEME = "kde";
  
  # Set kitty as default
  environment.etc."xdg/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop
  '';


  environment.systemPackages = with pkgs; [
    seahorse
    papirus-icon-theme
    kdePackages.sddm-kcm
    libunity
    kdePackages.kate
    kdePackages.qtstyleplugin-kvantum
    kdePackages.plasma-firewall
    plasma-panel-colorizer
    kdePackages.dolphin-plugins
    kdePackages.kcalc
  ];
}
