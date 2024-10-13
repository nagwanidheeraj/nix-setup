{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    # Add your paths here
    cdpath = [
    ];

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    history = {
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 100000;
      size = 100000;
    };

    shellAliases = {
      drb = "darwin-rebuild switch --flake ~/.config/nix-setup";

      cat = "bat";

      ls = "exa";
      l = "exa -l";
      ll = "exa -laa";
      lt = "exa -lsold";
      llt = "exa -laasold";
      ltr = "exa -lsnew";
      lltr = "exa -laasnew";
    };

    initExtra = ''
      export ZSH="/Users/guto/.oh-my-zsh"
      export LANG=en_US.UTF-8
      export NVM_DIR="$HOME/.nvm"
      export EDITOR=vi
      export TERM=xterm-256color
      source ~/.p10k.zsh
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
}
