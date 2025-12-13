{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    # ---- REAL rofi plugins ONLY ----
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-nerdy
      rofi-games
      rofi-top
      rofi-blezz
    ];

    # ---- Core behavior / modes ----
    extraConfig = {
      # systemd REMOVED (not a real mode)
      modi = "drun,run,window,ssh,calc,emoji,nerdy,games,top,blezz";

      show-icons = true;
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";

      hover-select = true;
      me-select-entry = "MouseSecondary";
      me-accept-entry = "MousePrimary";

      font = "MesloLGSDZ Nerd Font 10";
      terminal = "ghostty";
      dpi = 96;
    };

    # ---- Theme ----
    theme = {

      "*" = {
        background = mkLiteral "#0d1117";
        foreground = mkLiteral "#e6edf3";

        color0  = mkLiteral "#0d1117";
        color1  = mkLiteral "#ff7b72";
        color2  = mkLiteral "#7ee787";
        color3  = mkLiteral "#ffa657";
        color4  = mkLiteral "#58a6ff";
        color8  = mkLiteral "#1c2128";
        color12 = mkLiteral "#79c0ff";

        bg         = mkLiteral "@background";
        fg         = mkLiteral "@foreground";
        bg-alt     = mkLiteral "@color8";
        fg-dim     = mkLiteral "#7d8590";

        accent     = mkLiteral "@color4";
        accent-alt = mkLiteral "@color12";

        background-color = mkLiteral "@bg";
        text-color       = mkLiteral "@fg";
        border-color     = mkLiteral "@accent";
      };

      window = {
        background-color = mkLiteral "@bg";
        border = 2;
        border-radius = 16;
        border-color = mkLiteral "@accent";
        width = mkLiteral "750px";
      };

      mainbox = {
        children = map mkLiteral [ "inputbar" "listbox" ];
        padding = mkLiteral "20px";
        background-color = mkLiteral "transparent";
      };

      inputbar = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "@bg-alt";
        border = 1;
        border-radius = 12;
        border-color = mkLiteral "rgba(88,166,255,0.25)";
        padding = mkLiteral "16px 20px";
      };

      prompt = {
        text-color = mkLiteral "@accent";
      };

      entry = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
        placeholder = "Search…";
        placeholder-color = mkLiteral "@fg-dim";
      };

      listbox = {
        children = map mkLiteral [ "listview" ];
        background-color = mkLiteral "transparent";
      };

      listview = {
        columns = 2;
        lines = 5;
        cycle = true;
        scrollbar = true;
        spacing = mkLiteral "8px";
        background-color = mkLiteral "transparent";
      };

      element = {
        background-color = mkLiteral "@bg-alt";
        text-color = mkLiteral "@fg";
        border-radius = 10;
        padding = mkLiteral "14px";
      };

      "element selected.normal" = {
        background-color = mkLiteral "rgba(88,166,255,0.20)";
        text-color = mkLiteral "@accent-alt";
        border-color = mkLiteral "@accent";
      };

      element-icon = {
        size = mkLiteral "36px";
      };
    };
  };

  # ---- Script-based rofi tools (run directly) ----
  home.packages = with pkgs; [
    rofi-systemd
    rofi-bluetooth
    rofi-network-manager
    rofi-pulse-select
    rofi-power-menu
    rofi-screenshot
    rofi-file-browser
    rofi-mpd
    rofi-menugen
    rofimoji
    rofi-obsidian
  ];

  # ---- Optional rofi-systemd config (from README) ----
  home.sessionVariables = {
    ROFI_SYSTEMD_TERM = "kitty";
    # ROFI_SYSTEMD_DEFAULT_ACTION = "restart";
  };
}
