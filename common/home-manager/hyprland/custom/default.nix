{ config, pkgs, lib, ... }:

{
  imports = [
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./hyprsunset.nix
    ./fuzzel.nix
    ./rofi.nix
    ./mako.nix
    ./swaylock.nix
    ./swww.nix
  ];
}
