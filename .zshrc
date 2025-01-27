# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH_TMUX_AUTOSTART=true

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  macos
  tmux
  docker-compose
  docker
  aws
  fzf
  web-search
)

source $ZSH/oh-my-zsh.sh
export GOPATH=$HOME/go

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias reddit="source $HOME/.VirtualEnv/rtv/bin/activate; rtv; deactivate"
alias hangups="source $HOME/.VirtualEnv/handups/bin/activate; hangups; deactivate"

alias top="htop"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pull="git pull --rebase"
alias vim="stty stop '' -ixoff; vim"
alias generate-tags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./.ctags ./"

alias mkdit="echo \"I guess you meant $(tput setaf 2)mkdir$(tput sgr 0). Creating...\"; mkdir "
alias weather="curl http://wttr.in/New_York?m"
alias docker-restart="docker-compose stop && docker-compose rm -f && docker-compose build --no-cache && docker-compose up"
# alias edit="git st | grep 'modified:' | awk '{ print $2}' | xargs -o vim"
alias vim="stty stop '' -ixoff; vim"
alias gohelp="echo \"Listening on http://localhost:6060/\"; godoc -http=\":6060\""
alias vimwiki="vim -p -N -n -u \"$HOME/vimwiki-config/vimrc\" --cmd 'set rtp^=~/vimwiki-config/'"
alias cat='bat'

alias archupgrade='sudo pacman -Syu'
alias aurbuild='makepkg -Acs'
alias aurinstall='sudo pacman -U '

alias find-gpu='ps aux | grep gpu-process | grep'
alias wiki='tmux attach -t wiki || tmux new -s wiki'
alias work='tmux attach -t Work || cd ~/dd/dogweb && tmux new -s Work \; split-window -h \; split-window -v \; select-pane -t 1 \; attach'

function kill-gpu() {
   find-gpu $1 | egrep -o -e "[0-9]+" | head -n 1 | xargs -p kill
}

alias pg_start="launchctl load /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist"


#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%D %T % %{$reset_color%}'
edit() {
    vim $(git st | grep 'modified:' | awk '{ print $2}' | xargs)
}

# Cleanup docker images and containers
dcleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# STOP ALL DOCKER CONTAINERS
dstop(){
    docker ps -q | awk '{ print $1 }' | xargs docker stop
}

alias home-vpn="nmcli connection up ny-home --ask"

cleanuppython(){
    find . -name '*.pyc' -delete
}

cleanuppythonroot(){
    find . -name '*.pyc' | xargs sudo rm
}

aur() {
    echo "Installing $1 package from aur"
    git clone https://aur.archlinux.org/$1.git /tmp/$1
    cd /tmp/$1
    aurbuild
    packages=$(ls | grep 'tar.xz')
    for package in $packages; do
        aurinstall $package
    done
    cd -
}

oath() {
    ykman oath code "$(ykman oath list | fzf)"
}
oathaws() {
    ykman oath code "$(ykman oath list | grep 'ivan@ltv-prod')" | awk '{print $NF}' | xclip -sel clip
}

prod() {
    # prod switches to a default branch and updates it with recent changes
    # Default branch is usually one of prod, main, master etc
    defaultBranch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
    git checkout $defaultBranch
    git pull --rebase
}

push(){
    # Pushes the current branch
    git push origin HEAD
}

# `refresh cmd` executes clears the terminal and prints
# the output of `cmd` in it.
function refresh {
  tput clear || exit 2; # Clear screen. Almost same as echo -en '\033[2J';
  bash -ic "$@";
}

# Like watch, but with color
function cwatch {
   while true; do
     CMD="$@";
     # Cache output to prevent flicker. Assigning to variable
     # also removes trailing newline.
     output=`refresh "$CMD"`;
     # Exit if ^C was pressed while command was executing or there was an error.
     exitcode=$?; [ $exitcode -ne 0 ] && exit $exitcode
     printf '%s' "$output";  # Almost the same as echo $output
     sleep 1;
   done;
}

# Record Screen
# ffmpeg -video_size 3200x1800 -framerate 25 -f x11grab -i :0.0+0,0 output2.mp4
# ffmpeg -video_size 4608x2592 -framerate 25 -f x11grab -i :0.0+3200,0 output2.mp4

# Do not BEEP at me!
setopt NO_BEEP

# Add homebrew binaries to the path.
export PATH="/usr/local/bin:${PATH?}"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

#export TERM=tmux-256color
export TERM=xterm-256color

# For vim - when venv is active - use venv's python interpreter.
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Load SSH keys from the keychain if keychain is empty.
ssh-add -l > /dev/null || ssh-add --apple-load-keychain 2> /dev/null

HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt hist_ignore_space

source ~/.work.sh
