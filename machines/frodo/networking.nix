{ ... }:
{
	networking = {
		interfaces = {
			end0.ipv4.addresses = [{
				address = "192.168.0.2";
				prefixLength = 24;
			}];
		};
		defaultGateway = {
			address = "192.168.0.1";
		};
		nat = {
			enable = true;
			externalInterface = "eth0";
			internalInterfaces = [ "wg0" ];
		};
	};
}
