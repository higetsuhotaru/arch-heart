{ config, pkgs, ... }:

{
  home.username = "kokuen";
  home.homeDirectory = "/home/kokuen";
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
    # system tools
    neovim   
    eza
  ];

  programs.bash = {
    enable = true;

    shellAliases ={
      # ls
      ls = "eza --icons";
      ll = "eza -lF --icons --time-style=iso";
      la = "eza -lAF --icons --time-style=iso";
    };
  };

  programs.home-manager.enable = true;
}
