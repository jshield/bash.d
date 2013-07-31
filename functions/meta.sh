function eba() {
$EDITOR ~/.bash.d/aliases/$1.sh
}

function ebf() {
$EDITOR ~/.bash.d/functions/$1.sh
}

alias ebp="$EDITOR ~/.bash.d/main"
alias relsh="source ~/.bashrc"

#generic functions
palias () { 
alias "$1"="$2"; 
if [[ -v $3 ]]; 
	then echo "alias $1='$2'" >> ~/.bash.d/aliases/$3.sh;
	else echo "alias $1='$2'" >> ~/.bash.d/aliases/misc.sh;
fi
}