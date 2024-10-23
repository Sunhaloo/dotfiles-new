#!/bin/bash

printf "\nChecking if Git is installed...\n\n"

# run the command 'git' to check if installed
# `&> /dev/null`
# `&>` ==> redirects the output / errors to...
# `/dev/null` / "Black Hole for Data" ==> special file that discards everything being written to it
if command -v git &> /dev/null
then
    printf "\nGit is already installed. Skipping installation.\n\n"
# if git is not installed
else
    printf "\nGit is not installed. Installing Git...\n\n"
    # install git
    sudo pacman -S git
fi

# read the user's email and name
read -p "Please Enter Your Email: " user_email
read -p "Please Enter Your Username: " user_name

printf "\nRunning Git Configuration...\n\n"

# configure git
git config --global user.email "$user_email"
git config --global user.name "$user_name"
git config --global init.defaultBranch main
# list the configurations
git config --list

# successfully configured git
printf "\n\nGit Configuration Completed.\n" || \
# if something fails
printf "\n\nGit Configuration Failed.\n"
