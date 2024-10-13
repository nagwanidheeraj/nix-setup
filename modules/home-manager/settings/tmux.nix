{ pkgs, ... }: {
  home.file.".tmux.conf".text = ''
    source ${pkgs.powerline}/share/tmux/powerline.conf
  '';

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    terminal = "xterm-256color";
    keyMode = "vi";

    extraConfig = ''
      set -g history-limit 20000
      set -g renumber-windows on
      set -g base-index 1
      setw -g pane-base-index 1
      set -g default-terminal "tmux-256color"
      set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
      set -sg terminal-overrides ",*:RGB"

      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe "pbcopy"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X end-selection
    '';
  };
}
