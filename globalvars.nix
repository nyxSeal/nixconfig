{pkgs, config, lib, ... }: {


  options = {

    mainUser = lib.mkOption {
      type = type.str;
      description = "the primary user of the current host";
    };

    hostName = lib.mkOption {
      type = type.str;
      description = "the name of the host";
    };

    gitUsername = lib.mkOption {
      type = type.str;
      default = "nyxSeal";
      description = "the username of the git user";
    };

    gitEmail = lib.mkOption {
      type = type.str;
      default = "litigate_putdown.zigzagged008@slmails.com";
      description = "the email of the git user";
    };

    allowedSshUsers = lib.mkOption {
      type = type.listOf str;
      description = "the users allowed to SSH into the host";
    };



  };
  

  config = {
  };

}
