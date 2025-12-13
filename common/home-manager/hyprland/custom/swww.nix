{ config, pkgs, ... }:

{
  services.swww = {
    enable = true;
    package = pkgs.swww;
    extraArgs = [ "--no-cache" ];
  };

  # start swww-daemon in your compositor (Hyprland or Niri)
  # and call this once after login:
  #
  #   swww img ~/Pictures/wallpaper.png
}
