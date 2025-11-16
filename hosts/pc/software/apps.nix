{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    haruna
    spotify
    brave
    qbittorrent
    libreoffice-fresh
    discord
    discord-canary
    vesktop
    filen-desktop
    #teamspeak3
    obsidian
    #feishin

    # from external personal flake
    #personal.blender-bin
    #personal.gmodpatchtool-bin
  ];
}
