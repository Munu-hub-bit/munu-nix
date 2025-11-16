{ config, inputs, user, ... }:

{
    imports = [
        ./niri.nix
        ./login/greetd.nix
    ];


# Attach Niri Home Manager configs only when this desktop is active
  home-manager.users.${user}.imports = [
    ../../home-manager/niri/default.nix
  ];
}
