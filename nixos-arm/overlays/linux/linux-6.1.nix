{
  lib,
  buildPackages,
  fetchurl,
  perl,
  buildLinux,
  nixosTests,
  modDirVersionArg ? null,
  ...
} @ args:
with lib;
  buildLinux (args
    // rec {
      version = "6.1.14";

      # modDirVersion needs to be x.y.z, will automatically add .0 if needed
      modDirVersion =
        if (modDirVersionArg == null)
        then concatStringsSep "." (take 3 (splitVersion "${version}.0"))
        else modDirVersionArg;

      # branchVersion needs to be x.y
      extraMeta.branch = versions.majorMinor version;

      src = fetchurl {
        url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
        hash = "";
      };
    }
    // (args.argsOverride or {}))
