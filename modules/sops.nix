{inputs, config, ...}: {
imports = [
	inputs.sops-nix.nixosModules.sops
];
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "/home/lenny/.config/sops/age/keys.txt";
    secrets = {
      garf_key = {};
			wireguard-frodo-private = {};
			hashedPassword = {
				neededForUsers = true;
			};
			resticPassword = {};
			email = {};
			desec-token = {
				owner = config.users.users.acme.name;
			};
			photoprism-password = {};
    };
  };
}
