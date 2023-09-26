# hosts/YourHostName/default.nix
{ pkgs, ... }:
{
  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.defaults.dock.autohide = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  users.users.cvs = {
    name = "cvs";
    home = "/Users/cvs";
  };

  home-manager.users.cvs = { pkgs, ... }: {
    home = {
      stateVersion = "23.05";
      
      sessionVariables = {
        EDITOR = "nova";
      };
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      ansible
      atuin
      bat
      bison
      coreutils
      curl
      direnv
      du-dust
      dua
      duf
      gcc
      git
      gh
      htop
      hub
      just
      jq
      mosh
      neofetch
      nix-direnv
      readline
      nmap
      terraform
      tmux
      tree
      unzip
      watch
      wget
      zlib
    ];

    programs.git = {
      enable = true;
      extraConfig.init.defaultBranch = "main";
      userEmail = "curtis.spendlove@knightoftheoldcode.dev";
      userName = "Curtis Spendlove";
      delta.enable = true;
    };

    programs.vim = {
      enable = true;
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      initExtra = "eval \"$(atuin init zsh)\"\n";
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
      "brew-gem"
      "epubcheck"
      "git-standup"
      "icu4c"
      "imagemagick"
      "ossp-uuid"
      "pam-reattach"
      "yazi"
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
      "bbedit"
      "calibre"
      "discord"
      "docker"
      "firefox"
      "github"
      "google-chrome"
      "hazel"
      "inkscape"
      "istat-menus"
      "iterm2"
      "logseq"
      "mimestream"
      "moom"
      "netnewswire"
      "nova"
      "obs"
      "phantomjs"
      "postgres-unofficial"
      "postico"
      "raindropio"
      "raycast"
      "setapp"
      "spotify"
      "steam"
      "swiftbar"
      "transmit"
      "tripmode"
      "tower"
      "utm"
      "visual-studio-code"
      "warp"
      # "yubico-yubikey-manager" # requires Rosetta 2
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      "Amphetamine" = 937984704;
      "Downlink" = 1454269192;
      "Keynote" = 409183694;
      "Microsoft Remote Desktop" = 1295203466;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Save to Raindrop.io" = 1549370672;
      "Tailscale" = 1475387142;
      # "UTM Virtual Machines" = 1538878817; # purchase in MAS or use free from brew
      "Xcode" = 497799835;
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
