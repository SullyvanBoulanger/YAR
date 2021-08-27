# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-init bspwm sxhkd lightdm lightdm-gtk-greeter git

# Setup lightdm
sudo systemctl enable lightdm

clear

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

clear

# Install rust for alacritty
echo "installing Rust and alacritty"
sudo pacman -S --noconfirm --needed rustup cargo

rustup default stable

# Clone and setup alacritty
git clone https://github.com/alacritty/alacritty.git ~
cd ~/alacritty

cargo install --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

clear

# Copying BSPWM, SXHKD and NVIM configs
mkdir ~/.config

sudo cp -r ~/GAR/config/bspwm ~/.config/
sudo cp -r ~/GAR/config/sxhkd ~/.config/

# Copying xinit and xprofile
sudo cp ~/GAR/xconfigs/.xinit ~/
sudo cp ~/GAR/xconfigs/.xprofile ~/
