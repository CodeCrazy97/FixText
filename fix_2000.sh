##############################################################
# This shell script fixes the 2000 election results, 
# which essentially caused every space to create a newline.
##############################################################

while read p; do
	# Check to see if the line is the name of a state.
	if [[ $p =~ ^[A-Za-z_] ]]; then
	  echo "$p"
	fi
done <2000error.txt