{...}: {
  programs.git = {
    userName = "Lenny0939";
    userEmail = "lennyescott@gmail.com";
    extraConfig = {
      /*
        credential.helper = "${
      	pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
      */
    };
  };
}
