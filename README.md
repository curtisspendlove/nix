# nix

## Getting Started

On a clean Mac, it'll need nix and homebrew (want to add these dependencies into the nix config somehow, not sure if it's possible).

I've just installed [homebrew](https://brew.sh) in the default manner.

I like the [Determinate Nix Installer](https://zero-to-nix.com/concepts/nix-installer).

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

You'll also likely want to customize the personal information in the config sections and lists of installed software.

I plan on breaking these out into a cleaner set of files in the future.

(add screenshot of general settings panel)

## Troubleshooting

If one needs to shoot one's troubles...

You may run into ruby build issues when running beta versions of macOS. You'll need your `xcode-select` configuration to point to a current version of Xcode / Command Line Tools:

```
Last 10 log lines:
checking for a race-free mkdir -p... /opt/homebrew/bin/gmkdir -p
checking for dtrace... dtrace
checking for dot... no
checking for doxygen... no
checking for pkg-config... pkg-config
checking whether it is Android... no
checking for cd using physical directory... cd -P
checking whether CFLAGS is valid... yes
checking whether LDFLAGS is valid... no
configure: error: something wrong with LDFLAGS="-L/Users/cvs/.asdf/installs/ruby/3.2.2/lib
```

Release version of Xcode:
`sudo xcode-select -s /Library/Developer/CommandLineTools`

Pre-release version of Xcode:
`sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer`

I'm currently working on this issue...until I have `asdf` installig ruby properly; I'm running the brew formula for current ruby.

If using the workaround, you may have to temporarily set your shell `PATH` to use the homebrew ruby first:

`export PATH="/opt/homebrew/opt/ruby/bin:$PATH"`

## Thanks

Thanks goes out to a few people from the Linux community for the not-so-gentle push toward `nix`:

- [Jupiter Broadcasting](https://www.jupiterbroadcasting.com) (particularly: [LINUX Unplugged](https://www.jupiterbroadcasting.com/show/linux-unplugged/) and [Self Hosted](https://www.jupiterbroadcasting.com/show/self-hosted/))
- [Alex Kretzschmar](https://blog.ktz.me) ([ironicbadger](https://github.com/ironicbadger?tab=repositories))
- [Martin Wimpress](https://wimpysworld.com) ([wimpysworld](https://github.com/wimpysworld))

*I dream of attaining `nix` god-mode like Wimpy at some point in the near future.*
