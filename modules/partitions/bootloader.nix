{
  pkgs,
  config,
  lib,
  ...
}: {
  options.bootloader.enum = lib.mkOption {
    type = lib.types.enum ["grub" "systemd-boot"];
    description = "the bootloader used";
  };

  config = lib.mkMerge [
    {
      boot.loader = {
        efi.canTouchEfiVariables = true;
        timeout = 10;
      };
    }

    (
      lib.mkIf (config.bootloader.enum == "grub") {
        boot.loader.grub = {
          enable = true;
          device = "/dev/${config.diskName}";
        };
      }
    )

    (
      lib.mkIf (config.bootloader.enum == "systemd-boot") {
        boot.loader.systemd-boot.enable = true;
      }
    )
  ];
}
