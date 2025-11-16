{ config, pkgs, ... }:

{

# These are host specific settings that shouldnt go in the common config

  wayland.windowManager.hyprland.extraConfig = ''
    #mpv:
    exec-once = sh -c 'sleep 5 && /usr/bin/mpv --no-input-default-bindings --geometry=800x600+0+243 --autofit=800x600 --no-border --video-unscaled=yes --no-keepaspect --panscan=1.0 --mute=yes rtsp://admin:alex2001ducu@192.168.50.227:554/11'
  '';
}