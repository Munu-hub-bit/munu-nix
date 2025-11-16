{ config, inputs, user,... }:

{
  imports = [
    ./hardware-configuration.nix

    ./software/apps.nix
    ./software/flatpaks.nix


    ./hardware/network.nix
    ./hardware/system.nix


     ../../common/desktop/niri/default.nix
  ];

  # Attach PC-specific Home Manager files
  home-manager.users.${user}.imports = [
    ./home-manager/default.nix
  ];
}
