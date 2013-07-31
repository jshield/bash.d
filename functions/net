# showip - show the current IP address if connected to the internet.
# Usage: showip.
#
showip ()
{
wget -q -O - checkip.dyndns.org | sed -e 's/[^[:digit:]|.]//g'
}
