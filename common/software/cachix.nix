# https://qtwebengine-5-15-19.cachix.org is made by me, it only contains the following:
# /nix/store/7dz31px40l26rjkjlricz68qmviwd0jj-qtwebengine-5.15.19   223.77 MiB
# /nix/store/zv6vcjqk7kwmv00201qrr0pwqca5lxpi-qtwebengine-5.15.19-bin   1.75 MiB

{ config, pkgs, ... }:

{
  nix.settings = {
    substituters = [ "https://qtwebengine-5-15-19.cachix.org" ];
    trusted-public-keys = [
      "qtwebengine-5-15-19.cachix.org-1:ij/MX/V4ZfmfzTU6SUgcd7ciQ5inxhPakkgYKAb+/9w="
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19" #for teamspeak3
  ];
}
