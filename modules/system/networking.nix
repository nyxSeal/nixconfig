{
  pkgs,
  lib,
  config,
  ...
}: {
  networking.hostName = "${config.hostName}";

  networking.networkmanager.enable = true;

  time.timeZone = lib.mkDefault "America/New_York";

  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowUsers = ["${config.allowedSshUser}"];
    };
  };

  services.gnome.gcr-ssh-agent.enable = false;
  services.gnome.gnome-keyring.enable = true;

  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;

    extraConfig = "
      Host backup
        Hostname 192.168.1.172
        Port 22
        User scattergun
        IdentityFile ~/.ssh/id_ed25519_backup
        IdentitiesOnly yes
      Host github.com
        Hostname github.com
        Port 22
        User git
        IdentityFile ~/.ssh/id_ed25519_github
        IdentitiesOnly yes
      Host main
        Hostname 192.168.1.185
        Port 22
        User nyxSeal
        IdentityFile ~/.ssh/id_ed25519_main
        IdentitiesOnly yes
     ";
  };

  programs.git = {
    enable = true;

    config = {
      user.name = "${config.gitUsername}";
      user.email = "${config.gitEmail}";
      #commit.gpgsign = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localHost,internal.domain";
}
