# ────────────────────────────────────────────────────────────────
# Flake entrypoint for my personal NixOS configs
#
# Purpose:
# - Defines system configs for both Desktop and Toshiba laptop.
# - Passes down the system user (needed by Home Manager).
#
# Notes:
# - specialArgs makes inputs and user available inside modules.
# - Each host imports its hardware config + shared/common modules.
# - Desktop uses nixos-unstable, Toshiba uses nixos-stable.
# - Home Manager nixpkgs is set per host through extraSpecialArgs.
# ────────────────────────────────────────────────────────────────

{
  description = "Personal NixOS configs for Desktop + Toshiba laptop";

  inputs = {
    # ── Nixpkgs ──────────────────────────────────────────────────────────────
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url   = "github:nixos/nixpkgs/nixos-25.11";

    # ── Home Manager ────────────────────────────────────────────────────────
    home-manager.url = "github:nix-community/home-manager";

    # ── Noctalia ────────────────────────────────────────────────────────────
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-stable, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # ──────────────────────────────── PC ────────────────────────────────
      pc = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          user = "munu";
        };
        modules = [
          ./common/default.nix
          ./hosts/pc/default.nix

          # Home Manager (unstable)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-unstable;
            };
          }
        ];
      };

      # ──────────────────────────────── TOSHIBA ─────────────────────────────
      toshiba = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          user = "toshiba";
        };
        modules = [
          ./common/default.nix
          ./hosts/toshiba/default.nix

          # Home Manager (stable)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-stable;
            };
          }
        ];
      };
    };
  };
}
