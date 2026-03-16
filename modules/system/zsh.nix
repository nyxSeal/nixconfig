{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "enable zsh";
  };

  config = lib.mkIf config.zsh.enable {
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
      };

      histSize = 10000;
      histFile = "~/.zsh_history";
    };
  };
}
