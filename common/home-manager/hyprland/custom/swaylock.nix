{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = null; # has blur, images, etc.

    settings = {
      # ──────────────── Background ────────────────
      image = "${config.home.homeDirectory}/Pictures/wallpaper.png";
      scaling = "fill";       # stretch to fit display
      color = "1A171C";       # fallback background (same as your @background)

      # ──────────────── Text & Font ────────────────
      font = "Inter Variable";
      font-size = 30;
      indicator-idle-visible = true;
      show-failed-attempts = false;

      # ──────────────── Ring / Indicator ────────────────
      ring-color = "b7bdf8";          # accent-soft
      ring-ver-color = "a6e3a1";      # ok
      ring-wrong-color = "ed8796";    # warn
      ring-clear-color = "c6a0f6";    # accent
      key-hl-color = "c6a0f6";
      inside-color = "2A2430";        # surface
      text-color = "e9e0e8";          # text

      timestr = "%H:%M";
      datestr = "%d/%m/%y";  # simple date format
      clock = true;

      indicator-radius = 110;
      indicator-thickness = 12;

      # ──────────────── Visuals ────────────────
      effect-blur = "8x4";   # optional blur
      effect-vignette = "0.5:0.5";
    };
  };

}
