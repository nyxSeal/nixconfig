{
  programs.noctalia-shell = {
    enable = true;
    settings = (builtins.fromJSON (builtins.readFile ./noctalia-config.json)).settings;
  };
}
