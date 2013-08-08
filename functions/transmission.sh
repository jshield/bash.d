if [ $CONTEXT != "home" ]; then return 0; fi
function tc() { transmission-remote $TRANSHOST "$@"
}

function tl() { tc -l 
}

__addtorrent () 
{ 
    if test -z $1; then
        return 1;
    fi;
    if test -z $2; then
        return 2;
    fi;
    tc -w "$2" -a "$1"
}

__addvideotorrent () 
{ 
    if test -z $1; then
        return 1;
    fi;
    if test -z $2; then
        return 2;
    fi;
    __addtorrent "$1" "/srv/internal/videos/$2"
}

__transmission_mkdir () 
{ 
    local BASEPATH="/srv/internal/";
    local NEWPATH="$BASEPATH/$1";
    if test -d $NEWPATH; then
        echo "Aborting as directory already exists";
        return 1;
    fi;
    mkdir -p -p $NEWPATH;
    chown transmission -R $NEWPATH
}
