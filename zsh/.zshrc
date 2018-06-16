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
export PATH="/usr/local/Cellar/qt/5.11.0/bin:$HOME/Library/Python/3.6/{bin,lib}:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/python/libexec/bin:/usr/local/bin:$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/j_honky/.oh-my-zsh

export TERM="xterm-256color"     

# get git of user@hostname in prompt 
DEFAULT_USER="j_honky"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gallois"
#ZSH_THEME="superjarin"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

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
  git-flow
  history-substring-search
  zsh-autosuggestions
  colored-man-pages
  colorize
  dircycle
  zsh-dircolors-solarized
  dirhistory
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

bindkey -v

# http://stratus3d.com/blog/2017/10/26/better-vi-mode-in-zshell/
# open command line in vim to do visual selection
#didn't_really_use bindkey -M vicmd "^V" edit-command-line
# only wait 10ms to change modes.  default is 40ms
export KEYTIMEOUT=1

alias c='clear'
alias ll='ls -ltr'
alias llh='ls -ltrh'
alias ltr='ls -ltr'
alias ltra='ls -ltra'
alias ds='pwd > ~/.sd'
alias sd='cd `cat ~/.sd`'

# mvim - updated to use brew version of macvim.  includes python3 support for
# pythonmod plugin
#alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
#alias mvim='/usr/local/Cellar/macvim/8.0-146_1/bin/mvim'
#alias g="mvim"
alias m="mvim"

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

alias sortnr='sort -n -r'
alias top='htop'
alias cat='ccat'

# remap cd to cd && ls 
function cd {
  builtin cd "$@" && ls -F
}

eval `dircolors $HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized/dircolors-solarized/dircolors.ansi-light`

# installed with brew install
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
#bindkey -M viins ‘jk’ vi-cmd-mode

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

