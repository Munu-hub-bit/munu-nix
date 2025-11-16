{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # ── shell initialization ──
    interactiveShellInit = ''
      # Disable greeting
      set fish_greeting

      # Prompt function
      function fish_prompt -d "Write out the prompt"
          printf '%s@%s %s%s%s > ' $USER $hostname \
              (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
      end

      # Initialize Starship
      starship init fish | source

      # Load quickshell sequences if available
      if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
          cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
      end

      # ── Aliases ──
      alias pamcan pacman
      alias ls 'eza --icons'
      alias clear "printf '\033[2J\033[3J\033[1;1H'"
      alias q 'qs -c ii'
    '';

    # ── Optional: set colors declaratively ──
    shellInit = ''
      set -U fish_color_command blue
      set -U fish_color_comment red
      set -U fish_color_cwd green
      set -U fish_color_cwd_root red
      set -U fish_color_error brred
      set -U fish_color_param cyan
      set -U fish_color_quote yellow
      set -U fish_color_user brgreen
      set -U fish_color_valid_path --underline
    '';

  };
}
