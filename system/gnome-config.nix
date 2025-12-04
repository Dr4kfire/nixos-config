{ pkgs, home-manager, ... }:
let
	dconf = home-manager.users.dr4kfire.dconf;
in
{
	dconf.enable = true;
	dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

	dconf.settings."org/gnome/shell" = {
		disable-user-extensions = false;
		enabled-extensions = with pkgs.gnomeExtensions; {
			blur-my-shell.extensionUuid
			gsconnect.extensionUuid
		};
	};
}
