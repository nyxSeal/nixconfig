{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      brightness = {
        enableDdcSupport = true; # enables brightness control with external monitors
      };
    };
  };
}
