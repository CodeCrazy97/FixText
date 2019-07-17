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
			if [[ ${#state} == 0 ]]; then   # This is the first character in the state name. Therefore, place the state on a new line.
				echo "" >> $FIXEDFILE
			fi
			
			state=${state}$char			
			if [[ ${#state} == 2 ]]; then  # We have got the entire state name if it's length is exactly 2 chars.
				printf "%s" "${state:0:2} " >> $FIXEDFILE  # Send the state name to the file. Trim the last character (a '\n')								
			fi
		else
			state=""  # Reset state name for next state.							
			if [[ "$char" != [#] ]]; then
				printf "%s" "$char" >> $FIXEDFILE
			else 
				printf " " >> $FIXEDFILE
			fi			
		fi 
	done
	echo $state
done <"$ERROR2000"
