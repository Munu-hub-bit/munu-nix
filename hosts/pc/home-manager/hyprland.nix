{ config, pkgs, ... }:

{

# These are host specific settings that shouldnt go in the common config

  wayland.windowManager.hyprland.extraConfig = ''
    # ──────── Monitor layout ────────
    monitor = DP-1,2560x1440@180,0x0,1.2, vrr, 0 
    monitor = HDMI-A-1,1920x1200@60,-1920x0,1, vrr, 0 

    # ───── Workspaces ─────
    # Monitor 1: HDMI-A-1 → workspaces 1-5
    workspace = 6, monitor:HDMI-A-1, persistent:true, default:true
    workspace = 7, monitor:HDMI-A-1, persistent:true
    workspace = 8, monitor:HDMI-A-1, persistent:true
    workspace = 9, monitor:HDMI-A-1, persistent:true
    workspace = 10, monitor:HDMI-A-1, persistent:true

    # Monitor 2: DP-1 → workspaces 6-10
    workspace = 1, monitor:DP-1, persistent:true
    workspace = 2, monitor:DP-1, persistent:true
    workspace = 3, monitor:DP-1, persistent:true
    workspace = 4, monitor:DP-1, persistent:true
    workspace = 5, monitor:DP-1, persistent:true, default:true

    # ──────── Window rules ────────
    # All Steam UI (main window, friends list, etc.)
    #windowrulev2 = workspace 4, class:^(steam)$

    # Steam games
   # windowrulev2 = workspace 5, class:^(steam_app.*)$
  '';
}
