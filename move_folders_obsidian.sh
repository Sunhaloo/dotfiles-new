#!/bin/bash

github="$HOME/GitHub/obsidian"
github_sun="$HOME/GitHub/obsidian/S.Sunhaloo"
github_qna="$HOME/GitHub/obsidian/Question - Problems - Solutions"

obsidian="$HOME/Obsidian/"
obsidian_sun="$HOME/Obsidian/S.Sunhaloo"
obsidian_qna="$HOME/Obsidian/Question - Problems - Solutions"

# create functions to move folders
github_obsidian() {
    printf "\nDeleting Folders in '%s' Directory" "$obsidian"
    rm -rf "$obsidian_sun"
    rm -rf "$obsidian_qna"

    printf "\nMoving Folders to '%s'\n" "$obsidian"
    cp -r "$github_sun" "$obsidian"
    cp -r "$github_qna" "$obsidian"
}


obsidian_github() {
    printf "\nDeleting Folders in '%s' Directory" "$github"
    rm -rf "$github_sun"
    rm -rf "$github_qna"

    printf "\nMoving Folders to '%s'\n" "$github"
    cp -r "$obsidian_sun" "$github"
    cp -r "$obsidian_qna" "$github"
}


printf "\nObsidian Vault Folder Move Script\n"

printf "\nOption [1]: Move From Obsidian to GitHub"
printf "\nOption [2]: Move From GitHub to Obsidian"
printf "\nOption [3]: Exit Script\n\n"

# ask the user to enter option
read -p "Please Enter Option: " user_option

if [ "$user_option" = 1 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$obsidian" "$github"
    # call the function ( Obsidian ---> GitHub )
    obsidian_github
elif [ "$user_option" = 2 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$github" "$obsidian"
    # call the function ( GitHub ---> Obsidian )
    github_obsidian
elif [ "$user_option" = 3 ]; then
    # exit the program
    exit 0
else
    printf "\nWrong Input\n"
fi

