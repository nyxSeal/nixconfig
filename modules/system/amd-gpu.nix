{
  pkgs,
  config,
  lib,
  ...
}: {
  options.amd-gpu.enable = lib.mkEnableOption "enables extra settings for amd gpus";

  config = lib.mkIf config.amd-gpu.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = [pkgs.rocmPackages.rocm-smi];
    };
  };
}
