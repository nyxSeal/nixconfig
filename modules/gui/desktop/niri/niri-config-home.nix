{config, ...}: let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg.configFile = {
    ".config/niri/config.kdl".source = link "./../niri";
  };
}
