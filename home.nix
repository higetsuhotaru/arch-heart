{ config, pkgs, ... }:

{
  home.username = "kokuen";
  home.homeDirectory = "/home/kokuen";
  home.packages = [];

  programs.home-manager.enable = true;
}
