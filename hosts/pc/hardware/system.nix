{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Switch to official Zen kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # ZENergy kernel module - needed for MangoHud AMD CPU wattage
  boot.extraModulePackages = [
    config.boot.kernelPackages.zenergy
  ];

  boot.kernelModules = [
    "zenergy"
  ];

  # Add 16 GB swap file
  swapDevices = [
    {
      device = "/swapfile";
      size = 16384; # 16 GB
    }
  ];

  # Limits to prevent system crashes and ease up on the CPU while building
  nix.settings = {
    max-jobs = 1;
    cores = 10;
  };
  # Enable CPU temperature sensors
  hardware.sensors.enable = true;
  hardware.sensors.packages = [ pkgs.lm_sensors ];
}
