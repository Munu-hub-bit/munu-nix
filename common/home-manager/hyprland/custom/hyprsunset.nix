{ config, lib, pkgs, ... }:

{
  services.hyprsunset = {
    enable = true;

    settings = {
      profile = [
        {
          time = "07:30";
          temperature = 6000;  # daytime (neutral-ish)
        }
        {
          time = "21:00";
          temperature = 3000;  # warm/orange for evening
        }
      ];
    };
  };
}
