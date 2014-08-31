function eba() { $EDITOR ~/.bash.d/aliases/$1.sh; } 
function ebf() { $EDITOR ~/.bash.d/functions/$1.sh; }
function ebc() { 
	local context=${1:-$CONTEXT}
	$EDITOR ~/.bash.d/contexts/$context.sh; 
}
function ebh() { 
	local host=${1:-$HOSTNAME}
	$EDITOR ~/.bash.d/contexts/$host.sh;
 }
function ebm() { $EDITOR ~/.bash.d/main.sh; } 

alias relsh="source ~/.bashrc"

#generic functions
palias () { 
	if [[ -z $1 ]]; then return 0; fi
	local file="misc";
	if [[ -n $2 ]]; then file=$2; fi
	echo `alias -p | grep " $1="` >> ~/.bash.d/aliases/$file.sh; 
}

pfunction () {
	if [[ -z $1 ]]; then return 0; fi
	local file="misc";
	if [[ -n $2 ]]; then file=$2; fi
	declare -f $1 >> ~/.bash.d/functions/$file.sh;
}
