################################################################################################
# This shell script fixes the 2000 election results, as seen in the 2000.error.txt file.
# Essentially, the results for each state (popular votes and electoral votes) are on new lines.
################################################################################################

ERROR2000="C:\\Users\\A521646\\OneDrive - Valvoline\\Documents\\Projects\\Presidential Election\\2000error.txt"
FIXEDFILE="C:\\Users\\A521646\\OneDrive - Valvoline\\Documents\\Projects\\Presidential Election\\2000.txt"  # The fixed file holds the state name and election results on one line per state.
rm "$FIXEDFILE"  		# Clear out anything that was there from a previous run of the script.
touch "$FIXEDFILE"		# Create the fixed file.

state=""				# Will hold the name of a state. Example: NM for New Mexico.
while read p; do	
	for i in $(seq 1 ${#p})	# Iterate over every character in the string.
	do
		char=${p:i-1:1}
		if [[ "$char" == [A-Z] ]]; then  	# The character is alphabetic. It is therefore part of a state name.
			if [[ ${#state} == 0 ]]; then   # If there are no characters in the state name variable yet, then insert a new line in the fixed file.
				echo "" >> $FIXEDFILE
			fi
			
			state=${state}$char			
			if [[ ${#state} == 2 ]]; then  	# We have got the entire state name if it's length is exactly 2 chars.
				printf "%s" "${state:0:2} " >> $FIXEDFILE  # Send the state name to the file. Trim the last character (a '\n')								
			fi
		else
			state=""  						# Reset state name for next state.							
			if [[ "$char" != [#] ]]; then
				printf "%s" "$char" >> $FIXEDFILE	# Put the results (pop vote, electoral vote, etc.) to the text file.
			else 
				printf " " >> $FIXEDFILE 	# Put a space between the results.
			fi			
		fi 
	done
done < "$ERROR2000"
