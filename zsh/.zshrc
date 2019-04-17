# If you come from bash you might have to change your $PATH.
#export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
# homebrew stores in /usr/local/cellar/<tool>
# 	links to above are stored in /usr/local/bin
# /Library/Python/3.6.{bin,lib} 
# 	because couldn't install PyQt in /usr/local with homebrew
# /usr/local/opt/coreutils/libexec/gnubin 
# 	home brew coreutils.  
# /usr/local/opt/python/libexec/bin
# 	pick up this version of python (python3)
# /usr/local/bin:
export PERL5LIB="$HOME/perl5/lib/perl5:$HOME/perl5/lib/AfLib:$HOME/perl5/lib/RkLib"

export PATH="$HOME/bin:$PATH"
# export PATH="/usr/local/lib/python3.6/site-packages:$HOME/Library/Python/3.6/{bin,lib}:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/Cellar/qt/5.11.0/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PYTHONPATH="$HOME/code/mylibraries/python/django-getrealty"
# export PATH="/usr/local/Cellar/qt/5.11.0/bin:$HOME/Library/Python/3.6/{bin,lib}:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/python/libexec/bin:/usr/local/bin:$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"     

# Enable go modules support
# https://developers.mattermost.com/contribute/server/dependencies/
export GO111MODULE=on

export WORKON_HOME=$HOME/.virtualenvs   # Optional
# export PROJECT_HOME=$HOME/projects      # Optional
source /usr/local/bin/virtualenvwrapper.sh

# get git of user@hostname in prompt 
DEFAULT_USER="jfrerich"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv dir vcs)
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107

# Set name of the theme to load. 
ZSH_THEME="powerlevel9k/powerlevel9k"

# enable command auto-correction.
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
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  history-substring-search
  zsh-autosuggestions
  colored-man-pages
  colorize
  dircycle
  zsh-dircolors-solarized
  dirhistory
  virtualenv
  virtualenvwrapper
)

case `uname` in 
  Darwin)
  ;;
  Linux)
    # needed for ssh-add when on ubuntu, using zsh
    # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent
    
    # add ssh-agent when on Ubuntu Linux 
    plugins+=(ssh-agent)
    
    # must be before source of oh-my-zsh
    zstyle :omz:plugins:ssh-agent identities id_rsa
esac

source $ZSH/oh-my-zsh.sh

# User configuration

setopt hist_ignore_dups
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


####################################
# My Personal Setup - from here to EOF
####################################
autoload -U zmv
bindkey -v

# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
# open command line in vim to do visual selection
#didn't_really_use bindkey -M vicmd "^V" edit-command-line
# only wait 10ms to change modes.  default is 40ms
export KEYTIMEOUT=1

alias gdt='git difftool'

alias c='clear'
alias ll='ls -ltr'
alias llh='ls -ltrh'
alias ltr='ls -ltr'
alias ltra='ls -ltra'
alias ds='pwd > ~/.sd'
alias sd='cd `cat ~/.sd`'

alias mm='cd $HOME/go/src/github.com/mattermost'
alias mms='cd $HOME/go/src/github.com/mattermost/mattermost-server'
alias mmw='cd $HOME/go/src/github.com/mattermost/mattermost-webapp'
alias mmsql='mysql --host=dockerhost --user=mmuser --password=mostest mattermost_test'
alias ngrok_mm='ngrok http 8065' 

alias python_vdebug='python -S ~/Downloads/Komodo-PythonRemoteDebugging-11.1.0-91033-macosx/py3_dbgp.py -d localhost:9000 '

alias x=exit

####################################
# from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
####################################
# ls, the common ones I use a lot shortened for rapid fire usage

alias ls='ls --color'     #always show --color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias -g G='| grep '

alias sortnr='sort -n -r'

case `uname` in 
  Darwin)
    alias top='htop'
    alias cat='pygmentize -g -O style=native'
    # mvim - updated to use brew version of macvim.  includes python3 support for
    # pythonmod plugin
    #alias g="mvim"
    alias m="mvim"
    alias vi="mvim -v "
    alias vim="mvim -v "

    # installed with brew install
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  ;;
  Linux)
    # installed with apt install
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
esac

# remap cd to cd && ls 
function cd {
  builtin cd "$@" && ls -F
}

# eval `dircolors $HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized/dircolors-solarized/dircolors.ansi-light`


# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
#bindkey -M viins ‘jk’ vi-cmd-mode

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
