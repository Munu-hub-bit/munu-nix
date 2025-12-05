{ config, pkgs, ... }:

{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __NV_ENABLE_NVAPI = "1";           # DLSS + Reflex for Proton
  };
}
