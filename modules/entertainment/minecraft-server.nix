{config, lib, inputs, ... }: {

  options.minecraft-server.enable = lib.mkEnableOption "enable minecraft server hosting";

  config = lib.mkIf config.minecraft-server.enable {
    imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];


    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        "multiplayer server!!!" = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_11;

          symlinks."mods" = ./../../../minecraft/mods;

          serverProperties = {
            server-port = 45001;
            gamemode = "survival";
            difficulty = "normal";
            simulation-distance = 10;
            white-list = true;
          };

          whitelist = {

          };
        };
      };
    };
  };

}
