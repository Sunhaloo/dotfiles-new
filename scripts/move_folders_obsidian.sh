#!/bin/bash

# create variables for "GitHub" side
github="$HOME/GitHub/obsidian"
github_sun="$HOME/GitHub/obsidian/S.Sunhaloo"
github_qna="$HOME/GitHub/obsidian/Question - Problems - Solutions"

# create variables for "Obsidian" side
obsidian="$HOME/Obsidian/"
obsidian_sun="$HOME/Obsidian/S.Sunhaloo"
obsidian_qna="$HOME/Obsidian/Question - Problems - Solutions"

# create a function to display options to user
displaY_options() {
    printf "\nObsidian Vault Folder Move Script\n\n"
    
    # display the options on the screen
    printf "\nOption [1]: Move From Obsidian to GitHub"
    printf "\nOption [2]: Move From GitHub to Obsidian"
    printf "\nOption [3]: Exit Script\n\n"
}

# create functions to move folders ( from GitHub ---> Obsidian )
github_obsidian() {
    printf "\nDeleting Folders in '%s' Directory" "$obsidian"
    # delete the folders in the `Obsidian` directory
    rm -rf "$obsidian_sun"
    rm -rf "$obsidian_qna"

    # copy folders from `GitHub/obsidian` to `Obsidian`
    printf "\nCopying Folders to '%s'\n" "$obsidian"
    cp -r "$github_sun" "$obsidian"
    cp -r "$github_qna" "$obsidian"
}


# create functions to move folders ( from Obsidian ---> GitHub )
obsidian_github() {
    printf "\nDeleting Folders in '%s' Directory" "$github"
    # delete the folders in the `GitHub/obsidian` directory
    rm -rf "$github_sun"
    rm -rf "$github_qna"

    printf "\nCopying Folders to '%s'\n" "$github"
    # copy folders from `Obsidian` to `GitHub`
    cp -r "$obsidian_sun" "$github"
    cp -r "$obsidian_qna" "$github"
}


# call the function to display options to user
displaY_options

# ask the user to enter option
read -p "Please Enter Option: " user_option

# if the user wants to ( `Obsidian` ---> `GitHub/obsidian` )
if [ "$user_option" = 1 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$obsidian" "$github"
    # call the function ( `Obsidian` ---> `GitHub/obsidian` )
    obsidian_github

# if the user wants to ( `GitHub/obsidian` ---> `Obsidian` )
elif [ "$user_option" = 2 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$github" "$obsidian"
    # call the function ( `GitHub/obsidian` ---> `Obsidian` )
    github_obsidian

# if the user wants to exit the program
elif [ "$user_option" = 3 ]; then
    # exit the program ( without any errors )
    exit 0
# if the user enters a "wrong" option
else
    printf "\nWrong Input\n"
fi
