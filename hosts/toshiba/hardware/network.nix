{ config, pkgs, ... }:

{
  networking = {
    hostName = "toshiba";  # unique to each host
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];   # add per-machine exceptions (e.g., [22] for SSH)
    };
  };
}
