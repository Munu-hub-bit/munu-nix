{ config, pkgs, ... }:

{
  networking = {
    hostName = "pc";

    networkmanager.enable = true;
    wireless.enable = false;  # disable old wpa_supplicant conflicts

    firewall.enable = true;

    # Optional local DNS override
    extraHosts = ''
      192.168.50.185 importer.firefly
    '';
  };

  # Ensure all firmware is available for Wi-Fi cards
  hardware.enableAllFirmware = true;
  services.udev.packages = [ pkgs.linux-firmware ];

  # Optional: once we know your Wi-Fi driver
  # boot.kernelModules = [ "iwlwifi" ];
}
