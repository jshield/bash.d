parse_timesheet () 
{ 
    sed -r 's/:[0-9]{2},/,/g' $1
}
