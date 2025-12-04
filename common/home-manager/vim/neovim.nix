{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
      git
      gcc
      unzip
      nodejs
      python3
      cargo
      lua-language-server
    ];

    # Only lazy.nvim is installed directly. LazyVim is loaded via lazy's spec.
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig =
      let
        plugins = with pkgs.vimPlugins; [
          LazyVim
          nvim-treesitter
          telescope-nvim
          lualine-nvim
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          friendly-snippets
          nvim-lspconfig
          gitsigns-nvim
          which-key-nvim
          nvim-web-devicons
          indent-blankline-nvim
          plenary-nvim
          tokyonight-nvim
        ];

        mkEntryFromDrv = drv:
          if lib.isDerivation drv then
            { name = "${lib.getName drv}"; path = drv; }
          else
            drv;

        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      ''
        require("lazy").setup({
          defaults = { lazy = true },
          dev = {
            path = "${lazyPath}",
            patterns = { "" },
            fallback = true,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },

            -- Correct NixOS adjustments
            { "williamboman/mason.nvim", enabled = false },
            { "williamboman/mason-lspconfig.nvim", enabled = false },

            -- Explicitly allow these
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },

            -- Avoid treesitter auto-installs
            { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {} } },
          },
        })
      '';
  };

  # Fix treesitter parser errors on NixOS
  xdg.configFile."nvim/parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
          c
          lua
        ])).dependencies;
      };
    in
    "${parsers}/parser";

  # OPTIONAL: LazyVim user overrides
# If you do not have a ./lua directory next to this file, remove or comment this block.
# Create it only if you want custom LazyVim config.
# mkdir -p ./lua
# and place your LazyVim config inside it.
# Example: ./lua/config/options.lua
#
# xdg.configFile."nvim/lua".source = ./lua;
}
