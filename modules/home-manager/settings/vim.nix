{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;

    settings = {
      expandtab = true;
      number = true;
      shiftwidth = 4;
      tabstop = 4;
    };

    extraConfig = ''
    filetype plugin indent on
    python3 import sys
    python3 sys.path.append('${pkgs.powerline}/lib/python3.11/site-packages')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup

    set laststatus=2
    '';
  };
}
