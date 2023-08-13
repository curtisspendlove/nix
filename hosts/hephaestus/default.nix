# hosts/YourHostName/default.nix
{ pkgs, ... }:
{
  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.defaults.dock.autohide = true;
  users.users.cvs.home = "/Users/cvs";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cvs = { pkgs, ... }: {
    home.stateVersion = "23.05";
    home.packages = with pkgs; [
      mosh
      tmux
    ];
  };
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    brews = [
      "mas" # mac app store cli
      "ansible"
      "ansible-lint"
      "asdf"
      "coreutils"
      "gh"
      "htop"
      "jq"
      "smartmontools"
      "terraform"
      "tree"
      "watch"
      "wget"
    ];
    casks = [
      "1password"
      "balenaetcher"
      "bartender"
      "discord"
      "docker"
      "firefox"
      "google-chrome"
      "istat-menus"
      "iterm2"
      "logseq"
      "mimestream"
      "moom"
      "setapp"
      "visual-studio-code"
      "yubico-yubikey-manager"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Microsoft Remote Desktop" = 1295203466;
    };
  };

  nix = {
    #package = lib.mkDefault pkgs.unstable.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

}
