
{ config, lib, pkgs, ... }:
{
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	imports =
	[
		./hardware-configuration.nix
		# CHOOSE YOUR OWN DESKTOP ENVIRONMENT
		./desktop-managers/gnome.nix
#		./desktop-managers/kde.nix
	];
	
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	services.xserver.enable = true;
	services.xserver.videoDrivers = [ "mesa" ]; # try `nvidia` if you have nvidia gpu

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Amsterdam";

	users.users.dr4kfire = {
		isNormalUser = true;
		extraGroups = [ "wheel" "input" "networkmanager" ];
	};		

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		
		mesa

		neovim
		vim

		git
		wget

		home-manager
	];


	# DO NOT EDIT
	system.stateVersion = "25.05"; # Did you read the comment?
}

