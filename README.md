# <a href="https://github.com/jfrerich/dotfiles">jfrerich/dotfiles</a>

I decided to create this repo to backup my dotfiles, but also to share what I
use. Sharing my dotfiles is important to me as it is a way to give back to the
community. I was inspired by a few repos on GitHub and it helped me tremendously
in my quest to fine-tune my setup. I use Linux, more specifically openSUSE, so
be aware that I haven't used my dotfiles on another OS or Linux distribution.

### Explanations

I use GNU Stow to manage my dotfiles as it is simple to use and keeps my home
directory clean without any git files. To understand how to use GNU Stow, I
recommend you to read the link *Using GNU Stow to manage your dotfiles* from the
**Credits** section below.

### DOTFILES 

http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

1. create dotfiles project on github.com
    - https://services.github.com/on-demand/github-cli/create-remote-repository
    - select initialize repo with a README
2. clone repo from $HOME
    - ```git clone https://github.com/jfrerich/dotfiles.git```
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
  
VIM Dotfiles

.gitignore .vim/bundle and .vim/view 
only setup the .vimrc and my plugins 
PluginList to see plugins listed in .vimrc
PluginInstall to install plugins

Install stow on mac
brew install stow




### Quick Install

Go to your home directory

`cd`

Clone the repo

`git clone http://github.com/dmarcoux/dotfiles`

Go to the dotfiles directory

`cd dotfiles`

Install *xyz* in $HOME (for example, vim)

`stow vim`

Uninstall *xyz* from $HOME (for example, vim)

`stow -D vim`

Install *abc* in a specific directory (for example, *etc* in the directory `/`)

`sudo stow -t / etc`

Uninstall *abc* from a specific directory (for example, *etc* from the directory
`/`)

`sudo stow -D etc -t /`

### Credits

Bits and chunks of my config files come from these sources. Thanks to the people
behind them!
- http://github.com/dmarcoux/dotfiles
- [Using GNU Stow to manage your
  dotfiles](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- [zsh](https://github.com/xero/dotfiles) and [GNU Stow
  usage](https://github.com/xero/dotfiles/issues/6)
- [Solarized theme for
  termite](https://github.com/alpha-omega/termite-colors-solarized)
- [set_xrandr_both.sh](https://github.com/j-san/i3-config/blob/master/configure-xrandr.sh)
- [.Xresources](https://www.reddit.com/r/archlinux/comments/40w3ld/why_is_font_rendering_so_crap_by_default/cyxlida)



