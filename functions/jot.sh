jot () 
{ 
    echo `date -Iseconds` "|$1| ${*:2}" >>~/.jotfile
}
