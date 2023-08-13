# hosts/YourHostName/default.nix
{ pkgs, ... }:
{
  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.defaults.dock.autohide = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  users.users.cvs = {
    name = "cvs";
    home = "/Users/cvs";
  };

  home-manager.users.cvs = { pkgs, ... }: {
    home.stateVersion = "23.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      bat
      direnv
      git
      gh
      htop
      mosh
      nix-direnv
      tmux
    ];

    programs.git = {
      enable = true;
      userEmail = "curtis.spendlove@knightoftheoldcode.dev";
      userName = "Curtis Spendlove";
      delta.enable = true;
    };

    programs.vim = {
      enable = true;
    };

    programs.zsh = {
      enable = true;
      zplug = {
        enable = true;
        plugins = [
          { name =  "ohmyzsh/ohmyzsh"; }
        ];
      };
    };
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
      "jq"
      "smartmontools"
      "terraform"
      "tree"
      "watch"
      "wget"
    ];

    casks = [
      "1password"
      "1password-cli"
      "android-studio"
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
      "steam"
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
