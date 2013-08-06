if test $CONTEXT != "2cc"; then return 0; fi

alias setup_work_layout='xrandr --output HDMI-0;xrandr --output HDMI-0 --left-of LVDS;synergyc 10.0.0.55'
alias standup_begin='__toggl_start "Standup and Settling Down"'
