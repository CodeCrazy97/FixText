################################################################################################
# This shell script fixes the 2000 election results, as seen in the 2000.error.txt file.
# Essentially, the results for each state (popular votes and electoral votes) are on new lines.
################################################################################################
ERROR2000="C:\\Users\\A521646\\OneDrive - Valvoline\\Documents\\Projects\\Presidential Election\\2000error.txt"
FIXEDFILE="C:\\Users\\A521646\\OneDrive - Valvoline\\Documents\\Projects\\Presidential Election\\2000.txt"
rm "$FIXEDFILE"  # Clear out anything that was there from a previous run of the script.
touch "$FIXEDFILE"

state=""
while read p; do	
	echo $p | awk -v ORS="" '{ gsub(/./,"&\n") ; print }' | \
	while read char
	do
		if [[ "$char" == [A-Z] ]]; then  # The character is alphabetic. It is therefore part of a state name.
			state=${state}$char			
			if [[ ${#state} == 2 ]]; then  # We have got the entire state name if it's length is exactly 2 chars.
				echo "STATE: $state" 	
				cat "\r\n$state " >> $FIXEDFILE
			fi			
		else
			state=""
		fi 
	done
	echo $state
done <"$ERROR2000"
