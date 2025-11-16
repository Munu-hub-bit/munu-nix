{ config, pkgs, lib, ... }:

{
  imports = [
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./niri/niri.nix
    ./fuzzel.nix
    ./mako.nix
    ./swaylock.nix
    ./swww.nix
  ];
}
