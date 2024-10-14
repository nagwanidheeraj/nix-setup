{ inputs, ... }: {
  system = {
    stateVersion = 5;
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    activationScripts.postUserActivation.text = ''
      # Following line should allow us to avoid a logout/login cycle
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        NSNavPanelExpandedStateForSaveMode = true;
      };

      dock = {
        autohide = true;
        show-recents = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };

      trackpad.TrackpadThreeFingerDrag = true;
      trackpad.Clicking = true;

      CustomUserPreferences = {
        "com.apple.Safari".IncludeDevelopMenu = true;
        "com.apple.Safari.SandboxBroker".ShowDevelopMenu = true;
      };
    };
  };
}
