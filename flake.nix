{
  description = "DeeJay's Mac Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }: let
    system = "__SYSTEM__";
    hostname = "__HOSTNAME__";
    username = "__USERNAME__";
    useremail = "__USEREMAIL";

    specialArgs =
      inputs
      // {
        inherit system hostname username useremail;
      };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild switch --flake ~/.config/nix-setup
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system inputs specialArgs;

      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.${username}.imports = [
              ./modules/home-manager
            ];
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;
  };
}
