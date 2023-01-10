{ config, lib, pkgs, ... }:
{
  services.nix-daemon.enable = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  networking = {
    computerName = "majorana";
    hostName = "majorana";
  };

  programs.zsh.enable = true;
  programs.nix-index.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.dock.orientation = "right";
  system.defaults.dock.wvous-br-corner = 14;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;

  home-manager.users.pleser = { pkgs, ... }: {
    home.stateVersion = "22.05";
    home.packages = with pkgs; [
      starship
        neovim
        mc
        wget
        tmux
        tree-sitter
        git
    ];
    programs.zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      initExtra = ''
        export CLICOLOR=1
        eval `/usr/libexec/path_helper`
        eval "$(starship init zsh)";
      '';
    };
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    taps = [ "homebrew/cask-drivers" ];
    casks = [
      "1password"
        "arq"
        "adobe-creative-cloud"
        "discord"
        "iina"
        "mountain"
        "steam"
        "affinity-photo"
        "affinity-designer"
        "docker"
        "iterm2"	
        "rocket"
        "omnigraffle"		
        "telegram"
        "epic-games"	
        "jetbrains-toolbox"
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
        "nova"
        "onedrive"
        "microsoft-auto-update"
        "microsoft-edge"
        "microsoft-excel"
        "microsoft-word"
        "soulver"	
        "zoom"
        "carbon-copy-cloner"
        "hazel"	
        "soundsource"
        ];
    masApps = {
      Xcode = 497799835;
      Keynote = 409183694;
      iMovie = 408981434;
      "Brother P-touch Editor" = 1453365242;
      AusweisApp2 = 948660805;
      Tweetbot = 1384080005;
      PCalc = 403504866;
      Pages = 409201541;
      Numbers = 409203825;
      Wipr = 1320666476;
      DaisyDisk = 411643860;
    };
  };

}
