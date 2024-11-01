{lib, ...}: {
  ssbm.slippi-launcher = {
    enable = true;
    isoPath = lib.mkDefault "/home/lenny/Downloads/ANIMELEE - COMPLETE EDITION/animelee.iso";
    launchMeleeOnPlay = lib.mkDefault true;
    enableJukebox = true;
  };
}
