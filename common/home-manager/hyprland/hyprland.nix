{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null; # use system hyprland
    sourceFirst = true;

    settings = {
      #### Variables
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$filemanager" = "nemo";
      "$menu" = "fuzzel";

      #### Environment
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "QT_CURSOR_THEME,Bibata-Modern-Classic"
        "GTK_CURSOR_THEME,Bibata-Modern-Classic"
        "GTK_THEME,adw-gtk3-dark"

        "CLUTTER_BACKEND,wayland"
        "QT_QPA_PLATFORMTHEME,qtct"

        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      # Set global scale to 1
      monitor = [ ",preferred,auto,1" ];

      #### General
      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "rgba(988BA2FF)";
        resize_on_border = true;
        allow_tearing = false;
      };

      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(00000040)";
        };

          blur = {
            enabled = true;
            size = 8;
            passes = 3;
            new_optimizations = true;
            xray = true;
            ignore_opacity = true;
          };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "us";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0.5;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = false;
          disable_while_typing = false;
        };
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        font_family = "Maple Mono";
        splash_font_family = "Maple Mono";
        animate_manual_resizes = false;
        enable_swallow = false;
        focus_on_activate = true;
        vfr = 1;
        vrr = 1;
        middle_click_paste = false;
      };

      cursor = {
        no_hardware_cursors = true;
        no_warps = true;
      };

      animations = {
        enabled = true;
        bezier = [
          "expressiveFastSpatial,0.42,1.67,0.21,0.90"
          "expressiveSlowSpatial,0.39,1.29,0.35,0.98"
          "expressiveDefaultSpatial,0.38,1.21,0.22,1.00"
          "emphasizedDecel,0.05,0.7,0.1,1"
          "emphasizedAccel,0.3,0,0.8,0.15"
          "standardDecel,0,0,0,1"
          "menu_decel,0.1,1,0,1"
          "menu_accel,0.52,0.03,0.72,0.08"
        ];
        animation = [
          "windowsIn,1,3,emphasizedDecel,popin 80%"
          "windowsOut,1,2,emphasizedDecel,popin 90%"
          "windowsMove,1,3,emphasizedDecel,slide"
          "border,1,10,emphasizedDecel"
          "layersIn,1,2.7,emphasizedDecel,popin 93%"
          "layersOut,1,2.4,menu_accel,popin 94%"
          "fadeLayersIn,1,0.5,menu_decel"
          "fadeLayersOut,1,2.7,menu_accel"
          "workspaces,1,7,menu_decel,slide"
          "specialWorkspaceIn,1,2.8,emphasizedDecel,slidevert"
          "specialWorkspaceOut,1,1.2,emphasizedAccel,slidevert"
        ];
      };

      binds = {
        allow_workspace_cycles = 1;
        workspace_back_and_forth = 1;
      };

      #### Autostart
      exec-once = [
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "nm-applet &"
        "blueman-applet &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "swww-daemon"
        "swww img ~/Pictures/wallpaper.png"
        "sh -c 'sleep 2 && waybar'"
        "brave"
        "steam"
        "discord"
      ];

      #### Keybinds
      bind = [
        # Launchers
        "$mainMod, R, exec, $menu"
        "$mainMod, Return, exec, $terminal"
        "$mainMod, E, exec, $filemanager"
        "$mainMod, W, exec, brave"
        "$mainMod, K, exec, pkill waybar; waybar &"
        "$mainMod, O, exec, obsidian"
        "$mainMod, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
        "$mainMod, L, exec, swaylock"
        ", Print, exec, hyprshot -m window -m active --output ~/Pictures/Screenshots"
        "ALT, Print, exec, hyprshot -m region --output ~/Pictures/Screenshots"


        # Window actions
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, D, fullscreen, 1"
        "$mainMod, SPACE, togglefloating"
        "$mainMod, J, togglesplit"
        "$mainMod, P, pseudo"

        # Focus / move
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod CTRL, 1, movetoworkspace, 1"
        "$mainMod CTRL, 2, movetoworkspace, 2"
        "$mainMod CTRL, 3, movetoworkspace, 3"
        "$mainMod CTRL, 4, movetoworkspace, 4"
        "$mainMod CTRL, 5, movetoworkspace, 5"
        "$mainMod CTRL, 6, movetoworkspace, 6"
        "$mainMod CTRL, 7, movetoworkspace, 7"
        "$mainMod CTRL, 8, movetoworkspace, 8"
        "$mainMod CTRL, 9, movetoworkspace, 9"
        "$mainMod CTRL, 0, movetoworkspace, 10"
        "$mainMod, TAB, workspace, previous_per_monitor"
        "$mainMod, mouse:274, workspace, +1" # scroll up
        "$mainMod, mouse:275, workspace, -1" # scroll down

        # System / media
        "CTRL ALT, Delete, exec, wlogout -b 5 -T 350 -B 350"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
        "$mainMod, F8, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      #### Window rules
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # ──────── Floating utilities ────────
        "float, class:^(.blueman-manager-wrapped)$"
        "center, class:^(.blueman-manager-wrapped)$"

        "float, class:^(nm-connection-editor)$"
        "center, class:^(nm-connection-editor)$"

        "float, class:^(org.pulseaudio.pavucontrol)$"
        "center, class:^(org.pulseaudio.pavucontrol)$"

        "float, title:^(Open File)$"
        "float, title:^(Save File)$"
        "center, title:^(Open File)$"
      
        # Main window tiled
        "tile, class:^(steam)$, title:^(Steam)$"
        # All other Steam windows float
        "float, class:^(steam)$, title:^(?!Steam$).*"

        # ──────── Style tweaks ────────
        "opacity 0.9, class:^(org.kde.dolphin)$"
        "opacity 0.9, class:^(VSCodium)$"
        "opacity 0.9, class:^(vesktop|discord)$"

        # ──────── Tearing ────────
        "immediate, title:.*\.exe"
        "immediate, title:.*minecraft.*"
        "immediate, class:^(steam_app).*"
      ];

      workspace = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10"
        "special:magic,gapsout:60,gapsin:30,bordersize:5,border:true,shadow:false"
      ];

    };
  };

  #### GTK / QT theming
  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    iconTheme.name = "Papirus-Dark";
  };

  qt = {
    enable = true;
    style.name = "Adwaita-Dark";
    platformTheme.name = "qtct";
  };
}
