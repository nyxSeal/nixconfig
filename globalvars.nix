{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mainUser = lib.mkOption {
      type = lib.types.str;
      description = "the primary user of the current host";
    };

    hostName = lib.mkOption {
      type = lib.types.str;
      description = "the name of the host";
    };

    gitUsername = lib.mkOption {
      type = lib.types.str;
      default = "nyxSeal";
      description = "the username of the git user";
    };

    gitEmail = lib.mkOption {
      type = lib.types.str;
      default = "litigate_putdown.zigzagged008@slmails.com";
      description = "the email of the git user";
    };

    allowedSshUser = lib.mkOption {
      type = lib.types.str;
      description = "the user allowed to SSH into the host";
    };

    diskName = lib.mkOption {
      type = lib.types.str;
      description = "the name of the disk partition (excluding /dev)";
    };
  };
}
