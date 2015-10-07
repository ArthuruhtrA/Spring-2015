/* Practicum : cipher
*
*  Author: YOUR NAME
*
*  If you attended Kaitlin Thaney's (from Mozilla) talk on Tuesday complete 
*  the following phrase she used often : 
*
*  "Open science " (it's not "source") [Admittedly, I did not attend this talk. However, I know she advocates for Open Science.]
*
*  If you were unable to attend the talk due to a conflict with another 
*  course or required activity,  just indicate that you had a conflict. 
*  You are on your honor for this option.
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

// put any #defined constants here.

void cipher( char string[]);
void decipher( char string[]);

// The decoder table used to create the ciphered message
// The table character array holds 26 characters
// which map to 'A'-'Z'. (i.e. table[0]='G', table[25]='N')
//
// HINT: Remember that characters have equivalent ASCII integer values:
//		 'A'= 65 sequentially through 'Z'= 90. 
//       That should help when indexing into the table array.

char table[26] = {'G','Q','F','C','Z','M','Y','J','B','E','W','R','X',
                  'P','L','D','S','I','U','H','V','A','K','O','T','N'};

	
int main() {
	// declare any variables, including arrays you need here.
	char curr = getchar();
	char string[30];

	// Read lines from standard input until EOF is encountered,
	// discarding the newline and properly terminating the
	// string holding the line.
	// Call cipher with the string to encipher the text
	// Print out the resulting string as a line to standard output
	
	// FILL THIS IN
	
	while (curr != EOF){
		int i = 0;
		while (curr != '\n'){
			string[i] = curr;
			i += 1;
			curr = getchar();
		}
		string[i] = '\0';
		cipher(string);
		printf("%s\n", string);
	}

	return 0 ;
}

/*
 * Perform the substitution encipher on the characters in the string
 * passed in as a character array.
 */

void cipher(char string[]) {

   // FILL THIS IN
	int i = 0;
	for (i; i < sizeof(string) - 1; i++){
		string[i] = table[string[i] - 'A'];
	}
	return ;
}

/*
 * EXTRA CREDIT !!
 *
 * ONLY attempt after you have successfully 
 * completed the initial requirements.
 *
 * Decipher the coded message passed in as a character array
*/
 
void decipher(char string[]){
	
	// FILL THIS IN - EXTRA CREDIT ONLY !!
	
	return ;
}
