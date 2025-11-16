{ config, pkgs, ... }:

{
  networking = {
    hostName = "pc";
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];   # add per-machine exceptions (e.g., [22] for SSH)
    };
  };
}
