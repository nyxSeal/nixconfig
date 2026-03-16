{
  pkgs,
  config,
  ...
}: {
  home.file = {
    ".config/niri".source = ./../niri;
  };
}
