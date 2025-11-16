{ config, pkgs, ... }:

{
  #WALLPAPER
  home.file."Pictures/wallpaper.png".source = ../../../assets/image.png;
  #home.file."Pictures/wallpaper.png".force = true;

}
