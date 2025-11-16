# Desktop folder is imported in the default.nix of the specific machine, not here

{ config, inputs, ... }:

{
  imports = [
    ./software/apps.nix
    ./software/cachix.nix
    ./software/distrobox.nix
    ./software/firefox.nix


    ./hardware/bluetooth.nix
    ./hardware/graphics.nix
    ./hardware/locale.nix
    ./hardware/system.nix
    ./hardware/network.nix
    ./hardware/printing.nix
    ./hardware/sound.nix
    ./hardware/user.nix
    ./hardware/system-hardening.nix
    ./hardware/network-hardening.nix


    ./home-manager/default.nix
  ];
}
