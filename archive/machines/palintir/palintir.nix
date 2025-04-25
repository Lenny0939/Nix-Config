{
  modulesPath,
  lib,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../modules/gui.nix
  ];
  nixpkgs.config.allowBroken = true;
  nixpkgs.hostPlatform = "x86_64-linux";
  networking.wireless.enable = lib.mkForce false;
  networking.hostName = "palintir";
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
