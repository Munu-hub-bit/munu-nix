{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        width = 60;
        lines = 14;
        columns = 2;
        horizontal-pad = 35;
        vertical-pad = 25;
        inner-pad = 20;
        line-height = 26;
        layer = "overlay";
        anchor = "center";
        font = "Maple Mono:size=14:weight=700";
        prompt = "";
        icons-enabled = true;
        icon-theme = "Papirus-Dark";
        terminal = "kitty -1";
        fuzzy = true;
        fuzzy-min-score = 0.25;
        hide-after-launch = true;
        exit-on-keyboard-focus-loss = true;
      };

      border = {
        radius = 20;
        width = 2;
      };

      dmenu = {
        exit-immediately-if-empty = true;
      };

      colors = {
        background        = "1a1620cc";  # translucent with blur
        text              = "e9e0e8ff";
        selection         = "4b4453dd";
        selection-text    = "f5e6ffff";
        border            = "b28effff";
        match             = "dfb8f6ff";
        selection-match   = "e7b3ffff";
      };
    };
  };
}
