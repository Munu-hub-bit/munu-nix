### To use:

#### PC:
```
sudo nixos-rebuild switch --flake github:Munu-hub-bit/munu-nix#pc --refresh
```

#### Toshiba:
```
sudo nixos-rebuild switch --flake github:Munu-hub-bit/munu-nix#toshiba --refresh
```
### To update
```
cd /home/munu/Downloads/munu-nix-main
sudo nix flake update
```
### To delete old generations and unused packages
```
sudo nix-collect-garbage -d
```
