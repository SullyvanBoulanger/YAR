YARPATH="$(pwd)"

# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "##############################"
echo "Installing a bunch of stuff"
echo "##############################"
sudo pacman -S --noconfirm --needed xorg xorg-xinit\
    bspwm sxhkd                     \
    ly                              \
    git python3 gcc base-devel      \
    xwallpaper                      \
    mpv                             \
    ttf-cascadia-code               \
    rofi                            \
    yarn                            \
    nodejs                          \
    npm                             \
    xclip                           \
    cmake                           \
    ttf-nerd-fonts-symbols          \
    dunst

# Setup ly
sudo systemctl enable ly.service &

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

echo "##############################"
echo "Installing paru"
echo "##############################"
git clone https://aur.archlinux.org/paru.git
cd paru 
makepkg -si && cd ..
paru -Syu

echo "##############################"
echo "Installing Picom"
echo "##############################"
paru -S --noconfirm --needed picom-jonaburg-git

echo "##############################"
echo "Installing alacritty"
echo "##############################"
paru -S --noconfirm --needed alacritty

echo "##############################"
echo "Installing polybar"
echo "##############################"
paru -S --needed polybar

sudo chmod 777 ~/.config/ -R

echo "##############################"
echo "Installing pywal"
echo "##############################"
paru -Syu pywal

echo "##############################"
echo "Installing vim plug"
echo "##############################"
paru -Syu vim-plug

echo "##############################"
echo "Installing programs"
echo "##############################"

echo "##############################"
echo "NOTE: installing programs now will also add them to the generatecolorscheme script"
echo "##############################"

sleep 2

echo "##############################"
echo "Copying configs"
echo "##############################"

if [ -d $HOME/.config ]; then
    sudo cp -r $YARPATH/configs/alacritty ~/.config
    sudo cp -r $YARPATH/configs/bashrc ~/.config
    sudo cp -r $YARPATH/configs/bspwm ~/.config
    sudo cp -r $YARPATH/configs/picom ~/.config
    sudo cp -r $YARPATH/configs/polybar ~/.config
    sudo cp -r $YARPATH/configs/rofi ~/.config
    sudo cp -r $YARPATH/configs/scripts ~/.config
    sudo cp -r $YARPATH/configs/sxhkd ~/.config
    sudo cp -r $YARPATH/configs/xconfigs ~/.config
    sudo cp -r $YARPATH/configs/nvim ~/.config
else
    sudo cp -r "$YARPATH/configs" ~/
    sudo mv ~/configs ~/.config
fi

sudo cp ~/.config/scripts/generatecolorscheme.sh /bin/generatecolorscheme
sudo cp ~/.config/scripts/setwallpaper.sh /bin/setwallpaper

sudo chmod +x /bin/setwallpaper
sudo chmod +x /bin/generatecolorscheme

sudo mv ~/.config/bashrc/.bashrc ~/.bashrc
sudo rm -r ~/.config/bashrc

sudo mv ~/.config/xconfigs/.xinit ~/.xinit
sudo mv ~/.config/xconfigs/.xprofile ~/.xprofile
sudo rm -r ~/.config/xconfigs
sudo cp -r "$YARPATH/wallpapers" ~/

echo "##############################"
echo "Setting up default colors"
echo "##############################"

DEFAULTWALL="$HOME/wallpapers/prairieAux1000Fleurs.png"

echo $DEFAULTWALL > $HOME/.currentwallpaper
wal -i $DEFAULTWALL -n

nvim $YARPATH/postinstallwarning

