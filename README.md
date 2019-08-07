# FixText
Places state-by-state election results on one line (per state).

This script uses the 2000error.txt file, placing the results in the 2000.txt file. 

The problem is: for every state, the election results are all on different lines. All the election results for each state (the number of votes cast per candidate and electoral votes) are placed on different lines. I wanted all election results for each state to be on one line.

For example: In the below picture, the election results in Alabama (popular votes for each candidate, total popular votes, and electoral votes) are on different lines.

![alt text](https://github.com/CodeCrazy97/FixText/blob/master/ALbad.png)

After running the Shell script, the results for Alabama will all be on one line, as in the picture below:

![alt text](https://github.com/CodeCrazy97/FixText/blob/master/ALfixed.png)

The 2000error.txt contains the results on multiple lines. The 2000.txt file contains the fixed election results.
