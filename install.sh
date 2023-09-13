#!/bin/bash

package_manager="dnf"
dotfiles_path="$HOME/dotfiles"
fonts_dir="$HOME/.fonts"

# general dependencies
sudo $package_manager install git gcc vim neovim npm lxappearance numlockx maim \
                                pipewire xclip ripgrep powerprofilesctl mpc picom \
                                acpi wpctl amixer glib
# lxappearance: change gtk theme
# numlockx: toggle numlock
# maim: screenshot
# pipewire: volume
# xclip: command to copy to clipboard 
# ripgrep: required for nvim project grep
# powerprofilesctl: switche power profile
# mpc: music
# picom: compositer
# acpi: battery info
# amixer: volume
# wpctl: volume
# glib: utility

# wm stuff
sudo $package_manager install i3 i3status i3lock xbacklight feh
#utils
sudo $package_manager install pavucontrol blueman tlp xrandr arandr rofi tmux \
                        alacritty
# pavucontrol: sound control
# blueman: gui bluetooth manager
# tlp: battery management
# xrandr: cli tool for display managment
# arandr: gui tool for display managment
# rofi

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cd "$HOME/.config"

ln -s "$dotfiles_path/nvim" .
ln -s "$dotfiles_path/i3" .
ln -s "$dotfiles_path/eww" .
ln -s "$dotfiles_path/alacritty" .
# ln -s "$dotfiles_path/rofi" .
ln -s "$dotfiles_path/tmux" .
ln -s "$dotfiles_path/picom" .

# source tmux config
tmux source "$HOME/.config/tmux/tmux.conf"
# Note: press prefix + I to install packages in tmux

# install eww
./eww/update

# installing fonts
mkdir -p "$fonts_dir/"
cp -r ./fonts/* "$fonts_dir"
fc-cache

# tlp config
sudo mv tlp/tlp.conf /etc/tlp.conf

cp ./wallpapers ~/Pictures/wallpapers
