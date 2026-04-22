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

    # screen tools
    brightnessctl
  ];

  programs.bash = {
    enable = true;

    shellAliases ={
      # ls
      ls = "eza";
      ll = "eza -lF --time-style=iso";
      la = "eza -lAF --time-style=iso";
    };
  };

  programs.home-manager.enable = true;
}
