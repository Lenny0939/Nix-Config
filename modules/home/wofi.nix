{ config, pkgs, ... }:
{
	programs.wofi = {
		enable = true;
		settings = {
			insensitive= true;
			allow_images = true;
			mode = "drun";
			width = 420;
			height = 550;
			location = "center";
			matching = "fuzzy";
			prompt = "";
			orientation = "vertical";
			image_size = 48;
			#idk what these do
			halign = "fill";
			no_actions = true;
			#allow_markup = true;
			filter_rate = 100;
			allow_markup = true;
		};
		style = ''
			* {
					font-family: 'Hack Nerd Font', monospace;
					font-size: 28px;
			 }

			 /* Window */
			 window {
					margin: 0px;
					padding: 10px;
					border: 1px #${config.colorScheme.colors.base07};
					border-radius: 5px;
					background-color: #${config.colorScheme.colors.base00};
					animation: slideIn 0.5s ease-in-out both;
			 }

			 /* Slide In */
			 @keyframes slideIn {
					0% {
						 opacity: 0;
					}

					100% {
						 opacity: 1;
					}
			 }

			 /* Inner Box */
			 #inner-box {
					margin: 5px;
					padding: 10px;
					border: none;
					background: #${config.colorScheme.colors.base00};
					animation: fadeIn 0.5s ease-in-out both;
			 }

			 /* Fade In */
			 @keyframes fadeIn {
					0% {
						 opacity: 0;
					}

					100% {
						 opacity: 1;
					}
			 }

			 /* Outer Box */
			 #outer-box {
					margin: 5px;
					padding: 10px;
					border: none;
					background-color: #${config.colorScheme.colors.base00};
			 }

			 /* Scroll */
			 #scroll {
					margin: 0px;
					padding: 10px;
					border: none;
			 }

			 /* Input */
			 #input {
					margin: 5px;
					padding: 10px;
					border: none;
					color: #${config.colorScheme.colors.base05};
					background-color: #${config.colorScheme.colors.base01};
					animation: fadeIn 0.5s ease-in-out both;
			 }

			 /* Text */
			 #text:selected {
				color: #${config.colorScheme.colors.base05};
			 }
			 #text {
					margin: 5px;
					padding: 10px;
					border: none;
					color: #${config.colorScheme.colors.base05};
					animation: fadeIn 0.5s ease-in-out both;
			 }

			 /* Selected Entry */
			 #entry:selected {
				 background: linear-gradient(90deg, #${config.colorScheme.colors.base05}, #${config.colorScheme.colors.base07});
				 border-radius: 5px;
			 }

			 #entry:selected #text {
					color: #${config.colorScheme.colors.base00};
			 }
		'';
	};
}
