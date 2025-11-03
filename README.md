# Just my dotfiles :3

Made by a person with a severe skill issue.^^  
Lots of sample configs and other people's dotfiles were used.

Feel free to borrow anything you need. :>

***This will work only only on Linux!!!***  
***Lots of things won't work on macOS, and usually I don't know why.***  
***And, of course, this isn't even intended to work on Windows***

*Managed using [git bare repo](https://www.atlassian.com/git/tutorials/dotfiles)*

## Installation instructions

This is the way I keep my manage my configs.
Of course, you may change names of alias or directory, if you like.

1. Add this line to `.bashrc` or `.zshrc`, or just run it in terminal.
```bash
alias dfgit='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
2. Run this, so not to create any recursion problems when cloning.
(I personally don't find it necessary, but the guide says to do so)
```bash
echo ".dotfiles" >> .gitignore
```
3. Now clone the repository. Don't forget the `--bare`!
```bash
git clone --bare https://github.com/MagnetizedFreckles/dotfiles/ $HOME/.dotfiles
```
4. Checkout (you may need to define alias again and backup existing configs).
```bash
dfgit checkout
```
5. Configure git not to show untracked files for this repo.
```bash
dfgit config --local status.showUntrackedFiles no
```
6. *The script below is unmaintained (also it just sucks) and I don't use it anymore, might as well remove.*  
Download required nerd fonts.  
Script for that is at `~/.scripts/nerdfont_download.sh`  
Firstly, you will need to make this script executable:
```bash
chmod +x $HOME/.scripts/nerdfont_download.sh
```
After that, just run the script
```bash
$HOME/.scripts/nerdfont_download.sh
```
And, at last, you may want to remove the downloaded zips
(I deliberately decided not to make this part of a script)
```bash
rm $HOME/Downloads/FiraCode.zip
rm $HOME/Downloads/Iosevka.zip
```

## Features

### Fonts

[FiraCode](https://github.com/tonsky/FiraCode) as a main font,
and [Iosevka](https://github.com/be5invis/Iosevka) for italics in WezTerm.
All patched [Nerd Fonts](https://www.nerdfonts.com/).

### Shell

I mostly use [fish](https://fishshell.com/), but still have a somewhat usable
**zsh** config (syntax highlighting is borked btw) and very basic **bashrc**.  

`~/.shells_common.sh` contains aliases+PATH variables, and it is sourced by both bash and zsh.  
Maybe, I will make it so fish could also source it.
But now fish aliases are in `~/.config/fish/aliases.fish`

And yeah, [starship](https://starship.rs/) as my cross-shell prompt engine. Pretty comfy.

### Terminal

Now I use [WezTerm](https://github.com/wez/wezterm), previously used [Alacritty](https://alacritty.org/).

However, instead of builtin multiplexing functionality, I still use [tmux](https://github.com/tmux/tmux).  
It has a relatively big config file, yet it is pretty rough around the edges.
I also have some scripts as part of it's config in respective directory.  

Probably will change my multiplexer to [zellij](https://zellij.dev/) someday,
but definitely not soon.

### Editor

[LazyVim](https://www.lazyvim.org/) distribution of [Neovim](https://neovim.io/).

Custom changes include:
- Setting colorscheme to [catppuccin-mocha](https://github.com/catppuccin/catppuccin)
with transparent background.
- Setting an autocmd that builds an html file from md using pandoc,
with support for LaTeX expressions among other things.
- Setting up a small script that lets me cycle between
spellcheck dictionaries. From 3 (*en, ru, uk*) I have two set.

I also have some sort of working config for [helix](https://helix-editor.com/),
but I don't think I will use it in a foreseeable future.  
But the config is still there.

### File managers

Right now I use [yazi](https://github.com/sxyazi/yazi) as my terminal file manager of choice.
It's fast, gets job done and generally has all I want from a terminal file manager.

In the past I also tried to use [xplr](https://xplr.dev/) and [lf](https://github.com/gokcehan/lf).  
xplr is generally nice but a little slow and rough around the edges.  
And the lf is just too tedious for me to properly configure.
Since yazi exists, why even bother?

### Video player

[mpv](https://mpv.io/) with very basic config.

Also I wrote [ytmpv script](/.local/bin/ytmpv),
which downloads video from youtube link to default yt-dlp location,
with default yt-dlp settings (except video quality, it can be changed to 720p)
and then plays the video in mpv.

### Other stuff

**.XCompose** file with some additional symbols for Compose Key.

Config files for [markdownlint](https://github.com/DavidAnson/markdownlint).
Maybe it should be updated.

Default markdown metadata file for [pandoc](https://pandoc.org/).

A little bit of options for [gallery-dl](https://github.com/mikf/gallery-dl).

[yt-dlp](https://github.com/yt-dlp/yt-dlp) config with necessary options, nothing complex.
