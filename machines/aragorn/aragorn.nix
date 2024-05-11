{ ... }:
{
	imports = [
		../../modules/gui.nix
		./hardware-configuration-aragorn.nix
		#../../modules/ollama.nix
	];
	home-manager.users.lenny.wayland.windowManager.hyprland.settings.monitor = ",highres,auto,1.25";
	networking.hostName = "aragorn"; 
	environment.sessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
	};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
		extraConfig.pipewire."sink-eq6" = {
			context.objects = [
				{
					name = "libpipewire-module-filter-chain";
					args = {
            node.description = "PhillipsEQ";
            media.name       = "PhillipsEQ";
            filter.graph = {
                nodes = [
                    {
                        type  = "builtin";
                        name  = "eq_band_c1";
                        label = "bq_highshelf";
                        control = { "Freq" = 0; "Q" = 1.0; "Gain" = -6.5; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_2";
                        label = "bq_lowshelf";
                        control = { "Freq" = 105; "Q" = 0.7; "Gain" = 6.5; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_3";
                        label = "bq_peaking";
                        control = { "Freq" = 110; "Q" = 0.81; "Gain" = -3; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_4";
                        label = "bq_peaking";
                        control = { "Freq" = 412; "Q" = 1.39; "Gain" = 1; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_5";
                        label = "bq_peaking";
                        control = { "Freq" = 2130; "Q" = 2.76; "Gain" = -5.7; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_6";
                        label = "bq_peaking";
                        control = { "Freq" = 5734; "Q" = 2.84; "Gain" = -0.6; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_7";
                        label = "bq_peaking";
                        control = { "Freq" = 1113; "Q" = 2.07; "Gain" = -0.6; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_8";
                        label = "bq_peaking";
                        control = { "Freq" = 3566; "Q" = 6; "Gain" = 1.3; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_2";
                        label = "bq_peaking";
                        control = { "Freq" = 4477; "Q" = 6; "Gain" = -1.7; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_2";
                        label = "bq_peaking";
                        control = { "Freq" = 7370; "Q" = 5.98; "Gain" = 2.1; };
                    }
                    {
                        type  = "builtin";
                        name  = "eq_band_2";
                        label = "bq_highshelf";
                        control = { "Freq" = 10000; "Q" = 0.7; "Gain" = -2.4; };
                    }
                ];
                links = [
                    { output = "eq_band_1:Out"; input = "eq_band_2:In"; }
                    { output = "eq_band_2:Out"; input = "eq_band_3:In"; }
                    { output = "eq_band_3:Out"; input = "eq_band_4:In"; }
                    { output = "eq_band_4:Out"; input = "eq_band_5:In"; }
                    { output = "eq_band_5:Out"; input = "eq_band_6:In"; }
                    { output = "eq_band_6:Out"; input = "eq_band_7:In"; }
                    { output = "eq_band_7:Out"; input = "eq_band_8:In"; }
                    { output = "eq_band_8:Out"; input = "eq_band_9:In"; }
                    { output = "eq_band_9:Out"; input = "eq_band_10:In"; }
                    { output = "eq_band_10:Out"; input = "eq_band_11:In"; }
                ];
            };
	    audio.channels = 2;
	    audio.position = [ "FL" "FR" ];
            capture.props = {
                node.name   = "effect_input.eq";
                media.class = "Audio/Sink";
            };
            playback.props = {
                node.name   = "effect_output.eq";
                node.passive = false;
            };
        };
    }
];
				};
		};
	services.xserver.videoDrivers = ["nvidia"];
	hardware.nvidia = {
		modesetting.enable = true;
		open = false;
	};
	boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
