#!/usr/bin/env bash

# Colors (for reference):
# 0. DeepPink
# 1. DodgerBlue
# 2. Coral
# 3. PaleVioletRed
# 4. MediumAquamarine
# 5. LightPink
# 6. LightGreen
# 7. SandyBrown
# 8. PaleTurquoise
# 9. MediumSlateBlue
# a. Aqua
# b. OrangeRed
# c. LightSkyBlue
# d. Crimson
# e. Tomato

# TODO: For optimization, I should make so this somehow sets constant environment variable
# and just rechecks it on subsequent runs.
# But the script isn't that resource-intensive so whatever

# TODO: Redo the colors

# Sorta alias
color() {
    export TMUX_SESSION_COLOR="$1"
}

# Hash the hostname and take the first character
char=$(echo -n "$HOSTNAME" | md5sum | awk '{print $1}' | head -c1)

# Check which one of the 16 colors it will be
case $char in
0) color "DeepPink" ;;
1) color "DodgerBlue" ;;
2) color "Coral" ;;
3) color "PaleVioletRed" ;;
4) color "MediumAquamarine" ;;
5) color "LightPink" ;;
6) color "LightGreen" ;;
7) color "SandyBrown" ;;
8) color "PaleTurquoise" ;;
9) color "MediumSlateBlue" ;;
a) color "Aqua" ;;
b) color "OrangeRed" ;;
c) color "LightSkyBlue" ;;
d) color "Crimson" ;;
e) color "Tomato" ;;
f) color "Tomato" ;;
*)
    echo "Something is broken!"
    ;;
esac

echo "$TMUX_SESSION_COLOR"
