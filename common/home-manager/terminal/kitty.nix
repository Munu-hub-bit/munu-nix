{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = null;                       # use system-level kitty binary
    enableGitIntegration = false;         # optional
    shellIntegration.enableFishIntegration = true;

    # Font section (Home Manager handles this submodule cleanly)
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
      size = 11.0;
    };

    settings = {
      cursor_shape = "beam";
      cursor_trail = 1;
      window_margin_width = 21.75;
      confirm_os_window_close = 0;
      shell = "fish";
    };

    keybindings = {
      # Copy
      "ctrl+c" = "copy_or_interrupt";

      # Search (custom kitten)
      "ctrl+f"      = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
      "kitty_mod+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";

      # Scroll
      "page_up"   = "scroll_page_up";
      "page_down" = "scroll_page_down";

      # Zoom
      "ctrl+plus"        = "change_font_size all +1";
      "ctrl+equal"       = "change_font_size all +1";
      "ctrl+kp_add"      = "change_font_size all +1";
      "ctrl+minus"       = "change_font_size all -1";
      "ctrl+underscore"  = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0"           = "change_font_size all 0";
      "ctrl+kp_0"        = "change_font_size all 0";
    };

    # Any additional raw config lines can go here
    extraConfig = ''
      # Consistent padding with foot
      # window_margin_width 21.75
    '';

    # Theme (optional)
    themeFile = "cherry-midnight";

    # Custom kittens
    environment = { }; # define env vars if needed
  };

  # Install your kittens alongside config
  home.file = {
    ".config/kitty/scroll_mark.py".source = ./kitty/scroll_mark.py;
    ".config/kitty/search.py".source      = ./kitty/search.py;
  };
}
