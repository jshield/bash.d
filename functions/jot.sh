jot () 
{ 
    echo `date +%s` "|$1| ${*:2}" >>~/.jotfile
}
pjot () 
{ 
    cat ~/.jotfile | grep "|$1|"
}
sjot () 
{ 
    cat ~/.jotfile | grep $1
}
