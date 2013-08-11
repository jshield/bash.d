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

if [ -f "/etc/resolv.conf" ]; then
DOMAINNAME=$(cat /etc/resolv.conf | grep domain | awk '{ print $2 }'); 
else DOMAINNAME=`hostname -d`; fi
if [ -n $USERDNSDOMAIN ] && [ -z $DOMAINNAME ]; then 
DOMAINNAME=$(echo $USERDNSDOMAIN | tr '[A-Z]' '[a-z]'); fi

case $DOMAINNAME in
  '2cc.local') CONTEXT='2cc'; ;; 
  'psm.local') CONTEXT='home'; ;; 
  *) CONTEXT='unknown'; ;;
esac

if [ -f ~/.bash.d/contexts/$CONTEXT.sh ]; then source ~/.bash.d/contexts/$CONTEXT.sh; fi

if [ "`id -u`" -eq 0 ]; then _COLOR=$ROOT_COLOR; else _COLOR=$USER_COLOR; fi
_COLOR="\e[1;${_COLOR}m\]"

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

PS1="\u on \H at ${CONTEXT} in \w\r\n# "

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

