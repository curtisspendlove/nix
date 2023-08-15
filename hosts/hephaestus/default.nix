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
      ansible
      bat
      coreutils
      direnv
      du-dust
      dua
      duf
      git
      gh
      htop
      hub
      just
      jq
      mosh
      neofetch
      nix-direnv
      nmap
      terraform
      tmux
      tree
      unzip
      watch
      wget
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
    taps = [
      #
    ];
    brews = [
      "mas" # mac app store cli
      "asdf"
      # asdf ruby-build?
      # "postgresql@15"
      # "ruby-build"
      # "openssl@3"
      # "readline"
      # "libyaml"
      # "gmp"
    ];

    casks = [
      "1password"
      "1password-cli"
      "android-studio"
      "arc"
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
      "netnewswire"
      "obs"
      "raycast"
      "setapp"
      "steam"
      "utm"
      "visual-studio-code"
      "yubico-yubikey-manager"
    ];

    masApps = {
      "Amphetamine" = 937984704;
      "Keynote" = 409183694;
      "Microsoft Remote Desktop" = 1295203466;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Tailscale" = 1475387142;
      # "UTM Virtual Machines" = 1538878817;
      # "Xcode" = 497799835;
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
