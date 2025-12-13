{ config, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    #systemd.enable = true;

    settings = {
      appLauncher = {
        position = "center";
        viewMode = "list";
        showCategories = true;
        sortByMostUsed = true;
        enableClipPreview = true;
        enableClipboardHistory = false;
        terminalCommand = "kitty -e";
        useApp2Unit = false;
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        pinnedExecs = [ ];
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        visualizerType = "linear";
        visualizerQuality = "high";
        cavaFrameRate = 30;
        externalMixer = "pwvucontrol || pavucontrol";
        preferredPlayer = "";
        mprisBlacklist = [ ];
      };

      bar = {
        position = "top";
        density = "default";
        showCapsule = false;
        backgroundOpacity = 1;
        capsuleOpacity = 1;
        exclusive = true;
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        outerCorners = true;
        monitors = [ ];

        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
              icon = "noctalia";
              enableColorization = false;
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
            }
            {
              id = "SystemMonitor";
              diskPath = "/";
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              showMemoryAsPercent = false;
              showDiskUsage = true;
              showNetworkStats = false;
              usePrimaryColor = false;
            }
            {
              id = "CustomButton";
              icon = "temperature";
              hideMode = "alwaysExpanded";
              showIcon = true;
              textCommand = ''
                sh -c 'v=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1); echo "GPU: ${v}°C"'
              '';
              textIntervalMs = 3000;
              textStream = false;
              parseJson = false;
              textCollapse = "";
              maxTextLength = {
                horizontal = 10;
                vertical = 10;
              };
              leftClickExec = "";
              leftClickUpdateText = false;
              middleClickExec = "";
              middleClickUpdateText = false;
              rightClickExec = "";
              rightClickUpdateText = false;
              wheelMode = "unified";
              wheelExec = "";
              wheelUpdateText = false;
              wheelUpExec = "";
              wheelUpUpdateText = false;
              wheelDownExec = "";
              wheelDownUpdateText = false;
            }
          ];

          center = [
            {
              id = "Workspace";
              labelMode = "none";
              hideUnoccupied = false;
              showLabelsOnlyWhenOccupied = true;
              characterCount = 2;
              showApplications = false;
              followFocusedScreen = false;
              colorizeIcons = false;
            }
          ];

          right = [
            {
              id = "MediaMini";
              hideMode = "hidden";
              hideWhenIdle = false;
              maxWidth = 145;
              scrollingMode = "hover";
              showAlbumArt = false;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
              useFixedWidth = false;
              visualizerType = "linear";
            }
            { id = "Microphone"; displayMode = "onhover"; }
            { id = "Volume"; displayMode = "onhover"; }
            { id = "Spacer"; width = 3; }
            {
              id = "Tray";
              hidePassive = true;
              drawerEnabled = false;
              colorizeIcons = false;
              blacklist = [ "nm-applet" "blueman*" ];
              pinned = [ ];
            }
            { id = "WiFi"; displayMode = "onhover"; }
            { id = "Bluetooth"; displayMode = "onhover"; }
            {
              id = "Clock";
              formatHorizontal = "HH:mm\ndd.MM.yyyy";
              formatVertical = "HH mm";
              usePrimaryColor = true;
              useCustomFont = false;
              customFont = "";
            }
          ];
        };
      };

      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };

      calendar.cards = [
        { id = "calendar-header-card"; enabled = true; }
        { id = "calendar-month-card"; enabled = true; }
        { id = "timer-card"; enabled = true; }
        { id = "weather-card"; enabled = true; }
      ];

      colorSchemes = {
        predefinedScheme = "Monochrome";
        darkMode = true;
        schedulingMode = "off";
        useWallpaperColors = false;
        generateTemplatesForPredefined = true;
        matugenSchemeType = "scheme-fruit-salad";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      controlCenter = {
        position = "close_to_bar_button";

        shortcuts = {
          left = [
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            { id = "ScreenRecorder"; }
            { id = "WallpaperSelector"; }
          ];
          right = [
            { id = "Notifications"; }
            { id = "PowerProfile"; }
            { id = "KeepAwake"; }
            { id = "NightLight"; }
          ];
        };

        cards = [
          { id = "profile-card"; enabled = true; }
          { id = "shortcuts-card"; enabled = true; }
          { id = "audio-card"; enabled = true; }
          { id = "weather-card"; enabled = true; }
          { id = "media-sysmon-card"; enabled = true; }
        ];
      };

      general = {
        avatarImage = "${config.home.homeDirectory}/.face";
        radiusRatio = 0.2;
        dimmerOpacity = 0.6;
        enableShadows = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        lockOnSuspend = true;
        allowPanelsOnScreenWithoutBar = true;
        animationSpeed = 1;
        animationDisabled = false;
      };

      location = {
        name = "Timisoara, Romania";
        weatherEnabled = true;
        weatherShowEffects = true;
        showCalendarEvents = true;
        showCalendarWeather = true;
        use12hourFormat = false;
        useFahrenheit = false;
        firstDayOfWeek = -1;
      };

      nightLight = {
        enabled = true;
        autoSchedule = true;
        nightTemp = "2993";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      ui = {
        fontDefault = "Maple Mono Normal NF";
        fontFixed = "JetBrainsMono Nerd Font";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        tooltipsEnabled = true;
        panelBackgroundOpacity = 1;
      };

      wallpaper = {
        enabled = true;
        directory = "${config.home.homeDirectory}/Pictures/";
        fillMode = "crop";
        fillColor = "#000000";
        setWallpaperOnAllMonitors = true;
        transitionType = "random";
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        randomEnabled = false;
      };
    };
  };
}
