#!/usr/bin/env bash

# A command which output is displayed in the statusbar of tmux

top -bn1 | awk -vORS=' ' '/^%Cpu/{print "CPU: "100-$8"%"} /^MiB Mem :/{if ($4 == 0) print "RAM: N/A"; else print "RAM: "$8/($4+$8)*100"%"}'
