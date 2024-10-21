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
        printf "\nOption [2]: Change Background Opacity\n\n"

        # ask the user what option he wants to choose
        read -p "Please Select an Option: " user_option

        # conditions
        if [ "$user_option" -eq 1 ]; then
            # call the function to change font
            change_font

        elif [ "$user_option" -eq 2 ]; then
            # call the function to change font
            change_bg_opacity
        # if the user enter something else
        else
            display_slowmo "Wrong Option"
        fi

    else
        printf "\nKitty Configuration File Not Found\n"
    fi

else
    printf "\nKitty Directory Not Found\n"
fi
