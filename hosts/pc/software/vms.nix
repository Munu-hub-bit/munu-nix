{ config, pkgs, user, ... }:

{
  ########################################
  ## VMware
  ########################################

  virtualisation.vmware.host.enable = true;

  ########################################
  ## VirtualBox
  ########################################

  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ user ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;


  ########################################
  ## QEMU / KVM + virt-manager
  ########################################

  # programs.virt-manager.enable = true;
  # users.groups.libvirtd.members = [ user ];
  # virtualisation.libvirtd.enable = true;
  # virtualisation.spiceUSBRedirection.enable = true;
  # environment.systemPackages = with pkgs; [
  #   qemu
  # ];
}
