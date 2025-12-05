{ config, pkgs, lib, ... }:

{
  services.greetd.enable = true;

  services.greetd.settings = {
    default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --cmd 'gnome-session'";
      user = "greeter";
    };
  };
  
}