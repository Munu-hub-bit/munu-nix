{ config, pkgs, ... }:

{
  # Enable Flatpak system-wide
  services.flatpak.enable = true;

  # Add Flathub repo globally
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
