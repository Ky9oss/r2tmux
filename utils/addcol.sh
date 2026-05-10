#!/bin/bash
#
# Description: Add column numbers to stdout
# Usage: <command> | addcol
# Link: sudo ln -s $PWD/addcol.sh /usr/local/bin/addcol
#
# By Ky9oss

# cols=$(tput cols)

# which awk
# if [[ -n $? ]]; then
# AWK not found
if [ -t 0 ]; then
    echo "Usage: <command> | addcol"
else
while read -r line; do
    printf "        10        20        30        40        50        60        70        80        90        100       110        \n"
    printf "123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789\n"
    printf "%s\n\n" "$line"
done
fi
# else
# TODO: implemented by gawk
#     while read -r line; do
#         echo ""
#     done
# fi
