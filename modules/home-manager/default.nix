{ pkgs, system, username, ... }: {
  imports = [
    ./settings/tmux.nix
    ./settings/vim.nix
    ./settings/zsh.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/Users/${username}";

    packages = with pkgs; [
      bat
      colima
      cowsay
      docker
      docker-compose
      eza
      httpie
      powerline
      terraform
    ];

    stateVersion = "24.05";
  };

  programs = {
    direnv.enable = true;
    home-manager.enable = true;
  };
}
