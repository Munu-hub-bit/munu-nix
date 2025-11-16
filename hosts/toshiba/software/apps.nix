{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    chromium
    mpv
    haruna
    spotify
    vesktop
    libreoffice-fresh
    qbittorrent
    anydesk
    #teamspeak3
    obsidian
  ];
}
