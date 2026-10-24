{
  description = "Gedo's NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # Desktop configuration
      ideapad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # ./hardware.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.gedo = import ./home.nix;
          }
        ];
      };

    };
  };
}
