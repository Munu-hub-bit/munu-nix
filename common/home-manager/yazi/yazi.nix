{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = null; # use system binary
    enableFishIntegration = true;

    # ── Companion tools ──
    extraPackages = with pkgs; [
      fd
      ripgrep
      file
      exiftool
      ouch
      glow
    ];

    # ── Plugins ──
    plugins = {
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      vcs-files    = pkgs.yaziPlugins.vcs-files;
      toggle-pane  = pkgs.yaziPlugins.toggle-pane;
      sudo         = pkgs.yaziPlugins.sudo;
      starship     = pkgs.yaziPlugins.starship;
      smart-paste  = pkgs.yaziPlugins.smart-paste;
      smart-filter = pkgs.yaziPlugins.smart-filter;
      smart-enter  = pkgs.yaziPlugins.smart-enter;
      rsync        = pkgs.yaziPlugins.rsync;
      rich-preview = pkgs.yaziPlugins.rich-preview;
      restore      = pkgs.yaziPlugins.restore;
      recycle-bin  = pkgs.yaziPlugins.recycle-bin;
      piper        = pkgs.yaziPlugins.piper;
      ouch         = pkgs.yaziPlugins.ouch;
      mount        = pkgs.yaziPlugins.mount;
      mime-ext     = pkgs.yaziPlugins.mime-ext;
      mediainfo    = pkgs.yaziPlugins.mediainfo;
      lsar         = pkgs.yaziPlugins.lsar;
      lazygit      = pkgs.yaziPlugins.lazygit;
      glow         = pkgs.yaziPlugins.glow;
      gitui        = pkgs.yaziPlugins.gitui;
      git          = pkgs.yaziPlugins.git;
      full-border  = pkgs.yaziPlugins.full-border;
      dupes        = pkgs.yaziPlugins.dupes;
      duckdb       = pkgs.yaziPlugins.duckdb;
      chmod        = pkgs.yaziPlugins.chmod;
      miller       = pkgs.yaziPlugins.miller;
    };

    # ── Core behaviour ──
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dir_first = true;
        linemode = "size_and_mtime";
      };
    };

    # ── Custom Lua ──
    initLua = ''
      function Linemode:size_and_mtime()
        local time = math.floor(self._file.cha.mtime or 0)
        local formatted
        if time == 0 then
          formatted = ""
        elseif os.date("%Y", time) == os.date("%Y") then
          formatted = os.date("%b %d %H:%M", time)
        else
          formatted = os.date("%b %d  %Y", time)
        end

        local size = self._file:size()
        return string.format("%s %s", size and ya.readable_size(size) or "-", formatted)
      end
    '';

    # ── Theme ──
    theme = {
      mgr = {
        cwd = { fg = "#E9E0E8"; };

        tab_active = { fg = "#D5BAFF"; bg = "#2A2430"; bold = true; };
        tab_inactive = { fg = "#B3A9BA"; bg = "#1A171C"; };
        tab_width = 1;

        find_keyword = { fg = "#8AADF4"; bold = true; italic = true; underline = true; };
        find_position = { fg = "#8AADF4"; bold = true; italic = true; };

        marker_copied = { fg = "#8AADF4"; bg = "#8AADF4"; };
        marker_cut = { fg = "#A6ADC8"; bg = "#A6ADC8"; };
        marker_marked = { fg = "#B7BDF8"; bg = "#B7BDF8"; };
        marker_selected = { fg = "#C6A0F6"; bg = "#C6A0F6"; };

        count_copied = { fg = "#161217"; bg = "#8AADF4"; };
        count_cut = { fg = "#161217"; bg = "#A6ADC8"; };
        count_selected = { fg = "#161217"; bg = "#C6A0F6"; };

        border_symbol = "│";
        border_style = { fg = "#4B454D"; };
      };

      status = {
        separator_open = "🭁";
        separator_close = "🭠";
        separator_style = { bg = "#2A2430"; fg = "#8AADF4"; };
      };

      mode = {
        normal_main = { bg = "#2A2430"; fg = "#C6A0F6"; bold = true; };
        normal_alt = { bg = "#1A171C"; fg = "#E9E0E8"; };

        select_main = { bg = "#3A2F4A"; fg = "#E9E0E8"; bold = true; };
        select_alt = { bg = "#1A171C"; fg = "#B3A9BA"; };

        unset_main = { bg = "#3A2F4A"; fg = "#E9E0E8"; bold = true; };
        unset_alt = { bg = "#1A171C"; fg = "#B3A9BA"; };
      };

      progress_normal = { fg = "#8AADF4"; bg = "#2A2430"; };
      progress_error = { fg = "#ED8796"; bg = "#2A2430"; };
      progress_label = { bold = true; };

      permissions_r = { fg = "#8AADF4"; };
      permissions_w = { fg = "#C6A0F6"; };
      permissions_x = { fg = "#A6E3A1"; };
      permissions_t = { fg = "#F9E2AF"; };
      permissions_s = { fg = "#B7BDF8"; };

      select = {
        border = { fg = "#4B454D"; };
        active = { fg = "#C6A0F6"; bold = true; };
        inactive = {};
      };

      input = {
        border = { fg = "#4B454D"; };
        value = { fg = "#E9E0E8"; };
      };

      completion = {
        border = { fg = "#4B454D"; bg = "#2A2430"; };
      };

      tasks = {
        border = { fg = "#4B454D"; };
        hovered = { fg = "#C6A0F6"; underline = true; };
      };

      which = {
        cols = 3;
        mask = { bg = "#1A171C"; };
        cand = { fg = "#C6A0F6"; };
        rest = { fg = "#E9E0E8"; };
        desc = { fg = "#B3A9BA"; };
        separator = " ▶ ";
        separator_style = { fg = "#4B454D"; };
      };

      help = {
        on = { fg = "#E9E0E8"; };
        run = { fg = "#E9E0E8"; };
        footer = { fg = "#161217"; bg = "#C6A0F6"; };
      };

      notify = {
        title_info = { fg = "#8AADF4"; };
        title_warn = { fg = "#F9E2AF"; };
        title_error = { fg = "#ED8796"; };
      };

      filetype.rules = [
        { mime = "image/*"; fg = "#94E2D5"; }
        { mime = "{audio,video}/*"; fg = "#F9E2AF"; }
        { mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,archive}"; fg = "#B7BDF8"; }
        { mime = "application/{pdf,doc,rtf}"; fg = "#A6E3A1"; }
        { name = "*"; fg = "#E9E0E8"; }
        { name = "*/"; fg = "#C6A0F6"; bold = true; }
      ];
    };
  };
}
