# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Auto-competion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:

# Couleurs
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
LIGHT_GREEN="\[\033[1;32m\]"
NO_COLOR="\[\033[0m\]"
LIGHT_GRAY="\[\033[0;37m\]"
WHITE="\[\033[1;37m\]"
BLUE="\[\033[0;34m\]"

# Caractères
Current_Directory="\w"
Utilisateur="\u"
Trait_1er="\342\224\214\342\224\200"
Trait_2eme="\342\224\224\342\224\200\342\224\200\342\225\274"
Arobase="@"
Hostname="\h"
Crochet_Ouv="["
Crochet_Ferm="]"
Trait_Union="\342\224\200"
Saut_Ligne="\n"

# Shell User
if [ "$UID" == 1000 ] ; then
	PS1="$WHITE$Trait_1er$Crochet_Ouv$YELLOW$Utilisateur$LIGHT_GRAY$Arobase$BLUE$Hostname$WHITE$Crochet_Ferm$Trait_Union$Crochet_Ouv $LIGHT_GREEN$Current_Directory $WHITE$Crochet_Ferm$Saut_Ligne$WHITE$Trait_2eme $RED"
fi

# Shell Root
if [ "$UID" == 0 ] ; then
	PS1="$WHITE$Trait_1er$Crochet_Ouv$RED$Utilisateur$WHITE$Crochet_Ferm$Trait_Union$Crochet_Ouv $LIGHT_GREEN$Current_Directory $WHITE$Crochet_Ferm$Saut_Ligne$WHITE$Trait_2eme $RED"
fi

# Alias Linux
[ -f $HOME/.aliases/linux ] && source $HOME/.aliases/linux
