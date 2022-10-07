{ config, lib, pkgs, ... }:
{
  services.nix-daemon.enable = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  programs.zsh.enable = true;

  home-manager.users.pleser = { pkgs, ... }: {
    home.stateVersion = "22.05";
    home.packages = with pkgs; [
      starship
        neovim
        mc
        wget
        tmux
        tree-sitter
    ];
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      initExtra = ''
        eval "$(starship init zsh)";
      '';
    };
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    casks = [
      "adobe-creative-cloud"
        "discord-canary"
        "iina"
        "mountain"
        "steam"
        "affinity-designer"
        "docker"
        "iterm2"	
        "omnigraffle"		
        "telegram"
        "affinity-photo"
        "epic-games"	
        "jetbrains-toolbox"
        "onedrive"		
        "timemachineeditor"
        "alfred"			
        "firefox"			
        "qmk-toolbox"		
        "visual-studio-code"
        "backblaze"		
        "fujitsu-scansnap-home"
        "latexit"	
        "whatsapp"
        "balenaetcher"	
        "github"		
        "microsoft-auto-update"
        "soulver"	
        "zoom"
        "carbon-copy-cloner"
        "hazel"	
        "microsoft-edge"	
        "soundsource"
        ];
  };

}
