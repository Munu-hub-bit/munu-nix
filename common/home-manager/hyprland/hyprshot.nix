{ config, pkgs, ... }:

{
  programs.hyprshot = {
    enable = true;
    package = pkgs.hyprshot;
    saveLocation = "$HOME/Pictures/Screenshots";
  };
}
