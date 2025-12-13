{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;

    settings = {
      icons = true;
      layer = "overlay";
      anchor = "top-right";

      # ── Colors / Style (no pink) ──
      background-color = "#161217E6";  # same base as fuzzel, slight transparency
      text-color       = "#E9E0E8FF";
      border-color     = "#988BA2FF";  # neutral border (matches fuzzel border)
      border-size      = 2;
      border-radius    = 10;
      progress-color   = "over #4B454DDD";  # neutral progress bar

      # ── Font ──
      font = "Maple Mono 10";

      # ── Layout ──
      width  = 340;
      height = 95;
      padding = "10,14";
      margin = "14,18,0,0";
      outer-margin = "6,6,0,0";

      # ── Behavior ──
      default-timeout = 4000;
      ignore-timeout  = false;
      text-alignment  = "left";
      group-by = "app-name,summary";
      sort = "+time";
      format = "<b>%s</b>\\n%b";
    };
  };
}
