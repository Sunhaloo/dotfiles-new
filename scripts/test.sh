#!/bin/bash

# create a function to display options to use
display_options() {
    # output these options on the screen
    printf "\nOption [1]: Update and Install Drivers and Tools"
    printf "\nOption [2]: Install Dotfiles Applications"
    printf "\nOption [3]: Create Folders & Move Dotfiles Configuration Applications"
    printf "\nOption [4]: Exit\n\n"
}

# create a function to install Oh-My-Zsh
oh_my_zsh() {
    # basically taken from GitHub
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    printf "\n\nInstalling Zsh Plugins\n\n"

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# create a function to delete and create files / folders
delete_make_files() {
    # call the function to delete existing file and folders
    printf "\nDeleting Existing Files & Folders\n\n"
    # remove "existing" folders
    rm -rf ~/GitHub
    rm -rf ~/OBS\ Studio/
    rm -rf ~/Obsidian/
    
    printf "\nCreating Files Folders\n\n"
    # create folders
    mkdir -p ~/GitHub/
    mkdir -p ~/OBS\ Studio/
    mkdir -p ~/Obsidian/
}

# create a function to handle manipulation of folders in dotfiles
dotfiles_manipulation() {
    printf "\nCloning Folder from GitHub\n\n"
    # clone my dotfiles repository
    git clone https://github.com/Sunhaloo/dotfiles-new ~/GitHub/dotfiles-new

    printf "\nChecking for Existing Files & Folders\n\n"

    # remove "existing" folders
    rm -rf ~/.config/i3
    rm -rf ~/.config/kitty
    rm -rf ~/.config/ohmyposh
    rm -rf ~/.config/polybar
    rm -rf ~/.config/picom
    rm -rf ~/.config/rofi
    rm -rf ~/.zshrc

    printf "\nMoving Folders\n\n"
    # copy folders from dotfiles to `~/.config`
    cp -r ~/GitHub/dotfiles-new/i3 ~/.config/
    cp -r ~/GitHub/dotfiles-new/kitty ~/.config/
    cp -r ~/GitHub/dotfiles-new/ohmyposh ~/.config/
    cp -r ~/GitHub/dotfiles-new/polybar ~/.config/
    cp -r ~/GitHub/dotfiles-new/picom ~/.config/
    cp -r ~/GitHub/dotfiles-new/rofi ~/.config/
    cp -r ~/GitHub/dotfiles-new/.zshrc ~/

    printf "\nNeovim Configuration\n\n"

    # remove existing "logs" ( idk )
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim

    # copy folders from dotfiles to `~/.config`
    cp -r ~/GitHub/dotfiles-new/nvim ~/.config/

}

# first of all; run `git.sh` ( no matter what )
# check if the file exists
if [ -f git.sh ]; then
    printf "\nRunning Git Script\n\n"
    # make sure that `git.sh` is executable
    chmod +x git.sh
    # run the script
    bash ./git.sh
# if the file has not been found
else
    # output approriate message
    printf "\n\nSript File has NOT been Found!!!\n\n"
    # exit with error
    exit 1


# call the function to display options to user
display_options

# read the user input
read -p "Please Enter An Option: " user_option

# Function to check and install packages
install_package() {
    for package in "$@"; do
        if pacman -Qs "$package" > /dev/null; then
            echo "$package is already installed."
        else
            echo "Installing $package..."
            sudo pacman -S --noconfirm "$package"
        fi
    done
}

# Function to check and install AUR packages
install_yay_package() {
    for package in "$@"; do
        if yay -Qs "$package" > /dev/null; then
            echo "$package is already installed."
        else
            echo "Installing $package..."
            yay -S --noconfirm "$package"
        fi
    done
}

# conditions
# if user want to install the required packages ( that I use )
if [ "$user_option" = 1 ]; then
    printf "\nInstalling Drivers and Tools + Misc Packages\n\n"

    # update the system ( press 'Y' for us with `--noconfirm` )
    sudo pacman -Syu --noconfirm
    # install required packages from lovely pacman
    install_package i3 git kitty lxinput feh maim xclip ldns thunar-volman gvfs gvfs-afc gufw gcc clang python-requests nodejs npm rustup lua openjdk21-src ffmpeg ripgrep fd zoxide fzf eza rofi-emoji mypaint btop brightnessctl neovim lazygit
    # install required packages from the AUR
    install_yay_package intel-ivsc-firmware nwg-look

# if the user wants to install the regular applications that I use
elif [ "$user_option" = 2 ]; then
    printf "\nInstalling Regular Applications\n\n"

    # update the system ( press 'Y' for us with `--noconfirm` )
    sudo pacman -Syu --noconfirm
    # install required packages from pacman
    install_package thunar obsidian discord autotiling picom polybar zsh ttf-jetbrains-mono-nerd ttf-iosevka-nerd rofi
    # install required packages from the AUR
    install_yay_package vscodium-bin thorium-browser-bin sublime-text-4 bibata-cursor-theme oh-my-posh

    printf "\n\nInstalling Oh-My-Zsh\n\n"

    # basically taken from GitHub
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    printf "\n\nInstalling Zsh Plugins\n\n"

    # call the function to install Oh-My-Zsh
    oh_my_zsh

# if the user selects to make the folders and stuff
elif [ "$user_option" = 3 ]; then
    printf "\nMaking Folders, Cloning Git Repositories, Moving Folder\n\n"

    # call the function to delete and create folders
    delete_make_files

    # call the function to move clone dotfiles and move folders
    dotfiles_manipulation


    # NOTE: I use Endeavour OS with i3 WM ( installing from calamares installer )
    # hence, I delete the packages that I dont' need
    printf "\nCleaning Up Things\n\n"
    sudo pacman -R endeavouros-xfce4-terminal-colors
    sudo pacman -R xfce4-terminal
    sudo pacman -R xterm

# if the user wants to exits the script
elif [ "$user_option" = 4 ]; then
    printf "\nGoodBye!\n\n"
    exit 0
# if the user enters something else
else
    printf "\nWrong Option\n"
fi
