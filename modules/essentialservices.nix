{config, pkgs, ...}: {



  time.timeZone = "America/New_York";


  environment.systemPackages = with pkgs; [
    wget # idk
    vim # text editor

  ];



  system.userActivationScripts.zshrc = "touch .zshrc";



  programs.zsh = { # shell language
    enable = true;
    enableCompletion = true;

    autosuggestions = {
      enable = true;
      strategy = [ "history" ];
    };

    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
 
    shellAlias = {
      rewrite = "sudo nixos-rebuild switch --flake .#nyxSeal";
      saveGit = "zsh $HOME/.nixconfig/scripts/gitSave.sh"
    };

    histSize = 10000;
    histFile = "~/.zsh_history";

  };





  services.openssh = {
    enable = true;
    ports = [ 5000 22 ];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };

  };

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;

    extraConfig = "
      Host backup
        Hostname 192.168.1.172
        Port 5000
        User scattergun
        IdentityFile ~/.ssh/id_ed25519_backup
        IdentitiesOnly yes
      Host github.com
        Hostname github
        Port 22
        User git
        IdentityFile ~/.ssh/id_ed25519_github
        IdentitiesOnly yes
      Host main
        Hostname 192.168.1.185
        Port 5000
        User nyxSeal
        IdentityFile ~/.ssh/id_ed25519_main
        IdentitiesOnly yes
    ";

  };



  programs.git = {
    enable = true;

    config = {
      user.name = "${lib.gitUsername}";
      user.email = "${lib.gitEmail}";
      #commit.gpgsign = true;
    };

  };



  system.autoUpgrade = { # automatic updating
    enable = true;
    dates = "weekly";
  };



  nix = {
    
    gc = { # automatic rollback version cleanup
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes" ];
    };

  };



  security = {
    apparmor.enable = true;
    sudo.execWheelOnly = true;
    protectKernelImage = true;
  };


  system.stateVersion = "25.11"; # DO NOT CHANGE THIS VALUE UNLESS YOU ABSOLUTELY KNOW WHAT YOU'RE DOING


}
