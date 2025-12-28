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
          "/mnt/extras/SteamLibrary/steamapps/workshop/content/431960/3420616562";

        fps = 30;

        audio = {
          silent = true;
          automute = true;
          processing = false;
        };
      }

      {
        monitor = "DP-1";

        wallpaperId =
          "/mnt/extras/SteamLibrary/steamapps/workshop/content/431960/3445942378";
      }
    ];
  };
}
