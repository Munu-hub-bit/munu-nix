{ config, pkgs, ... }:

{
  #SET DRAWING TABLET BINDS
  home.file.".config/kcminputrc".source = ../../../assets/kcminputrc;
  #home.file.".config/kcminputrc".force = true;

  #WALLPAPER
  home.file."Pictures/wallpaper.png".source = ../../../assets/wallpaper.png;
  #home.file."Pictures/wallpaper.png".force = true;
}
