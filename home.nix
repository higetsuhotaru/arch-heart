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
  };

  programs.home-manager.enable = true;
}
