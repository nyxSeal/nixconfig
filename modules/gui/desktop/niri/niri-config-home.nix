{
  pkgs,
  config,
  ...
}: {
  home.file = {
    ".config/niri/config.kdl".source = ./../niri;
  };
}
