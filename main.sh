#
# ~/.bashrc
#


# ----------------------------------------------------------------------
# ENVIRONMENT VARS
# ----------------------------------------------------------------------

PATH=$PATH:/opt/git-tf/
EDITOR='vim'
TRANSHOST='xerxen.psm.local'

# ----------------------------------------------------------------------
# CONTEXT SETUP
# ----------------------------------------------------------------------

if [ $OSTYPE == 'linux-gnu' ]; then
DOMAINNAME=$(cat /etc/resolv.conf | grep domain | awk '{ print $2 }');
if [ -z $DOMAINNAME ]; then DOMAINNAME=`hostname -d`; fi
else
if [ -n $USERDNSDOMAIN ]; then DOMAINNAME=$(echo $USERDNSDOMAIN | tr '[A-Z]' '[a-z]'); fi
fi

case $DOMAINNAME in
  '2cc.local') CONTEXT='2CC'; _ROOT_COLOR=33; _USER_COLOR=36; ;;
  'psm.local') CONTEXT='HOME'; _ROOT_COLOR=31; _USER_COLOR=34; ;;
  *) CONTEXT='NONE'; _ROOT_COLOR=30; _USER_COLOR=35; ;;
esac

if [ "`id -u`" -eq 0 ]; then _COLOR=$_ROOT_COLOR; else _COLOR=$_USER_COLOR; fi

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

[ $TERM == linux ] && PS1="\033[0;32m\]\u \[\033[0;${_COLOR}m\]\w\033[0;0m\] >"
[ $TERM != "linux" ] && PS1="\[\e]2;\u@\H \w\a\e[$_COLOR;1m\]>\[\e[0m\] "

# ----------------------------------------------------------------------
# MISCELLANEOUS
# ----------------------------------------------------------------------

# If exists, add ~/bin to $PATH.
#
if [ -d ~/bin ] ; then
   PATH=~/bin:$PATH
fi

# ----------------------------------------------------------------------
# BASH FUNCTIONS
# ----------------------------------------------------------------------

if [ -d ~/.bash.d/functions ] ; then
   for f in ~/.bash.d/functions/*; do
    source $f
   done
fi

# ----------------------------------------------------------------------
# ALIAS DEFINITIONS
# ----------------------------------------------------------------------

if [ -d ~/.bash.d/aliases ] ; then
   for a in ~/.bash.d/aliases/*; do
    source $a
   done
fi

# For bash sudo completion.
#
complete -cf sudo
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

