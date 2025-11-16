{ config, pkgs, ... }:

{
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    protonup-qt
    lutris
    heroic
  ];

  environment.sessionVariables = {
    # Steam custom Proton paths
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
