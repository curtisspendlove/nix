# nix

## Getting Started

On a clean Mac, it'll need nix and homebrew (want to add these dependencies into the nix config somehow, not sure if it's possible).

I've just installed homebrew in the default manner.

I like the Determinate Systems Nix Installer: https://zero-to-nix.com/start/install.

With these, you should be able to run:

```
nix --extra-experimental-features 'nix-command flakes'  build ".#darwinConfigurations.{{target_host}}.system" {{flags}}

./result/sw/bin/darwin-rebuild switch --flake ".#{{target_host}}"
```

`{{target_host}}` needs to be subsituted with your local mac name:

``

```
hostname | cut -d "." -f 1
```

The `Justfile` does all of this if you install `just` (which can be done via homegrew; again I want to bake this all in if possible).

You can change the hostname of your Mac in the Sharing Panel (older) or General Settings (newer).

(add screenshot of general settings panel)
