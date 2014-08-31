fpost () 
{ 
    fbcmd post "$*"
}
fmeme () 
{ 
    [ $# -le 2 ] && { 
        echo "Usage: $FUNCNAME memeimg top bottom [comment]";
        return 1
    };
    fbcmd addpic `memegen "$1" "$2" "$3"` latest "$4"
}
