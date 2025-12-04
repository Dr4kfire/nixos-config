{
	description = "System configuration";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
	
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};



	outputs = { nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
	in
	{
	
		# Set the nix configuration to be configuration.nix
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./configuration.nix ];
		};
		# Set the homeconfiguration for a user named dr4kfire to home.nix
		homeConfigurations.dr4kfire = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home.nix ];
		};
		
		
		imports = [ ./system/gnome-config.nix ];
	};

}
