{ config, pkgs, lib, user, ... }:

{
  # Enable only the GDM login manager
  services.displayManager.gdm.enable = true;

  # Optional: automatic login (uses your flake-level `user`)
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = user;

  # GDM needs the user's shell to be listed in /etc/shells
  environment.shells = with pkgs; [
    fish
    bashInteractive
  ];
}
