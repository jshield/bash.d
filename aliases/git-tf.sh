#git aliases
alias cb='git checkout'
alias nb='git branch'
alias nbc='cb -b'
alias cmaster='cb master'
alias checkin='git tf checkin --deep'
alias db='git branch -d'
alias cub='git rev-parse --abbrev-ref HEAD'
#git functions
up() { gmaster; git tf pull; }

#tfs functions
TFS_COLLECTION='tccperaapp1\2CC'

workitem () { tfpt workitem //collection:"$TFS_COLLECTION" $@;}
details () { workitem $(cub);}
mark_dev_ready () { workitem //fields:'State=Ready For Developer Testing' //update $(cub);}
new_bug () { workitem //new "Inspect\Bug" //fields:"Title=$1;";}
