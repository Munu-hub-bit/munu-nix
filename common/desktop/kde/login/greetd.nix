{ config, pkgs, lib, ... }:

{
  #### Enable greetd (minimal login manager)
  services.greetd = {
    enable = true;

    settings = {
      # Text-based greeter
      default_session = {
        # tuigreet command line
        # --remember keeps last user, --asterisks hides password,
        # --no-xsession-wrapper avoids wrapper scripts,
        # --cmd launches the KDE Plasma Wayland session
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --no-xsession-wrapper --cmd startplasma-wayland";
        user = "greeter";
      };
    };
  };

  #### Make Plasma appear as a selectable session in tuigreet
  services.displayManager.sessionPackages = [ pkgs.kdePackages.plasma-workspace ];

  # Wallet is called kdewallet and using Blowfish and the same password as your user for this to work.
  # Add kwallet auto-unlock for greetd (tuigreet or gtkgreet)
  #security.pam.services.greetd = {
  #  enable = true;
  #  text = ''
  #    %PAM-1.0

  #    auth       required     pam_securetty.so
  #    auth       requisite    pam_nologin.so
  #    auth       include      system-local-login
  #    auth       optional     pam_kwallet5.so

  #    account    include      system-local-login

  #    session    include      system-local-login
  #    session    optional     pam_kwallet5.so auto_start force_run
  #  '';
  #};

  # For gnome keyring
  security.pam.services.greetd.enableGnomeKeyring = true;
  security.pam.services.greetd-tuigreet.enableGnomeKeyring = true; # if you have a custom greetd PAM profile

  #### Systemd adjustments to prevent greetd hang or TTY lockups
  systemd = {
    settings.Manager = {
      DefaultTimeoutStopSec = "10s";
    };

    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
