{
    
    description = "My NixOS configuration";


    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
	   url = "github:nix-community/home-manager";
	   inputs.nixpkgs.follows = "nixpkgs";
         };
       };


       outputs = { self, nixpkgs, home-manager, ... }@inputs: let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
       in {
	 nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	   system = "x86_64-linux";
	   modules = [
		./hosts/nixos/default.nix
		./hosts/nixos/hardware.nix
		home-manager.nixosModules.home-manager
		{
		  home-manager.useGlobalPkgs = true;
		  home-manager.useUserPackages = true;
		  home-manager.users.nixos = import ./home.nix;
		}
	     ];
	   };
	
           
           homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
	    inherit pkgs;
            modules = [ ./home.nix ];
          };
       };
    }
