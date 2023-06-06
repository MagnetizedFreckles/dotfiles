#!/usr/bin/env bash

top -bn1 | awk -vORS=' ' '/^%Cpu/{print "CPU: "100-$8"%"} /^MiB Mem :/{if ($4 == 0) print "RAM: N/A"; else print "RAM: "$8/($4+$8)*100"%"}'
