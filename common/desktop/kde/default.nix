{ config, inputs, ... }:

{
    imports = [
        ./kde.nix
        ./login/greetd.nix
    ];
}
