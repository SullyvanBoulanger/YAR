# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-xinit bspwm sxhkd lightdm lightdm-gtk-greeter git python3 gcc base-devel xwallpaper

# Setup lightdm and nitrogen
sudo systemctl enable lightdm &

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

# Install rust for alacritty
echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

# Installing paru
git clone https://aur.archlinux.org/paru.git ./.srcs/paru
cd ./.srcs/paru
makepkg -si
paru -Syu

# Install picom from jonaburg's repo
paru -S --noconfirm --needed picom-jonaburg-git

# Installing alacritty
paru -S --noconfirm --needed alacritty

# Copying BSPWM, SXHKD, NVIM, Alacritty and PICOM configs
mkdir ~/.config

# BSPWM and SXHKD
mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

sudo cp -r ~/GAR/configs/bspwm/bspwmrc ~/.config/bspwm/
sudo cp -r ~/GAR/configs/sxhkd/sxhkdrc ~/.config/sxhkd/

# Alacritty
mkdir ~/.config/alacritty/

sudo cp -r ~/GAR/configs/alacritty/alacritty.yml ~/.config/alacritty/

# Picom
mkdir ~/.config/picom/

sudo cp -r ~/GAR/configs/picom/picom.conf ~/.config/picom/

# Wallpaper
mkdir ~/.config/wallpapers/

sudo cp -r ~/GAR/wallpapers/wallpaper.jpg ~/.config/wallpapers/

# Copying xinit and xprofile
sudo cp ~/GAR/xconfigs/.xinit ~/
sudo cp ~/GAR/xconfigs/.xprofile ~/
