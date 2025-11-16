{ config, pkgs, lib, ... }:

{
  #### Enable LightDM as the display manager
  services.xserver.displayManager.lightdm.enable = true;

  #### Default session (plasma, plasmax11, steam)
  services.displayManager.defaultSession = "plasma";

  # Wallet is called kdewallet and using Blowfish and the same password as your user for this to work.
  # Enable kwallet auto-unlock for LightDM sessions
  #security.pam.services.lightdm.kwallet.enable = true;

  # If you ever use autologin, also make sure kwallet starts
  #security.pam.services.lightdm.kwallet.forceRun = true;

  # For gnome keyring
  security.pam.services.lightdm.enableGnomeKeyring = true;

  #### Slick greeter configuration
  services.xserver.displayManager.lightdm.greeters.slick = {
    enable = true;

    theme = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
    };
  };

  #### Optional LightDM tweaks
  services.xserver.displayManager.lightdm.extraConfig = ''
    [Seat:*]
    greeter-hide-users=false
    greeter-show-manual-login=true
    allow-guest=false
  '';
}
