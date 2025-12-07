{ config, inputs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./software/apps.nix
    ./software/gaming.nix
    ./software/vms.nix


    ./hardware/mounts.nix
    ./hardware/network.nix
    ./hardware/system.nix
    ./hardware/nvidia.nix


    ../../common/desktop/kde/default.nix
  ];

  # Attach PC-specific Home Manager files
  home-manager.users.${user}.imports = [
    ./home-manager/default.nix
  ];
}
