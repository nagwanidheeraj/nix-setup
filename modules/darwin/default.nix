{ pkgs, username, system, ... }: {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.tmux.enable = true;

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };

  imports = [
    ./settings/system.nix
    ./settings/environment.nix
  ];
}
