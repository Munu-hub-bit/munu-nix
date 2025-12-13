{ config, pkgs, ... }:

{
  home.file.".config/wlogout/icons".source =
  ./icons;

  programs.wlogout = {
    enable = true;
    package = null;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "sleep";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "h";
      }
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "cancel";
        action = "exit";     # built-in, closes wlogout instantly
        text = "Cancel";
        keybind = "Escape";
      }
    ];

    style = ''
      /*───────────────────────────────
        Waybar-style palette
      ───────────────────────────────*/
      @define-color background   #1A171C;
      @define-color surface      #2A2430;
      @define-color accent       #C6A0F6;
      @define-color accent-soft  #B7BDF8;
      @define-color text         #E9E0E8;
      @define-color subtext      #B3A9BA;
      @define-color warn         #ED8796;
      @define-color ok           #A6E3A1;

      /*───────────────────────────────
        Window
      ───────────────────────────────*/
      window {
        font-family: Maple Mono;
        font-size: 16pt;
        color: @text;
        background-color: alpha(@surface, 0.85);
      }

      /*───────────────────────────────
        Buttons
      ───────────────────────────────*/
      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: transparent;
        transition: all 0.3s ease-in;
        box-shadow: 0 0 10px 2px transparent;
        border-radius: 36px;
        margin: 10px;
        border: 1.5px solid @accent-soft;
        color: @text;
      }

      button:focus {
        box-shadow: none;
        outline-style: none;
        background-size: 20%;
      }

      /*───────────────────────────────
        Hover: icon enlarges, text fades out
      ───────────────────────────────*/
      button:hover {
        background-size: 50%;
        outline-style: none;
        box-shadow: 0 0 10px 3px rgba(198,160,246,0.3);
        background-color: @accent;
        color: @background;
        border-color: @accent;
        transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
      }

      /* hide text smoothly on hover */
      button label {
        opacity: 1.0;
        transition: opacity 0.25s ease-in-out;
      }
      button:hover label {
        opacity: 0.0;
      }

      /*───────────────────────────────
        Icons
      ───────────────────────────────*/
      #shutdown {
        background-image: image(url("./icons/power.png"));
      }
      #shutdown:hover {
        background-image: image(url("./icons/power-hover.png"));
      }

      #logout {
        background-image: image(url("./icons/logout.png"));
      }
      #logout:hover {
        background-image: image(url("./icons/logout-hover.png"));
      }

      #reboot {
        background-image: image(url("./icons/restart.png"));
      }
      #reboot:hover {
        background-image: image(url("./icons/restart-hover.png"));
      }

      #lock {
        background-image: image(url("./icons/lock.png"));
      }
      #lock:hover {
        background-image: image(url("./icons/lock-hover.png"));
      }

      #sleep {
        background-image: image(url("./icons/hibernate.png"));
      }
      #sleep:hover {
        background-image: image(url("./icons/hibernate-hover.png"));
      }

    '';
  };
}

