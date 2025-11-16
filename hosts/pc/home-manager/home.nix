{ config, pkgs, ... }:

{
  #WALLPAPER
  home.file."Pictures/wallpaper.png".source = ../../../assets/wallpaper.png;
  #home.file."Pictures/wallpaper.png".force = true;

}
