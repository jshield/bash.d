add_card () 
{ 
    project_path="$HOME/docs/projects/$1";
    card_name=`cat $project_path/meta/card_next`;
    shift;
    cat >> "$project_path/cards/$card_name"  <<EOF
Description: $*
Created: `date +%s`
EOF
    ln -s ../cards/$card_name $project_path/todo/;
    echo $((card_name + 1)) > $project_path/meta/card_next
}
list_cards () 
{ 
    project_path="$HOME/docs/projects/$1/";
    if [[ -n $2 ]]; then
        fgrep "Description:" $project_path/$2/*;
    else
        fgrep "Description:" $project_path/cards/*;
    fi
}
