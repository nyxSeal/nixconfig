{
  pkgs,
  config,
  lib,
  ...
}: {
  options.sound-driver.enable = lib.mkEnableOption "enables pipewire/sound";

  config = lib.mkIf config.sound-driver.enable {
    services.pipewire.enable = true;
    services.pipewire.pulse.enable = true;
  };
}
