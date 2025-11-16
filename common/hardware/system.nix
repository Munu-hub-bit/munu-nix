# ────────────────────────────────────────────────────────────────
# Common NixOS configuration (shared by all hosts)
#
# Purpose:
#   - Shared settings for desktop + laptop.
#
# Notes:
#   - `system.stateVersion` must only be bumped after carefully
#     reading the release notes (it locks defaults/migrations).
#   - `allowUnfree` is global (covers all packages).
#   - `experimental-features` is required for flakes.
# ────────────────────────────────────────────────────────────────

{ config, pkgs, inputs, user, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 262144000;

  # Important: defines compatibility with a specific NixOS release.
  # Do not change casually; bump only when upgrading across releases.
  system.stateVersion = "25.05";

  # Garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.settings.auto-optimise-store = true;
}
