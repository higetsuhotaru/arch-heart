{ config, pkgs, ... }:

{
  home.username = "kokuen";
  home.homeDirectory = "/home/kokuen";
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
    # system tools
    eza
    blesh
    zoxide
    fzf
  ];

  programs.bash = {
    enable = true;

    bashrcExtra = ''
      # load ble.sh first
      [[ $- == *i* ]] && source -- $(blesh-share)/ble.sh --attach=none
    '';

    shellAliases = {
      # ls
      ls = "eza";
      ll = "eza -lF --time-style=iso";
      la = "eza -lAF --time-style=iso";
    };

    initExtra = ''
      # set vi mode
      set -o vi

      # set zoxide
      export _ZO_MAXAGE=1000
      export _ZO_DATA_DIR="$HOME/.local/share/zoxide"
      export _ZO_EXCLUDE_DIRS="/sys:/usr:/tmp:$HOME/tmp:*/.git:*/.git/*"
      eval "$(zoxide init bash)"
      
      # zoxide funcs
      zi() {
        local dir
        dir=$(zoxide query -l | fzf --preview 'eza -lhF --time-style=iso {}') && z "$(dir)"  
      } 

      # home-manager funs
      home-manager() {
        if [ "$1" = "update" ]; then
          command home-manager switch --flake ~/.config/home-manager
        else
          command home-manager "$@"
        fi
      }
      
      # execute finally
      [[ ! ''${BLE_VERSION-} ]] || ble-attach
    '';
  };

  programs.home-manager.enable = true;
}
