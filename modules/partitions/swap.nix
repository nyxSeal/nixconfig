{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    zswap.enable = lib.mkEnableOption "enables zswap on swap";
    zram.enable = lib.mkEnableOption "enables zram on ram";
  };

  config = lib.mkMerge [
    (lib.mkIf config.zswap.enable {
      boot.kernelParams = [
        "zswap.enabled=1" # enables zswap
        "zswap.compressor=lz4" # compression algorithm
        "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
        "zswap.shrinker.enabled=1" # whether to shrink the pool proactively on high memory pressure
      ];
      boot.initrd.systemd.enable = true; # required if using lz4 algorithm for zswap
    })

    (lib.mkIf config.zram.enable {
      zramSwap = {
        enable = true;
        memoryPercent = 60;
        priority = 100;
      };
    })
  ];
}
