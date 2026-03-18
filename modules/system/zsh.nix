{
  pkgs,
  config,
  lib,
  ...
}: {
  users.defaultUserShell = pkgs.zsh;

  system.userActivationScripts.zshrc = "touch .zshrc";

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestions = {
      enable = true;
      strategy = ["history"];
    };

    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = ["git"];
      theme = "agnoster";
    };

    shellAliases = {
      rebuild = "zsh ~/.nixconfig/scripts/rebuild.sh";
      setup = "zsh ~/.nixconfig/scripts/setup.sh";
    };

    histSize = 10000;
    histFile = "~/.zsh_history";
  };
}
