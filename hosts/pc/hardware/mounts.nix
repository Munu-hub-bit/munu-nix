{ config, pkgs, ... }:

{

  #to allow ntfs drive to get mounted, otherwise error:
  boot.supportedFilesystems = [ "ntfs" ];

  #mount ssd
  fileSystems."/mnt/extras" = {
    device = "/dev/disk/by-uuid/375dfa71-e697-4a64-85a9-d721e299c482";
    fsType = "ext4";
    options = [ "nofail" "x-systemd.device-timeout=5s" ];
  };
}
