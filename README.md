# Just my dotfiles :3

Made by a person with a severe skill issue.^^  
Lots of sample configs and other people's dotfiles were used.

Feel free to borrow anything you need.
But be careful.

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
(I personally don't find it necessary, but the guide says so)
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
6. Optional. Download required nerd fonts.  
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

**FiraCode** as a main font and **Iosevka** for italics in WezTerm.
All patched **Nerd Fonts**.

### Shell

I mostly use **fish**, but still have a somewhat usable **zsh** config and very basic **bashrc**.  

`~/.shells_common.sh` contains aliases+PATH variables, and it is sourced by both bash and zsh.  
Maybe, I will make it so fish could also source it.
But now fish aliases are in `~/.config/fish/aliases.fish`

And yeah, **starship** as my cross-shell prompt engine. Pretty comfy.

### Terminal

Right now I use **WezTerm**, previously used **Alacritty**.

However, instead of builtin tab functionality, I still use **tmux**.
Have some helper scripts for it in respective directory.  
Probably going to change my multiplexer to **zellij** after session saving feature is added.

### Editor

**NeoVim** with **LazyVim** config. Did some changes though.

### Other stuff

**.XCompose** file with some additional symbols for Compose Key.

**Markdownlint**, **prettier** and **stylua** config files.
Not actively using the first two however.

Some helper scripts.
