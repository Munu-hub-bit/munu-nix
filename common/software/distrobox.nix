{ config, pkgs, ... }:

{
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true; # optional, makes 'docker' command point to podman
  environment.systemPackages = with pkgs; [
    distrobox
  ];

}
