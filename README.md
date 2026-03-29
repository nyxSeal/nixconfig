# My NixOS config

This is my personal NixOS config. I don't recommend on anyone else using this, these are just to help me remember what to do. Some information may be outdated.

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

### Adding hosts
- add a directory in ./hosts for that user
- add an entry to the flake.nix file (the 'user' on top is the host name, not the user)
  - copy and paste one of the other host entries, not any ISO entries
  - change the ```system``` argument if needed
- create a disko-config.nix file in the new ./hosts host directory
    - declare the filesystem
- create a default.nix file in the new ./hosts host directory
    - declare required options listed below
    - declare optional options listed below if you would like (dependency modules are handled automatically, do not change them)
    - import ```../../modules/modulebundle.nix```, ```../../globalvars.nix```,  ```./hardware-configuration.nix```, and ```disko-config.nix```
    - NOTE: do not declare options and packages below unless only required by that specific system and no other
- install the system, pick 'y' when asked to generate hardware-configuratiion.nix



BRIGHTNESS CONTROL

- Notes
  - KDE
    - KDE has a brightness service called PowerDevil that allows you to control brightness from a widget in the system tray.
    - If it stops working, try running systemctl --user restart plasma-powershell
    - One of these two tools are still needed for it to work.
  - If using both a laptop and external monitor you will need both ddcutil and brightnessctl
 
- EXTERNAL MONITORS
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

- Notes 
  - All options are of type *bool* unless stated otherwise
  - Any option under ```requires``` needs to be manually set
  - Any options under ```other enabled options``` will be enabled automatically when enabling that option

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

- ```diskName``` (default = null)
  - The main disk (where the boot/EFI partition is present), excluding ```/dev``` and any partitions (mainly used for GRUB MBR layouts)
  - Type: string

  

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


 



Services: 
- ```services.man.enable``` (default = true)
  - Enables extra documentation (tealdeer and more man pages)

- ```services.sound-driver.enable``` (default = false)
  - Enables pipewire, allowing sound to be played

- ```services.printing.enable``` (default = false)
  - Enables CUPS and some other daemons to manage printing 

- ```nixpkgs.config.allowUnfree``` (default = true)
  - Enables 'unfree' software to be installed (includes steam)
 
Swap: 
- ```zram.enable``` (default = false)
  - Enables zram, which compresses RAM
 
- ```zswap.enable``` (default = false)
  - Enables zswap, which I'm not too confident on what it does but only enable if using swap partitions and don't use it alongside zram unless you know what you're doing



Vendor specific:
- ```vendor.amd-gpu.enable``` (default = false)
  - Enables extra options for AMD gpus
  - Requires: an AMD gpu



Brightness:
- ```brightness.brightnessctl.enable``` (default = false)
  - Enables the brightnessctl manager for internal display brightness management

- ```brightness.ddcutil.enable``` (default = false)
  - Enables the ddcutil manager for external display brightness management




Desktop environment/window manager:  
- ```kde.enable``` (default = false)
  - Enables the KDE Plasma desktop environment + plasma-manager for configuration
  - Other enabled options: home manager
  
- ```niri.enable``` (default = false)
  - Enables the niri window manager + configuration
  - Other enabled options: home manager



Browser:
- ```librewolf.enable``` (default = false)
  - Enables the Librewolf browser
  - Requires: a GUI
  
- ```floorp.enable``` (default = false)
  - Enables the Floorp browser
  - Requires: a GUI

- ```tor.enable``` (default = false)
  - Enables the Tor browser
  - Requires: a GUI



GUI applications:
 
- ```guiapps.enable``` (default = false)
  - Enables a suite of gui applications
  - Requires: a GUI

- ```entertainment.enable``` (default = false)
  - Enables games and game-related apps or features (steam, vesktop, discord, prismlauncher)
  - Requires: a GUI, ```nixpkgs.config.AllowUnfree```

- ```alacritty.enable``` (default = false)
  - Enables the alacritty terminal emulator and related settings
  - Other enabled options: home manager
  - Requires: a GUI

- ```noctalia.enable``` (default = false)
  - Enables noctalia-shell, a minimal desktop environment for window managers. Adds useful features for window managers, including system tray/bar and application launcher
  - Other enabled options: home manager
  - Requires: a GUI



Other:
 
- ```development.enable``` (default = false)
  - Enables a code development suite (wip, currently just a c++ compiler)
 

 



Do not touch the following (these are enabled by other modules when needed):
- ```gui.enable``` (default = false)
  - Enables a display manaager that allows the launching of desktop environments.
  - Enabled when any of the desktop environments or window managers are enabled
- ```home-manager.enable``` (default = false)
  - Enables home manager





## Updating/committing branches:

- Run the ```rebuild``` alias in the terminal to update, commit, or merge branches
  - When running this alias, you are given an interactive git prompt. Select 5 (patch), then select the files with the number it is assigned to in the status. After, type 'y' to stage the current segment of code, 'a' to stage all future segments, and 'e' to edit the current segment (type '?' to get help)
- Or, run ```sudo nixos-rebuild switch --flake ~/.nixconfig#<host>```, and replace ```<host>``` with the host you want to install
    - ie. ```sudo nixos-rebuild switch --flake ~/.nixconfig/flake.nix#nixy```

## Troubleshooting
- Home manager service failed to start
  - Run ```systemctl status -n100 home-manager-<mainUser>.service``` to see the actual error
- Alejandra found an error
  - Since Alejandra cites errors in characters and not lines, eval the file manually with nix using the command:
  - ```nix eval --file <path/to/file.nix>```
- Run the keybind ```Ctrl+Alt+F2``` to login via TTY instead of a login manager (ly)
- Press ```e``` on a boot entry to edit it (for example, replace the init from a nix store path to ```/bin/sh```)

## Other
To create the ASCII titles in my configs (not using them anymore): https://patorjk.com/software/taag/#p=display&f=Big+Money-ne
