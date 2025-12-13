{ config, inputs, user, ... }:

{
    imports = [
        ./login/greetd.nix
        ./hyprland.nix
    ];


# Attach hyprland Home Manager configs only when this desktop is active
  home-manager.users.${user}.imports = [
    # Main hyprland config
    ../../home-manager/hyprland/hyprland.nix

    # Choose what dotfiles to use (custom or noctalia)
    #../../home-manager/hyprland/custom/default.nix
    ../../home-manager/hyprland/noctalia/default.nix
  ];

}
