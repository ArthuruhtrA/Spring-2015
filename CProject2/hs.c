/*
 * Home Security System
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "hs_config.h"
#include "hs_util.h"

/*
 * An event node on the linked list of events for
 * a room. Consists of an event as gathered from a
 * reading and a link to the next node on the list
 * (if any).
 */
struct evnode_t {
	struct event_t event ;
	struct evnode_t *next ;
} ;

/*
 * Room event information
 * 	The room number.
 * 	Total number of events that have been logged.
 * 	Pointer to the most recent reading's node (if any).
 * 	Pointer to the next room (if any).
 */
struct room_t {
	int room ;
	int ecount ;
	struct evnode_t *evl_head ;
	struct room_t *next_room ;
} ;

/*
 * Head of the list of rooms being monitored.
 */
static struct room_t *room_list = NULL ;


/*
 * Local support functions (static).
 * You have to fill in the details.
 * Feel free to add more to make your work easier!
 */
static void process_a_reading(struct reading_t reading) ;

static struct room_t *find_room(int room) ;
static struct room_t *add_new_room(int room) ;
static void trim_list(int room, int keep, char timestamp[]) ;

static struct evnode_t *make_event_node() ;


/*
 * Main driver function.
 *
 * First, initialize global data structures (rooms array).
 *
 * Next, read lines of text representing readings, parse these, and if there
 * are no syntax errors, record the associated events. Syntactically incorrect
 * input reading lines are silently discarded.
 */
int main() {
	char next_line[MAX_LINELENGTH+1] ;
	struct reading_t reading ;

	/*
	 * Read a line of text into next_line, then attempt to parse
	 * it as a <reading> line. If the line is parsable, get the
	 * last reading structure and process it according to the
	 * specification for the appropriate level.
	 * See hs_util.h for useful utility functions.
	 */
	
	// FILL IN THE BODY
	while (read_line(next_line, MAX_LINELENGTH) != EOF){//Loop until EOF
		if (parse_line(next_line) == 0){//If it's garbage, move on
			continue;
		}
		reading = get_last_reading();//Save last reading
		process_a_reading(reading);//Do something with it
	}

	return 0 ;
}

/*
 * Given a reading, process the included event for the room in the reading.
 * T_PRINT and T_TRIM readings are really commands; once executed they are
 * discarded.
 * For all other readings check to see whether an alert should be printed,
 * then add the event to as the newest event in the room's event list.
 */
static void process_a_reading(struct reading_t reading) {

	// FILL IN THE BODY
	struct room_t *this_room;
	switch (reading.event.event_id){
		case T_TEMPERATURE:
			if (reading.event.event_info < MIN_TEMP ||
			    reading.event.event_info > MAX_TEMP){
				printf("Temperature alert @ %s: room %i / "
				       "sensor %i / %i degrees.\n",
				       reading.event.time_stamp,
				       reading.room_id, reading.event.sensor,
				       reading.event.event_info);
			}
			break;
		case T_CO:
			if (reading.event.event_info > CO_LIMIT){
				printf("Carbon monoxide alert @ %s: room %i / "
				       "sensor %i / %i PPB.\n",
				       reading.event.time_stamp,
				       reading.room_id, reading.event.sensor,
				       reading.event.event_info);
			}
			break;
		case T_INTRUDER:
			printf("Intruder alert @ %s: room %i / sensor %i.\n",
			       reading.event.time_stamp, reading.room_id,
			       reading.event.sensor);
			break;
		case T_TRIM:
			//Do nothing for now
			return;
		case T_PRINT:
			printf("*****\n"
			       "Home Security System: Room %i at %s\n"
			       "Triggered by sensor %i\n"
			       "%i total room events\n", reading.room_id,
			       reading.event.time_stamp, reading.event.sensor,
			       this_room->ecount);//Print command info
			//Create walker
			struct evnode_t* curr = this_room->evl_head;
			while (curr != NULL){//For each event print info
				printf("Sensor %i @ %s ", curr->event.sensor,
				       curr->event.time_stamp);
				switch (curr->event.event_id){
					case T_TEMPERATURE:
						printf("temperature reading %i "
						       "degrees\n",
						       curr->event.event_info);
						break;
					case T_CO:
						printf("carbon monoxide reading "
						       "%i degrees\n",
						       curr->event.event_info);
						break;
					case T_INTRUDER:
						printf("intruder alert\n");
						break;
				}
				curr = curr->next;
			}
			return;
	}

	//Add event to list
	this_room->ecount++;
	struct evnode_t* new_node = make_event_node(reading.event);
	new_node->next = this_room->evl_head;
	this_room->evl_head = new_node;

	return ;
}


/*
 * Find the specified <room> in the <room_list>, returning a pointer to the
 * found room_t structure or NULL if there is no such <room> in the list.
 */
static struct room_t *find_room(int room) {
	struct room_t *the_room ;

	// FILL IN THE BODY
	the_room = room_list;
	while (the_room != NULL){
		if (the_room->room == room){
			break;
		}
		the_room = the_room->next_room;
	}

	return the_room ;
}

/*
 * Create a new room_t node for <room>, initialize its fields, and append
 * the node to the end of the <room_list>.
 * Returns a pointer to the new room's structure.
 */
static struct room_t *add_new_room(int room) {
	struct room_t *new_room ; // ptr. to new room structure

	// FILL IN THE BODY
	new_room = (struct room_t*) malloc(sizeof(struct room_t));//Allocate
	new_room->room = room;
	new_room->ecount = 0;
	new_room->evl_head = NULL;
	new_room->next_room = NULL;

	struct room_t *curr = room_list;
	while (curr != NULL){
		if (curr->next_room = NULL){
			curr->next_room = new_room;
			return new_room;
		}
		curr = curr->next_room;
	}
	room_list = new_room;

	return new_room ;
}

/*
 * If the <room> is in the <room_list>, trim the room's event node list
 * to at most <keep> entries. As the list is ordered from newest to
 * oldest, the oldest entries are discarded.
 *
 * Whether the room exists or not, and whether or not the list holds
 * anything, the specified "Trim log" message must be printed. Obviously,
 * for a non-existent room nothing is actually trimmed (removed).
 *
 * Note - dynamically allocated space for event nodes removed from
 *        the list must be freed.
 */
static void trim_list(int room, int keep, char timestamp[]) {
//
	// FILL IN THE BODY

	return ;
}

/*
 * Create a new evnode_t node, initialize it using the provided
 * event and a NULL link, and return the pointer to the node.
 */
static struct evnode_t *make_event_node(struct event_t event) {
	struct evnode_t *new_evnode ;

	// FILL IN THE BODY
	//Allocate memory
	new_evnode = (struct evnode_t*) malloc(sizeof(struct evnode_t));
	new_evnode->event = event;
	new_evnode->next = NULL;

	return new_evnode ;
}
