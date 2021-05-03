export APPLE_ID=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:AccountID" ~/Library/Preferences/MobileMeAccounts.plist)
export APPLE_FIRST_NAME=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:firstName" ~/Library/Preferences/MobileMeAccounts.plist)
export APPLE_LAST_NAME=$(/usr/libexec/PlistBuddy -c "print :Accounts:0:lastName" ~/Library/Preferences/MobileMeAccounts.plist)

# Docker-machine activation and env setup
if [[ $(docker-machine status default) != Running ]]; then
	docker-machine start default
fi
eval $(docker-machine env default)


# GPG
export GPG_TTY=$(tty)

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

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Basic Commands
alias lsa='ls -al'

# Directories
alias cdc="cd ~/code"

# SSH
export LOCAL_SSH_AUTH_SOCK=$SSH_AUTH_SOCK
alias lssh="export SSH_AUTH_SOCK=$LOCAL_SSH_AUTH_SOCK"

# Docker Machine
alias dm="docker-machine"
alias dmenv='eval $(docker-machine env); echo DOCKER_TLS_VERIFY = $DOCKER_TLS_VERIFY; echo DOCKER_HOST = $DOCKER_HOST; echo DOCKER_CERT_PATH = $DOCKER_CERT_PATH; echo DOCKER_MACHINE_NAME = $DOCKER_MACHINE_NAME'
alias dmls="docker-machine ls"
alias dmup="docker-machine start"
alias dmdn="docker-machine stop"

# Trezor
export TREZORCTL=~/code/trezor-firmware/.venv/bin/trezorctl
alias tz=$TREZORCTL
alias tzclear="$TREZORCTL clear-session"
alias tzs="$TREZORCTL set"
alias tzd="$TREZORCTL device"
alias tzsd="$TREZORCTL device sd-protect"
alias tzgf="$TREZORCTL get-features"

# Trezor Agent (SSH/GPG Tools)
alias tza='trezor-agent'
tssh () {
	echo "\nTrezor SSH socket setup initiated"
    echo "Enter SSH identity (<user>@<domain>): "
    read id
    if [ -z "$id" ]; then
    	echo "No identity provided"
    	echo "\nUsing APPLE_ID of current user as SSH identity ($APPLE_ID)"
		id="$APPLE_ID"
	fi
	echo "\nRemember to unlock your trezor and watch for on-screen prompts"
    eval "eval $(trezor-agent -d $id)"
}

config_tgpg () {
	if [ ! -d "~/.gnupg/trezor" ]; then
		rm -r ~/.gnupg/trezor
	fi
	echo "\nTrezor GPG setup initiated"
    echo "Enter GPG identity (First Last <email>): "
    read id
    if [ -z "$id" ]; then
		id="$APPLE_FIRST_NAME $APPLE_LAST_NAME <$APPLE_ID>"
    	echo "No identity provided"
    	echo "\nUsing APPLE_ID of current user as GPG identity:"
    	echo $id
	fi
	echo "\nRemember to unlock your trezor and watch for on-screen prompts\n"
    eval "eval $(trezor-gpg init $id)"
    export GNUPGHOME=~/.gnupg/trezor
}

alias tgpg="export GNUPGHOME=~/.gnupg/trezor; gpg"

# Yubikey
alias yk='ykman'
alias ykp='yubico-piv-tool'


