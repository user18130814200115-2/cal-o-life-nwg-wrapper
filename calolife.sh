#!/bin/sh
# yyyy-mm-dd
birthday="1970-01-01"
# 80.5 years in weeks
maxweeks="4186"

# Calculate how much time you have spent and how much you have left
weekspassed="$((($(date +%s) - $(date +%s --date=$birthday))/604800))"

grid() {
    # Loop over all weeks
    for i in $(seq $maxweeks); do
	if [ $weekspassed -gt 0 ]; then
	    # Print a ceckbox for each passed week
	    printf "☑ "
	else
	    # Or an empty box for every week left
	    printf "☐ "
	fi
	# Decrease the weekspassed for the if statement above
	weekspassed=$(($weekspassed-1))
	# Start a new line after every 91st box
	[ $(($i%91)) -eq 0 ] && printf "\n"
    done
}

grid
