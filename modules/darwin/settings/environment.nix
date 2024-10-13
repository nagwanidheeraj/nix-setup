{ pkgs, ... }: {
  environment = {
    shells = with pkgs; [ zsh ];
    systemPath = [ "/usr/local/bin" ];
    pathsToLink = [ "/Applications" ];

    # Needed to make touch id work inside tmux
    systemPackages = [ pkgs.pam-reattach ];
    etc."pam.d/sudo_local" = {
      text = ''
        # Managed by nix-darwin
        auth  optional      ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
        auth  sufficient    pam_tid.so
      '';
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}
