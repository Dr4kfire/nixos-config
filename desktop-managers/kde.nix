{ pkgs, ... }:
{
	# Desktop and display managers
	services = {
		desktopManager.plasma6.enable = true;
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
		};
	};
	
	# Sound setup (low latency pipewire)
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
#		jack.enable = true;
	};
	services.pipewire.extraConfig.pipewire."92-low-latency" = {
		"context.properties" = {
			"default.clock.rate" = 48000;
			"default.clock.quantum" = 32;
			"default.clock.min-quantum" = 32;
			"default.clock.max-quantum" = 32;
		};
		context.modules = [
		{
			name = "libpipewire-module-protocol-pulse";
			args = {
				pulse.min.req = "32/48000";
				pulse.default.req = "32/48000";
				pulse.max.req = "32/48000";
				
				pulse.min.quantum = "32/48000";
				pulse.max.quantum = "32/48000";
			};
		};
		];
		stream.properties = {
			node.latency = "32/48000";
			resample.quality = 1;
		};
	};

	environment.systemPackages = with pkgs; [
		# KDE
		kdePackages.discover
		kdePackages.kcalc
		kdePackages.kcharselect
		kdePackages.kclock
		kdePackages.kcolorchooser
		kdePackages.kolourpaint
		kdePackages.ksystemlog
		kdePackages.sddm-kcm
		kdiff3
		kdePackages.isoimagewriter
		kdePackages.partitionmanager

		# Non-KDE graphical packages
		hardinfo2
		vlc
		wayland-utils
		wl-clipboard
	];
}
