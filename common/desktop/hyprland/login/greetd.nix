{ config, pkgs, lib, ... }:

{
  #### Enable greetd (minimal login manager)
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        # tuigreet command line
        # --remember keeps last user, --asterisks hides password,
        # --no-xsession-wrapper avoids wrapper scripts,
        # --cmd launches the session (Hyprland)
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --no-xsession-wrapper --cmd Hyprland";
        user = "greeter"; # special non-privileged user greetd runs under
      };
    };
  };

  #### Make Hyprland appear as a selectable session in tuigreet
  services.displayManager.sessionPackages = [ pkgs.hyprland ];

  #### Systemd adjustments to prevent greetd hang or TTY lockups
  systemd = {
    settings.Manager.DefaultTimeoutStopSec = "10s";

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
