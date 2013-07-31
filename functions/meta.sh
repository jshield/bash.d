function eba() {	
$EDITOR ~/.bash.d/aliases/$1.sh
}

function ebf() {
$EDITOR ~/.bash.d/functions/$1.sh
}

function ebm() { $EDITOR ~/.bash.d/main.sh; }
alias relsh="source ~/.bashrc"

#generic functions
palias () { 
alias "$1"="$2"; 
if [[ -n $3 ]]; 
	then echo "alias $1='$2'" >> ~/.bash.d/aliases/$3.sh;
	else echo "alias $1='$2'" >> ~/.bash.d/aliases/misc.sh;
fi
}