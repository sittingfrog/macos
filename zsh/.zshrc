export APPLE_ID=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" ~/Library/Preferences/MobileMeAccounts.plist)
export APPLE_FIRST_NAME=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:firstName" ~/Library/Preferences/MobileMeAccounts.plist)
export APPLE_LAST_NAME=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:lastName" ~/Library/Preferences/MobileMeAccounts.plist)

# GPG
export GPG_TTY=$(tty)

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fox"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
	git
	docker
	docker-compose
)

source $ZSH/oh-my-zsh.sh


# Basic Commands
alias ls='ls -al'

# Directories
alias src="cd ~/src"
alias scratch="cd ~/tmp"

# Shadowenv
eval "$(shadowenv init zsh)"

# ZSH custom plugins
source ~/src/macos/zsh/docker-machine
source ~/src/macos/zsh/github
source ~/src/macos/zsh/trezor
source ~/src/macos/zsh/yubikey

# SSH
export LOCAL_SSH_AUTH_SOCK=$SSH_AUTH_SOCK
alias lssh="export SSH_AUTH_SOCK=$LOCAL_SSH_AUTH_SOCK"
export SSH_AUTH_SOCK=$YUBIKEY_SSH_AUTH_SOCK # Set yubikey as default ssh agent

# Docker-machine activation and env setup
#if [[ $(docker-machine status default) != Running ]]; then
#	docker-machine start default
#fi
#eval $(docker-machine env default)
