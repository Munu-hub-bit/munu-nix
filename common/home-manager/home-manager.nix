{ config, pkgs, user, ... }:

{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  imports = [
    ./firefox/firefox-bookmarks.nix
    ./yazi/yazi.nix
    ./vim/neovim.nix
    ./terminal/fish.nix
    ./terminal/starship.nix
    ./wallpaperengine/linux-wallpaperengine.nix
  ];
}
