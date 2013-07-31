if [ $CONTEXT != "home" ]; then return 0; fi
function tc() { transmission-remote $TRANSHOST "$@"
}

function tl() { tc -l 
}