#!/bin/bash

# path of kitty directory
kitty_dir="$HOME/.config/kitty/"
# path of kitty configuration file
kitty_conf="$HOME/.config/kitty/kitty.conf"

# create variables that will be used to hold loading strings
dir_exists="Kitty Directory Exists"
conf_exists="Kitty Configuration File Exists"

# create a function to display the options to user
display_options() {
    # display the options
    printf "\nOption [1]: Change Font"
    printf "\nOption [2]: Change Font Size"
    printf "\nOption [3]: Change Background Opacity"
    printf "\nOption [4]: Exit Script\n\n"
}

# create a function to display text in slow motion
# TODO: should I continue to use this???
display_slowmo() {
    # creating a local variable
    local word="$1"
    # basically iterating through the "word" being provided ( passings of args )
    for (( i=0; i<${#word}; i++ )); do
        printf "%s" "${word:$i:1}"
        # sleep the program
        sleep 0.05
    done

    printf "\n\n"
}

# create a function for changing font
change_font() {
    printf "\nChange Font\n"

    # displays the options to the user
    printf "\nOption [1]: JetBrainsMono Nerd Font"
    printf "\nOption [2]: Iosevka Nerd Font Mono\n\n"

    # read the input from the user
    read -p "Please Enter Option: " user_font

    # conditions
    # if user wants "JetBrainsMono Nerd Font"
    if [ "$user_font" = 1 ]; then
        # replace font with JetBrainsMono Nerd Font
        sed -i 's/^font_family\s\+family="Iosevka Nerd Font Mono"/font_family      family="JetBrainsMono Nerd Font"/' "$kitty_conf"
        # output confirmation message
        printf "\nFont changed to JetBrainsMono Nerd Font\n"
    
    # if user wants "Iosevka Nerd Font Mono"
    elif [ "$user_font" = 2 ]; then
        # replace font with Iosevka Nerd Font Mono
        sed -i 's/^font_family\s\+family="JetBrainsMono Nerd Font"/font_family      family="Iosevka Nerd Font Mono"/' "$kitty_conf"
        # output confirmation message
        printf "\nFont changed to Iosevka Nerd Font Mono\n"
    
    # if the user inputs something else
    else
        printf "\n"
        # call the function to display in slow motion
        display_slowmo "Wrong Option"
    fi
}

# create a function to change font size
change_font_size() {
    printf "\nChange Font Size\n"

    # read the user's input
    read -p "Please Enter Font Size: " user_font_size

    # change the font size to desired size
    sed -i "s/^font_size\s\+[0-9]\+\(\.[0-9]\+\)\?$/font_size $user_font_size/" "$kitty_conf"

    # outputs the confirmation message
    printf "\nFont size changed to $user_font_size\n"

    # NOTE: there is not "exception handling" for strings here...
    # now I am thinking about it... SHIT!
    # TODO: add an exception handling thing
}

# create a function for changing background opacity
change_bg_opacity() {
    printf "\nChange Background Opacity\n"

    # displays the options to the user
    printf "\nOption [1]: Opaque"
    printf "\nOption [2]: Enable Transparency\n\n"

    # read the user's input
    read -p "Please Enter Option: " user_bg_opacity

    # if the users wants complete opacity / opaque
    if [ "$user_bg_opacity" = 1 ]; then
        # change the background opacity to 1
        sed -i 's/^background_opacity\s\+[0-1]\{1\}\+\.[0-9]\{1\}\+/background_opacity 1.0/' "$kitty_conf"
        # confirmation message
        printf "\nChange Background Opacity To Opaque"

    # if the user wants to "enable" transparency
    elif [ "$user_bg_opacity" = 2 ]; then
        # change the background opacity to 0.7
        sed -i 's/^background_opacity\s\+[0-1]\{1\}\+\.[0-9]\{1\}\+/background_opacity 0.7/' "$kitty_conf"
        # confirmation message
        printf "\nChange Background Opacity To Desired Transparency"

    # if the user enters somethings else
    else
        printf "\n"
        # call the function to display in slow motion
        display_slowmo "Wrong Option"
    fi
}

# main program
printf "\n"

# check if the directory exists
if [ -d "$kitty_dir" ]; then
    # call the function to display in slow motion
    display_slowmo "$dir_exists"

    # check if the configuration file exists
    if [ -e "$kitty_conf" ]; then
        # call the function to display in slow motion
        display_slowmo "$conf_exists"

        # call the function to display the options to user
        display_options

        # ask the user what option he wants to choose
        read -p "Please Select an Option: " user_option

        # user wants to change font
        if [ "$user_option" = 1 ]; then
            # call the function to change font
            change_font

        # user wants to change font size
        elif [ "$user_option" = 2 ]; then
            # call the function to change font size
            change_font_size

        # user wants to change background opacity
        elif [ "$user_option" = 3 ]; then
            # call the function to change font
            change_bg_opacity

        # user wants to exit the script
        elif [ "$user_option" = 4 ]; then
            # exit without any errors
            exit 0

        # if the user enter something else
        else
            printf "\n"
            # call the function to display in slow motion
            display_slowmo "Wrong Option"
        fi

    # if the configuration file is not found
    else
        # output the appropriate message
        printf "\nKitty Configuration File Not Found\n"
    fi

# if the kitty directory is not found
else
    # output the appropriate message
    printf "\nKitty Directory Not Found\n"
fi
