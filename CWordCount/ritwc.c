#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FALSE (0)
#define TRUE  (1)

int main() {
	int tot_chars = 0 ;	/* total characters */
	int tot_lines = 0 ;	/* total lines */
	int tot_words = 0 ;	/* total words */

	/* REPLACE WITH ADDITIONAL VARIABLE DECLARATIONS YOU NEED */
	int character;
	int wasspace = 1;

	/* REPLACE WITH THE CODE FOR WORD COUNT */
	while ((character = getchar()) != EOF){
		tot_chars++;
		if (character == '\n'){
			tot_lines++;
		}
		if (isspace(character)){
			if (wasspace == 0){
				tot_words++;
			}
			wasspace = 1;
		}
		else {
			wasspace = 0;
		}
	}

	printf("\t%d\t%d\t%d\n", tot_lines, tot_words, tot_chars);

	return 0 ;
}
