{
  description = "Nixos";


  inputs = {

    nixpkgs = {
      url = "nixpkgs/nixos-26.05";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }: {
    nixosConfigurations.dope-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit spicetify-nix; };
            users.chris = {
	    imports = [
	    ./home.nix
            spicetify-nix.homeManagerModules.default
	      ];
	    };
          };
        }
      ];
    };
  };
}
