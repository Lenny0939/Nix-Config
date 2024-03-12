{ ... }: {
	sops = {
		defaultSopsFile = ../secrets/secrets.yaml;
		age.keyFile = "/home/lenny/.config/sops/age/key.txt";
		secrets = {
			spotifypassword = {
				owner = "lenny";
				group = "audio";
			};
			/*
			wireguardPrivate = {
				owner = "root";
			};
			*/
		};
	};
}
