#!/bin/tcsh -f


source ~/perl5/perlbrew/etc/cshrc

if ( -f ~/.aliases ) then 
	source ~/.aliases
endif

# Use vi keys - 'bindkey' will all bind keys.
bindkey -v

#set ambiguous
#set autolist
#set nobeep
#set filec

# if log on to a solaris, set the display to home (denali:0.0)
#if ($OSTYPE =~ solaris) then
#    # never log out
#    set autologout=0 
#    setenv DISPLAY denali:0.0
#endif

##############################
# tcsh stuff
##############################
if ( $?tcsh ) then
#    if ( $?IN_IN ) then
	#set prompt="[%t] %m[%B$group-$PROJECT-$shlvl%b]:%S(%~)%s%# "
#	set prompt="[%t] %m[%B$group-$PROJECT%b]:(%B%{\033[43m%}%~%{\033[0m%}%b)%# "
#    else 
	#set prompt="[%t] %m[%B$group-$shlvl%b]:%S(%~)%s%# "
#jaf	set prompt="[%t] %m[%B$group%b]:(%B%{\033[43m%}%~%{\033[0m%}%b)%# "
#    endif
endif

#setenv LS_COLORS "eval `dircolors .dir_colors`"
#eval `dircolors .dir_colors`
#eval `.dir_colors`


# need to add git.  it is located at /usr/local
#/usr/local/bin/git
#/usr/bin/git --version
#git version 1.9.3 (Apple Git-50)
#/usr/local/git/bin/git --version
#git version 1.9.2

# install area from CPAN
# might need to move this to something that matches perl version.  5.8.9 is old.
#setenv EDITOR ~/Downloads/MacVim-snapshot-72/mvim

# Should probably update this to later version of perl
setenv PERL5LIB $HOME/perl5/lib/perl5:$HOME/perl5/lib/AfLib:$HOME/perl5/lib/RkLib



set path = ( /usr/local/bin $path ) 

# Converts a \n separated list into a colon separated list
# colonise() {
#         /bin/cat $1 | /usr/bin/tr "\012" ":"
# }

# set path = ( $HOME/bin/Realty /usr/local/git/bin $path ) 
# Add my bin to $PATH

# $BIN_TYPE set with (set BIN_TYPE = dev) or (set BIN_TYPE = rel)
#   Also set the color of on the prompt
# BIN_TYPE set by goproj alias
if ( $?BIN_TYPE) then
    if ($BIN_TYPE == "rel") then 
	set rel_color = 42
    else if ($BIN_TYPE == "dev") then  
	set rel_color = 43
    else 
	echo ".cshrc don't understand BIN_TYPE = $BIN_TYPE"
    endif
else
    # new terminal. always initialize to release
    set BIN_TYPE = rel
    set rel_color = 42
endif 

# set path to dev or rel
echo ".cshrc Setting Path : $BIN_TYPE Branch"

# /opt/local/bin - for macports
#set path = ( $HOME/myscripts/$BIN_TYPE/bin/Realty /opt/local/bin /usr/local/git/bin $path ) 

#set prompt="[%t]%n@%m[%B$group-%{\033[${rel_color}m%}${BIN_TYPE}%b]:(%B%{\033[43m%}%~%{\033[0m%}%b)%# "
set prompt="[%t][%B%n-%{\033[${rel_color}m%}${BIN_TYPE}%b]:(%B%{\033[43m%}%~%{\033[0m%}%b)%# "


#set PERL5LIB = (/opt/local/lib/perl5/5.8.9/darwin-2level:/opt/local/lib/perl5/site_perl/5.8.9:/opt/local/lib/perl5/site_perl/5.8.9:$PERL5LIB)
#set path = ( /usr/local/git/bin ~/bin/RealEstate /opt/local/bin /opt/local/lib/perl5/site_perl/5.8.9/ /opt/local/lib/perl5/vendor_perl/5.8.9/darwin-2level/tk $path ) 
#set path = ( /opt/local/bin /opt/local/lib/perl5/vendor_perl/5.8.9/darwin-2level/ /opt/local/lib/perl5/vendor_perl/5.8.9/darwin-2level/tk $path ) 
#set path = ($HOME/Perl/bin $path)
#set path = (/opt/local/bin /export/home/jason/bin $path)

# If not using a login in shell, need to set this.  Otherwise 
# intrinsity.login will set.
umask 002

#xhost +
#stty erase 

limit coredumpsize 4
