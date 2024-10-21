#!/bin/bash

# path of kitty directory
kitty_dir="$HOME/.config/kitty/"
# path of kitty configuration file
kitty_conf="$HOME/.config/kitty/kitty.conf"

# create variables that will be used to hold loading strings
dir_exists="Kitty Directory Exists"
conf_exists="Kitty Configuration File Exists"

# create a function to display text in slow motion
display_slowmo() {
    # creating a local variable
    local word="$1"
    for (( i=0; i<${#word}; i++ )); do
        printf "%s" "${word:$i:1}"
        sleep 0.1
    done

    printf "\n\n"
}

# create a function for changing font
change_font() {
    printf "\nChange Font\n"

    # displays the options to the user
    printf "\nOption [1]: JetBrainsMono Nerd Font"
    printf "\nOption [2]: Iosevka Nerd Font Mono\n\n"

    # ask the user for option
    read -p "Please Enter Option: " user_font

    # conditions
    # JetBrainsMono Nerd Font
    if [ "$user_font" = 1 ]; then
        pass
    # Iosevka Nerd Font Mono
    elif [ "$user_font" = 2 ]; then
        pass
    else
        printf "\n"
        display_slowmo "Wrong Option"
    fi

}

# create a function for changing font
change_font_chat() {
    printf "\nChange Font\n"

    # displays the options to the user
    printf "\nOption [1]: JetBrainsMono Nerd Font"
    printf "\nOption [2]: Iosevka Nerd Font Mono\n\n"

    # ask the user for option
    read -p "Please Enter Option: " user_font

    # path to kitty configuration file
    kitty_conf="$HOME/.config/kitty/kitty.conf"

    # conditions
    # JetBrainsMono Nerd Font
    if [ "$user_font" = 1 ]; then
        # replace font with JetBrainsMono Nerd Font
        sed -i 's/^font_family\s\+family="Iosevka Nerd Font Mono"/font_family      family="JetBrainsMono Nerd Font"/' "$kitty_conf"
        printf "\nFont changed to JetBrainsMono Nerd Font\n"
    
    # Iosevka Nerd Font Mono
    elif [ "$user_font" = 2 ]; then
        # replace font with Iosevka Nerd Font Mono
        sed -i 's/^font_family\s\+family="JetBrainsMono Nerd Font"/font_family      family="Iosevka Nerd Font Mono"/' "$kitty_conf"
        printf "\nFont changed to Iosevka Nerd Font Mono\n"
    
    else
        printf "\n"
        display_slowmo "Wrong Option"
    fi
}


# create a function to change font size
change_font_size() {
    printf "\nChange Font Size\n"
}

# create a function for changing background opacity
change_bg_opacity() {
    printf "\nChange Opacity\n"
}

# main program

printf "\n"

# check if the file at that path exists
if [ -d "$kitty_dir" ]; then
    # call the function to display in slow motion
    display_slowmo "$dir_exists"

    if [ -e "$kitty_conf" ]; then
        # call the function to display in slow motion
        display_slowmo "$conf_exists"

        # display the options
        printf "\nOption [1]: Change Font"
        printf "\nOption [2]: Change Font Size"
        printf "\nOption [3]: Change Background Opacity\n\n"

        # ask the user what option he wants to choose
        read -p "Please Select an Option: " user_option

        # user wants to change font
        if [ "$user_option" = 1 ]; then
            # call the function to change font
            change_font_chat

        # user wants to change font size
        elif [ "$user_option" = 2 ]; then
            # call the function to change font size
            change_font_size

        # user wants to chagne background opacity
        elif [ "$user_option" = 3 ]; then
            # call the function to change font
            change_bg_opacity

        # if the user enter something else
        else
            printf "\n"
            display_slowmo "Wrong Option"
        fi

    else
        printf "\nKitty Configuration File Not Found\n"
    fi

else
    printf "\nKitty Directory Not Found\n"
fi
