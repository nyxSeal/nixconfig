# Huge work in progress
Lots of things here don't work as intended (check issues tab for more)

Even this README isn't finished


# My NixOS config

This is my personal NixOS config. I don't recommend on anyone else using this, these are just to help me remember what to do. 

The issues tab is what I use to keep track of things I want to add to my config.

## Installation

1. boot a minimal NixOS live environment (via USB drive or smth)
2. run ```nmtui``` and connect to Wi-Fi (if using ethernet skip this step)
3. run ```sudo -i``` to login to the root account
4. run ```git clone https://github.com/nyxSeal/nixconfig --branch <branch>``` (remove --branch flag if using main branch)
5. run ```bash nixconfig/scripts/install.sh```
6. follow prompts until installed
   - make sure hostname and username match one of the hosts file. if it doesn't, then create one
   -  make sure branch matches the branch you cloned the repository with
8. reboot system
9. login
10. if needed, run ```zsh .nixconfig/scripts/setup.sh``` to setup ssh key to upload to github

After this, your system should be ready!


## Configuration

- In each host directory, there is a default.nix file. That file declares what modules and options are enabled or disabled.
- To add a host:
  - Add an entry to the flake.nix file (the option on top is the host name, not the user)
  - Add a directory in /hosts for that user, and create a default.nix file
  - Import ../../modules/modulebundle.nix and ./hardware-configuration.nix
  - Declare the required options and then change any of the other options (detailed below)
  - When updating, make sure to change what host you are updating (the # at the end)
    - You can also add an alias in modules/essentials/zsh.nix to update that specific host (have to reboot before aliases are updated)

BRIGHTNESS CONTROL

- EXTERNAL MONITORS

  - KDE
    - KDE has a brightness service called PowerDevil, so none of these are needed.
    - If it stops working, try running systemctl --user restart plasma-powershell

  - ddcutil
    - set ```brightness.ddcutil.enable``` to ```true```
    - ```ddcutil detect``` to detect monitors
    - ```ddcutil -d <display number> set 10 <brightness percentage>``` to set brightness, use + or - to change it
- LAPTOP/INTERNAL MONITORS
  - brightnessctl
    - set ```brightness.brightnessctl.enable``` to ```true```
    - ```brightnessctl``` to see current, maximum, and minimum brightness
    - ```brightnessctl set <brightness>``` to set brightness to value



### Options

- Note: All options are of type *bool* unless stated otherwise

**Required**

- ```mainUser``` (default = null)
  -  The name of the primary user
  - Type: string
 
  
- ```hostName``` (default = null)
  - The name of the host
  - Type: string
 
  
- ```bootloader.enum``` (default = null)
  - Enables a bootloader of your choice
  - Type: string
  - Options: "grub", "systemd-boot"


  

**Optional**


Networking:


- ```allowedSshUser``` (default = null)
  - The single user allowed to SSH into your system. All others are blocked (only one)
  - Type: string
 
  
- ```gitUsername``` (default = "nyxSeal")
  - The GitHub username for version control on git
  - Type: string
 
  
- ```gitEmail``` (default = "litigate_putdown.zigzagged008@slmails.com")
  - The GitHub email for version control on git
  - Type: string


- ```time.timeZone``` (default = "America/New_York")
  - Changes the timezone
  - Type: string


- ```services.printing.enable``` (default = false)
  - Enables CUPS




Dependency modules:

  
- ```home-manager.enable``` (default = false)
  - Enables home manager, only used for plasma manager and dotfiles

  
- ```zsh.enable``` (default = true)
  - Enables zsh shell language (if false then bash is defaulted, scripts may not work)


- ```nixpkgs.config.allowUnfree``` (default = true)
  - Enables 'unfree' software to be installed (includes steam)


- ```gui.enable``` (default = false)
  - Enables a display manaager that allows the launching of desktop environments.




System: 

 
- ```man.enable``` (default = true)
  - Enables extra documentation (tealdeer and more man pages)

  
- ```sound-driver.enable``` (default = false)
  - Enables pipewire allowing sound to be played
 
  
- ```swapspace.enable``` (default = false)
  - Enables swapspace, a service that dynamically creates swap when needed
 
  
- ```zswap.enable``` (default = false)
  - Enables zswap, which compresses ram


- ```amd-gpu.enable``` (default = false)
  - Enables extra options for AMD gpus
  - Requires: an AMD gpu

- ```brightness.brightnessctl.enable``` (default = false)
  - Enables the brightnessctl manager for internal display brightness management

- ```brightness.ddcutil.enable``` (default = false)
  - Enables the ddcutil manager for external display brightness management




Desktop environment/window manager:

  
- ```kde.enable``` (default = false)
  - Enables the KDE Plasma desktop environment + plasma-manager for configuration
  - Requires: ```home-manager.enable``` ```gui.enable```
 
  
- ```niri.enable``` (default = false)
  - Enables the niri window manager + configuration (config not implemented yet)
  - Requires: ```gui.enable```



Browser:


- ```librewolf.enable``` (default = false)
  - Enables the Librewolf browser
  - Requires: A desktop environment or window manager
 
  
- ```floorp.enable``` (default = false)
  - Enables the Floorp browser
  - Requires: A desktop environment or window manager




Suites of tools or apps:

  
- ```development.enable``` (default = false)
  - Enables a code development suite (wip, currently just a c++ compiler)
 

- ```guiapps.enable``` (default = false)
  - Enables a suite of gui applications
  - Requires: A desktop environment or window manager
 
  
- ```entertainment.enable``` (default = false)
  - Enables games and game-related apps or features (steam, vesktop, discord, prismlauncher)
  - Requires: ```home-manager.enable```, ```nixpkgs.config.AllowUnfree```, A desktop environment or window manager

Do not touch the following (enabled when needed):
- 


## Updating

- Run the ```rewriteNixy``` alias in the terminal to update if using the main host (more aliases can be added in modules/essentials/zsh.nix)
- Or, run sudo nixos-rebuild switch --flake ~/.nixconfig/flake.nix#<host>, and replace <host> with the host you want to install (ie. sudo nixos-rebuild switch --flake ~/.nixconfig/flake.nix#nixy


## Other

To create the ASCII titles in my configs (not using them anymore): https://patorjk.com/software/taag/#p=display&f=Big+Money-ne


