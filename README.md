# Huge work in progress
Lots of things here don't work as intended (check issues tab for more)

Even this README isn't finished


# My NixOS config

This is my personal NixOS config. I don't plan on anyone else using this (though if you want to you can). 

The issues tab is what I use to keep track of things I want to add to my config.

## Installation

1. I'll figure out how to import it
2. Run the /scripts/setup.sh file using zsh


## Configuration

- Change or add hosts to flake.nix
- Change defined options in host/<host>/default.nix

### Options

- Note: All options are of type *bool* unless stated otherwise

**Required**

- ```config.mainUser``` (default = null)
  -  The name of the primary user
  - Type: string
 
  
- ```config.hostName``` (default = null)
  - The name of the host
  - Type: string
 
  
- ```config.systemd-boot.enable``` (default = false)
  - Enables the systemd-boot bootloader (will add more bootloaders in the future)
 
  

**The rest**

- ```services.printing.enable``` (default = false)
  - Enables CUPS
 
  
- ```time.timeZone``` (default = "America/New_York")
  - Changes the timezone
  - Type: string
 
  
- ```config.zsh.enable``` (default = true)
  - Enables zsh shell language (if false then bash is defaulted, scripts may not work)
 
  
- ```config.entertainment.enable``` (default = false)
  - Enables games and game-related apps or features (steam, vesktop, discord, prismlauncher)
 
  
- ```config.gui.enable``` (default = false)
  - Enables the gui to be activated (basically just installs a display manager to launch a de or wm)
 
  
- ```config.kde.enable``` (default = false)
  - Enables the KDE Plasma desktop environment + plasma-manager for configuration
 
  
- ```config.niri.enable``` (default = false)
  - Enables the niri window manager + configuration (config not implemented yet)
 
  
- ```config.home-manager.enable``` (default = false)
  - Enables home manager, only used for plasma manager and dotfiles
 
  
- ```config.allowedSshUser``` (default = null)
  - The single user allowed to SSH into your system. All others are blocked (only one)
  - Type: string
 
  
- ```config.gitUsername``` (default = "nyxSeal")
  - The GitHub username for version control on git
  - Type: string
 
  
- ```config.gitEmail``` (default = "litigate_putdown.zigzagged008@slmails.com")
  - The GitHub email for version control on git
  - Type: string
 
  
- ```config.ssh.enable``` (default = true)
  - Enables ssh and git (git requires ssh) (don't know why you'd want this off but still an option)
 
  
- ```config.man.enable``` (default = true)
  - Enables extra documentation (tealdeer and more man pages)
 
  
- ```nixpkgs.config.allowUnfree``` (default = true)
  - Enables 'unfree' software to be installed (includes steam)
 
  
- ```config.sound-driver.enable``` (default = false)
  - Enables pipewire allowing sound to be played
 
  
- ```config.swapspace.enable``` (default = false)
  - Enables swapspace, a service that dynamically creates swap when needed
 
  
- ```config.zswap.enable``` (default = false)
  - Enables zswap, which compresses ram
 
  
- ```config.development.enable``` (default = false)
  - Enables a code development suite (wip, currently just a c++ compiler)
 

- ```config.guiapps.enable``` (default = false)
  - Enables a suite of gui applications
 
  
- ```config.librewolf.enable``` (default = false)
  - Enables the Librewolf browser
 
  
- ```config.floorp.enable``` (default = false)
  - Enables the Floorp browser


- ```config.amd-gpu.enable``` (default = false)
  - Enables extra options for AMD gpus


## Updating

- Run the ```rewriteNixy``` alias in the terminal to update if using the main host (more aliases can be added in modules/essentials/zsh.nix)
- Or, run sudo nixos-rebuild switch --flake ~/.nixconfig/flake.nix#<host>, and replace <host> with the host you want to install (ie. sudo nixos-rebuild switch --flake ~/.nixconfig/flake.nix#nixy


## Other

To create the ASCII titles in my configs (not using them anymore): https://patorjk.com/software/taag/#p=display&f=Big+Money-ne


