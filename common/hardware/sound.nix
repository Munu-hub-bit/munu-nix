{ config, pkgs, ... }:

{
  # Sound system
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Balanced latency: smooth, low delay, no crackle
    extraConfig = {
      pipewire."92-balanced-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [ 44100 48000 96000 ];
          "default.clock.quantum" = 1024;        
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 1024;
          "default.clock.quantum-limit" = 1024;
        };
      };

      pipewire-pulse."92-balanced-latency" = {
        "stream.properties" = {
          "node.latency" = "512/48000";         # Match main buffer
          "resample.quality" = 4;               # Balanced quality/performance
        };
      };
    };
  };

  # Prevent speaker pop/crackle
  boot.kernelModules = [ "snd_hda_intel" ];
  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';

  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
}
