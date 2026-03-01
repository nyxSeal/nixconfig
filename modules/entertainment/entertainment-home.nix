{ config, pkgs, global, vars, ... }:

{

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    "~/.config/vesktop/settings/quickCss.css".source = "${vars.pathToDirectory}"/dotfiles/vesktop/quickCss.css;
    "~/.config/vesktop/settings/settings.json".source = "${vars.pathToDirectory}"/dotfiles/vesktop/settings.json;
    "~/.local/share/PrismLauncher/skins".source = "${vars.pathToDirectory}"/dotfiles/prismlauncher/skins;
    "~/.local/share/PrismLauncher/instances".source = "${vars.pathToDirectory}"/dotfiles/prismlauncher/instances;
    "~/steam/steamapps/common/'Deep Rock Galactic'".source = "${vars.pathToDirectory}"/dotfiles/steam/drg;


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
    # EDITOR = "emacs";
  };

}
