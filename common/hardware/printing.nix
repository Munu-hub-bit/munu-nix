{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # For auto printer discovery:
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
