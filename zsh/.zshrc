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
export GO111MODULE=on   # this really screwed up my developement area!  use
# go dep for now

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
  k
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
  you-should-use
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
source $HOME/.private.zsh
source $HOME/mattermost.zsh


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
alias go='richgo'
alias g='hub'

alias python_vdebug='python -S ~/Downloads/Komodo-PythonRemoteDebugging-11.1.0-91033-macosx/py3_dbgp.py -d localhost:9000 '

alias x=exit

####################################
# from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
####################################
# ls, the common ones I use a lot shortened for rapid fire usage
# alias bat='bat -p'

# alias ls='ls --color'     #always show --color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias ltr='exa -l --icons -s=modified'
alias ltra='exa -l --icons --all -s=modified'
alias l='ltr'
alias la='exa -la --icons -s=modified'
alias ls='exa'

alias grep='grep --color'

alias dud='du -d 1 -h'
alias duf='du -sh *'
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'

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

eval `dircolors $HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized/dircolors-solarized/dircolors.ansi-light`


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
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/node@10/bin:$PATH"

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
# open with vim
vfif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  m $(rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
}

# fd - cd to selected directory
# use cd **<tab>

# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}


# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}


# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fco_preview() {
  local tags branches target
  tags=$(
git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
git branch --all | grep -v HEAD |
sed "s/.* //" | sed "s#remotes/[^/]*/##" |
sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
(echo "$tags"; echo "$branches") |
    fzf --no-hscroll --no-multi --delimiter="\t" -n 2 \
        --ansi --preview="git log -200 --pretty=format:%s $(echo {+2..} |  sed 's/$/../' )" ) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc_preview - checkout git commit with previews
alias fcocp=fcoc_preview
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

gotest() {
    go test -v -run="$1" . 
}

### BREW + FZF
# update multiple packages at once
# mnemonic [B]rew [U]pdate [P]lugin
bip() {
  local inst=$(brew search | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:install]'")

  if [[ $inst ]]; then
    for prog in $(echo $inst)
    do brew install $prog
    done
  fi
}

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

# mattermost make test uses the $GO var to run go. Use richgo for better output
export GO=/usr/local/bin/richgo
