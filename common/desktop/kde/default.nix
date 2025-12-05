{ config, inputs, ... }:

{
    imports = [
        ./kde.nix
        ./login/sddm.nix
    ];
}
