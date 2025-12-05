{ config, inputs, ... }:

{
    imports = [
        ./gnome.nix
        ./login/gdm.nix
    ];
}
