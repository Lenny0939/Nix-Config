{ lib, ... }: 
{
	networking.wireless.enable = lib.mkForce false;
	users.users."root".password = lib.mkForce "password";
}
