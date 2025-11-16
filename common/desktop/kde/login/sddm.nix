{ config, pkgs, ... }:

let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "purple_leaves";
  };

in {
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
    autoNumlock = true;
    #enableHidpi = true;
    theme = "sddm-astronaut-theme";
    settings = {
      Theme = {
        Current = "sddm-astronaut-theme";
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
    extraPackages = with pkgs; [
      custom-sddm-astronaut
    ];
  };

  # Wallet is called kdewallet and using Blowfish and the same password as your user for this to work.
  # Optional, but explicit
  #security.pam.services.sddm.kwallet.enable = true;
  # For autologin
  #security.pam.services.sddm.kwallet.forceRun = true;

  # For gnome keyring
  security.pam.services.sddm.enableGnomeKeyring = true;
  #security.pam.services.sddm-autologin.enableGnomeKeyring = true; # optional


  environment.systemPackages = with pkgs; [
    custom-sddm-astronaut
    kdePackages.qtmultimedia
    kdePackages.qtsvg
  ];
}
