{ pkgs, ... }:
{

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
programs.zsh.enable = true;
home-manager.useGlobalPkgs = true;
home-manager.useUserPackages = true;
home-manager.users.pleser = { pkgs, ... }: {
  home.stateVersion = "22.05";
};
homebrew = {
  enable = true;
  autoUpdate = true;
  casks = [
    "iina"
  ];
};

}
