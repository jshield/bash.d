# clock - a little clock that appeares in the terminal window.
# Usage: clock.
#
clock ()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}
tolower () { echo $@ | tr '[A-Z]' '[a-z]'; }
renlow () { if test -n $1; then mv $1 `tolower $1`; fi }
