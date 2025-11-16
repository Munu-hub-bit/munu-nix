{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      ripgrep 
      fd 
      tree-sitter 
      git 
      gcc 
      unzip
      nodejs 
      python3 
      cargo
    ];

    # All plugins pinned through Nix
    plugins = with pkgs.vimPlugins; [
      LazyVim
      lazy-nvim                 # plugin manager core
      nvim-treesitter
      telescope-nvim
      lualine-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
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

    extraConfig = ''
      " Basic bootstrap for LazyVim"
      lua << EOF
        -- Load LazyVim
        require("lazyvim.config").setup({
          colorscheme = "tokyonight",
        })
      EOF
    '';
  };
}
