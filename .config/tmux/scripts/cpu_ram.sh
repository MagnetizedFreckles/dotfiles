#!/usr/bin/env bash

# A command which output is displayed in the statusbar of tmux

top -bn1 | awk -v ORS=' ' '/^%Cpu/ {
    printf "CPU: %.0f%% ", 100 - $8
}
/^MiB Mem :/ {
    if ($4 == 0)
        printf "RAM: N/A"
    else
        printf "RAM: %.0f%%", ($8 / ($4 + $8)) * 100
}'
