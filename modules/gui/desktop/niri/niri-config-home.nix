{pkgs, config, ... }: {

  home.file = {
    ".config/niri/config.kdl".source = .nixconfig/modules/gui/desktop/niri
  };

}
