{ config, pkgs, lib, ... }:

{
  imports = [
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./hyprland.nix
    ./hyprshot.nix
    ./fuzzel.nix
    ./mako.nix
    ./swaylock.nix
    ./swww.nix
  ];
}
