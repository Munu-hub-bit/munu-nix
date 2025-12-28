{ pkgs, user, ... }:

{
  services.linux-wallpaperengine = {
    enable = true;

    assetsPath =
      "/mnt/extras/SteamLibrary/steamapps/common/wallpaper_engine/assets";

    wallpapers = [
      {
        monitor = "HDMI-A-1";

        wallpaperId =
          "/mnt/extras/SteamLibrary/steamapps/workshop/content/431960/3600029179";

        fps = 60;

        audio = {
          silent = true;
          automute = true;
          processing = false;
        };
      }

      {
        monitor = "DP-1";

        wallpaperId =
          "/mnt/extras/SteamLibrary/steamapps/workshop/content/431960/3538825305";
      }
    ];
  };
}
