{
  pkgs,
  config,
  lib,
  ...
}: {
  security = {
    apparmor.enable = true;
    sudo.execWheelOnly = true;
    protectKernelImage = true;
  };

  users = {
    mutableUsers = false;
    allowNoPasswordLogin = true;
    users.root.hashedPassword = "!";
  };
}
