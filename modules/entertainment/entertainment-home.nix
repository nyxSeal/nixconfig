{
  config,
  pkgs,
  lib,
  ...
}: {
  #imports = [ ./../../globalvars.nix ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/vesktop/settings" = {
      lib.makeSymlinkOutOfStore = "/home/${config.home.username}/dotfiles/vesktop";
      recursive = true;
    };

    ".local/share/PrismLauncher.skins" = {
      lib.makeSymlinkOutOfStore = "/home/${config.home.username}/dotfiles/prismlauncher/skins";
      recursive = true;
    };

    ".local/share/PrismLauncher/instances" = {
      lib.makeSymlinkOutOfStore = "/home/${config.home.username}/dotfiles/prismlauncher/instances";
      recursive = true;
    };

    "steam/steamapps/common/Deep Rock Galactic" = {
      lib.makeSymlinkOutOfStore = "/home/${config.home.username}/dotfiles/steam/drg";
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nyxSeal/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };
}
