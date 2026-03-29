{
  pkgs,
  config,
  lib,
  ...
}: {
  options.vendor.amd-gpu.enable = lib.mkEnableOption "enables extra settings for amd gpus";

  config = lib.mkIf config.vendor.amd-gpu.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = [pkgs.rocmPackages.rocm-smi];
    };
  };
}
