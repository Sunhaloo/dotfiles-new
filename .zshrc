# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path of Binaries ( I think )
export PATH="$PATH:/home/azmaan/.local/bin"

ZSH_THEME="robbyrussell"
# uncomment line below for random theme
# ZSH_THEME="random"


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

# FUNCTIONS
# create a function to source `.zshrc` file
zsh_src() {
    source ~/.zshrc
}

# create a function to change profile of kitty
kitty_profile() {
  sh ~/scripts/profile.sh
}

# create a function to move obsidian folders to github folder using bash script
obsidian_move() {
    sh ~/scripts/move_folders_obsidian.sh
}

# ALIASES

# System
# change 'sudo' to 'fucking'
alias fucking='sudo'

# System ( Arch / Arch Based Distributions )
# list all the packages ( yay )
alias pkglist-yay='sudo pacman -Qm'
# list all the packages ( pacman )
alias pkglist-all='sudo pacman -Q'
# search for installed applications ---> provide application / package name
alias pkglist-installed='sudo pacman -Q | grep'
# search for applications ---> provide application / package name
alias pkgsearch='sudo pacman -Ss'
# installing applications ---> provide application / package name
alias install='sudo pacman -S'
# removing and purging applications ---> provide application / package name
alias remove='sudo pacman -R'
# update the whole system
alias update='sudo pacman -Syu'
# clean system packages
alias clean='sudo pacman -Rns $(pacman -Qdtq)'
# clean system logs
alias clean_plog='sudo truncate -s 0 /var/log/pacman.log'
# clean journalctl logs
alias clean_jlog='sudo journalctl --vacuum-size=0'

# System ( Debian / Debian Based Distributions )
# search for applications ---> provide application / package name
# alias pkgsearch='sudo apt search'
# installing applications ---> provide application / package name
# alias install='sudo apt-get install'
# removing and purging applications ---> provide application / package name
# alias remove='sudo apt-get remove'
# update the whole system
# alias update='sudo apt update; sudo apt upgrade -y'
# clean system packages
# alias clean='sudo apt autoremove -y; sudo apt autoclean'

# System - eza
alias ls='eza --no-user --no-time --no-permissions --icons=always'
alias ll='eza -la --no-user --no-time --no-permissions --icons=always'
alias tree='eza -T --icons=always'

# Applications
# opening up Neovim
alias nv='nvim'
# make opening Python like in Windows
alias python='python3'

# Tmux
alias t='tmux'

# Git
# LazyGit UI
alias lg="lazygit"
# clone repository ---> provide repository name
alias clone='git clone'
# alias for 'git status'
alias gs='git status'
# alias for 'git add' ---> provide files to add
alias ga='git add'
# alias for 'git commit' ---> provide the commit message
alias commit='git commit -m'
# alias for 'git push' ---> provide branch name
alias push='git push -u origin'
# alias for 'git log'
alias gl='git log'
# alias for 'git pull'
alias gp='git pull'
# Obsidian - GitHub repo
alias repo-azmaan='cd ~/GitHub/azmaan/'
alias repo-obsidian='cd ~/GitHub/obsidian/'
# GitHub repo - dotfiles
alias repo-dotfiles='cd ~/GitHub/dotfiles/'
alias cp_GO='cp -r S.Sunhaloo/ Question - Problems - Solutions/ ~/Obsidian/'
alias cp_OG='cp -r S.Sunhaloo ~/GitHub/obsidian/'

# System - cd / zoxide
# zoxide - smarter 'cd'
eval "$(zoxide init --cmd cd zsh)"

# 'fzf' fuzzy finder
source <(fzf --zsh)

# oh-my-posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ohmyposh.toml)"
