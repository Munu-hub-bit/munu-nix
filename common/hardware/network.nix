{ config, pkgs, lib, ... }:

{
  networking = {
    nftables.enable = true;
    networkmanager.enable = true;
    firewall.enable = true;

    # Local DNS override for the Data Importer
    extraHosts = ''
      192.168.50.185 importer.firefly
    '';
  };
}
