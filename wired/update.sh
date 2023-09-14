#!/bin/bash

package_manager=$(pkgmanager)
config="$HOME/.config/wired"

sudo $package_manager install dbus cairo pango glib2 xss
sudo yum -y install xorg-x11-apps


git clone https://github.com/Toqozz/wired-notify.git
cd wired-notify
cargo build --release

cp ./target/release/wired $HOME/.local/bin/wired-copy

rm -rf "$config/wired-notify"
