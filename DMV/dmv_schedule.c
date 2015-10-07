/***
 * Functions for the DMV customer scheduling and service application.
 * Implementation file.
 ***/

#include <stdlib.h>
#include "dmv_schedule.h"

/*
 * Actual definition of the line array of service lines.
 */
struct service_line line[NLINES] ;

/*
 * Initialize the service lines so that (a) line[0] has priority 'A'
 * through line[2] having priority 'C' and (b) there are no customers
 * in any line.
 * NOTES: As usual, an empty list is signified by a NULL pointer.
 */
void init_service_lines() {
	// Placeholder for your code
	
	line[0].priority = 'A';
	line[0].head_of_line = NULL;
	
	line[1].priority = 'B';
	line[1].head_of_line = NULL;
	
	line[2].priority = 'C';
	line[2].head_of_line = NULL;
}

/*
 * Return the next ticket number.
 * 	The first customer gets ticket number 1.
 *	The number increases by 1 on each call.
 * Local (static) int ticket holds the current ticket value.
 */
static int ticket = 1 ;
int next_ticket() {
	ticket++;
	return ticket - 1 ;	// Placeholder for your code.
}

/*
 * A new customer arrives with the given <priority> and
 * <ticket_number>. The customer is placed at the end of
 * the appropriate service line.
 */
void new_customer(char priority, int ticket_number) {
	// Placeholder for your code.
	int which = 0;
	switch(priority){
		case 'A':
			which = 0;
			break;
		case 'B':
			which = 1;
			break;
		case 'C':
			which = 2;
			break;
	}
	
	struct customer* curr = line[which].head_of_line;
	//struct customer* prev = curr;
	while(curr != NULL){
		//prev = curr;
		curr = curr->next_customer;
	}
	curr = (struct customer*) malloc(sizeof(struct customer));
	curr->ticket_number = next_ticket();
	curr->next_customer = NULL;
	//prev->next_customer = curr;
	return;
}

/*
 * Return the ticket number of the first customer in the
 * line for <priority> after removing the customer from the
 * associated service_line.
 *
 * Return NO_CUSTOMER if there are no customers in the indicated line.
 */
int serve_customer(char priority) {	
	int which = 0;
	switch(priority){
		case 'A':
			which = 0;
			break;
		case 'B':
			which = 1;
			break;
		case 'C':
			which = 2;
			break;
	}
	
	struct customer* curr = line[which].head_of_line;
	if (curr == NULL){
		return NO_CUSTOMER;
	}
	line[which].head_of_line = line[which].head_of_line->next_customer;
	
	return curr->ticket_number ; // Placeholder for your code.
}

/*
 * Return the ticket number of the first customer in the highest
 * priority line that has customers after removing the customer
 * from the line. 'A' is highest priority and 'C' is lowest.
 *
 * Return NO_CUSTOMER if there are no customers in any of the lines.
 *
 * Example: if there are 0 customers in the 'A' line, 3 customers in the 'B'
 *          line and 2 customers in the 'C' line, then the first customer in
 *          the 'B' line would be removed and his/her ticket number returned.
 */
int serve_highest_priority_customer() {
	if (customer_count('A') > 0){
		return serve_customer('A');
	}
	else if (customer_count('B') > 0){
		return serve_customer('B');
	}
	else if (customer_count('C') > 0){
		return serve_customer('C');
	}
	return NO_CUSTOMER ; // Placeholder for your code
}

/*
 * Return the number of customers in the service line for <priority>
 */
int customer_count(char priority) {
	int which = 0;
	switch(priority){
		case 'A':
			which = 0;
			break;
		case 'B':
			which = 1;
			break;
		case 'C':
			which = 2;
			break;
	}
	
	struct customer* curr = line[which].head_of_line;
	int total = 0;
	while(curr != NULL){
		total++;
		curr = curr->next_customer;
	}
	return total ; // Placeholder for your code.
}

/*
 * Return the number of customers in all service lines.
 */
int customer_count_all() {
	return customer_count('A') + customer_count('B') + customer_count('C') ; // Placeholder for your code.
}
