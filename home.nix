{ config, pkgs, ... }: {
	home = {
		username = "dr4kfire";
		homeDirectory = "/home/dr4kfire";
		stateVersion = "25.05";
		
		packages = with pkgs; [
			prismlauncher

			steam
			lutris
			cartridges

			neofetch
			htop
		];

	};
	nixpkgs.config.allowUnfree = true;

	imports = [
		./system/bash.nix
	];
}
