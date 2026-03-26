{
  pkgs,
  config,
  lib,
  ...
}: {
  options.audio.enable = lib.mkEnableOption "enables pipewire/sound";

  config = lib.mkIf config.audio.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    environment.systemPackages = with pkgs; [
      pavucontrol
    ];
  };
}
