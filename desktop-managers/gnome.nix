{ pkgs, ...}:
{
	services.xserver = {
		enable = true;
		desktopManager = {
			gnome.enable = true;
		};
		displayManager.gdm.enable = true;
	};
	environment.gnome.excludePackages = with pkgs; [
		gnome-tour
		gnome-weather
		gnome-contacts
		gnome-music
		simple-scan
		yelp
		evince
		geary
		snapshot
	];
}
