# <a href="https://github.com/jfrerich/dotfiles">jfrerich/dotfiles</a>

I decided to create this repo to backup my dotfiles, but also to share what I
use. Sharing my dotfiles is important to me as it is a way to give back to the
community. I was inspired by a few repos on GitHub and it helped me tremendously
in my quest to fine-tune my setup. I use Linux, more specifically openSUSE, so
be aware that I haven't used my dotfiles on another OS or Linux distribution.

I use this repo to store my dotfiles and explain how to setup the files on my computer.

### Explanations

By adding all my dotfiles in a git repo and cloning to a local ~/dotfiles directory
I'm able to consolidate accomplish a few things.

1. All dotfiles are in one directory
1. The git repo doesn't exist in my home directory
1. All files are version controlled

GNU Stow is used to link the files in ~/dotfiles to the $HOME directory. Because the 
symlinks exist in $HOME, they are sourced as normal by tools such as vim, zsh, .etc

To understand how to use GNU Stow, I recommend you to read the link *Using GNU Stow 
to manage your dotfiles* from the **Credits** section below.

### DOTFILES 

1. create dotfiles project on github.com
    - https://services.github.com/on-demand/github-cli/create-remote-repository
    - select initialize repo with a README
2. clone repo from $HOME
    - `cd`
    - ``git clone https://github.com/jfrerich/dotfiles.git``
3. Add dot files to dotfiles/ dir
    - ```mv ~/.vimrc to dotfiles/vim/.vimrc```
4. git add, commit and push
    - ```git add .zshrc```
    - ```git commit .zshrc```
    - ```git push``` 
5. stow files to create symlinks from $HOME
    - ```stow vim```
    - ```stow tcsh```
    - ```stow zsh```
  
### VIM Dotfiles .gitignore setup

- Only setup the .vimrc and my plugins 
- .gitignore includes .vim/bundle and .vim/view 
- .vim/bundle uses git to build the bundles, so I ignore these and let PluginInstall do the install
- .vim/view also does not need to be managed

### Install stow on mac
`brew install stow`
## Credits

Bits and chunks of my config files come from these sources. Thanks to the people
behind them!
- http://github.com/dmarcoux/dotfiles
- [Using GNU Stow to manage your
  dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- [zsh](https://github.com/xero/dotfiles) and [GNU Stow
  usage](https://github.com/xero/dotfiles/issues/6)



