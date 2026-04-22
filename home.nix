{ config, pkgs, ... }:

{
  home.username = "kokuen";
  home.homeDirectory = "/home/kokuen";
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
    # system tools
    which
    neovim   
    eza
    blesh
    
    # screen tools
    brightnessctl
  ];

  programs.bash = {
    enable = true;

    bashrcExtra = ''
      # load ble.sh first
      [[ $- == *i* ]] && source -- $(blesh-share)/ble.sh --attach=none
    '';

    shellAliases ={
      # ls
      ls = "eza";
      ll = "eza -lF --time-style=iso";
      la = "eza -lAF --time-style=iso";
    };

    initExtra = ''
      # set vi mode
      set -o vi

      # execute finally
      [[ ! ''${BLE_VERSION-} ]] || ble-attach
    '';
  };

  programs.home-manager.enable = true;
}
