/*
 * Maintain counts of items in the hardware store.
 *
 * Items have a type (paint, tools, fasteners, etc.) and a name,
 * both encoded as unsigned integers.
 *
 * The numbers for names are only guaranteed to be unique to a given type
 * (that is, a can of red paint and a jigsaw tool may both have their name
 * encoded as 1).
 */

#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#include "memory.h"
#include "hardware.h"

/*
 * A <hw_item> records the <type> and <name> integer codes for
 * a hw_item along with the the number of <icount> in the collection.
 *
 * There is a link to the <next_hw_item> in the collection list,
 * which is NULL for the last hw_item in the list.
 */
typedef struct _hw_item {
	unsigned type ;
	unsigned name ;
	unsigned icount ;
	struct _hw_item *next_hw_item ;
} hw_item ;

/*
 * Pointer to the first hw_item (if any) in the hw_item list.
 * Initially the list is empty.
 */
static hw_item *hw_itemlist = NULL ;

/*
 * ***** HELPER FUNCTION YOU MAY FIND USEFUL ********
 *
 * Return true if and only if the hw_item referenced by
 * NON-NULL pointer <hw_item> matches the <type> and <name>.
 */
static bool match(hw_item *p_item, unsigned type, unsigned name) {
	return (p_item->type == type && p_item->name == name) ;
}

/*
 * Record <count> new items of the given <type> and <name> and add
 * these to the existing inventory.
 * That is, increment the hardware store's record of copies of this
 * item by <count>.
 *
 * IMPLEMENTATION NOTES:
 *
 * If a hw_item node is in the list for <type> and <name> then
 * simply increment its count.
 * Otherwise, create a new hw_item node, initialize its fields
 * <type> and <name>, set the <icount> to <count> and
 * place the node at any convenient location in list.
 */
void record(unsigned type, unsigned name, unsigned count) {
	hw_item* curr = hw_itemlist;
	hw_item* prev = NULL;
	while (curr != NULL){
		if (match(curr, type, name)){
			curr->icount += count;
			return;
		}
		prev = curr;
		curr = curr->next_hw_item;
	}
	curr = (hw_item*) malloc(sizeof(hw_item));
	curr->type = type;
	curr->name = name;
	curr->icount = count;
	curr->next_hw_item = hw_itemlist;
	hw_itemlist = curr;
	return;
}

/*
 * Return the count of the number of the given item (<type> and <name>) held
 * by the hardware store's inventory.
 *
 * IMPLEMENTATION NOTES:
 * Search the list for the given <type> and <name>; if found, return
 * the associated <icount>. Otherwise return 0.
 */
unsigned item_count(unsigned type, unsigned name) {
	hw_item* curr = hw_itemlist;
	while (curr != NULL){
		if (match(curr, type, name)){
			return curr->icount;
		}
		curr = curr->next_hw_item;
	}
	return 0;
}

/*
 * Return the total number of items in the store's inventory of a
 * given <type>.
 *
 * IMPLEMENTATION NOTES:
 * Starting with a total of zero, search the list for any and all
 * hw_items in the specified <type>, adding the associated <icount> to
 * the total.
 * At end, return the total.
 */
unsigned type_total(unsigned type) {
	hw_item* curr = hw_itemlist;
	unsigned total = 0;
	while (curr != NULL){
		if (curr->type == type){
			total += curr->icount;
		}
		curr = curr->next_hw_item;
	}
	return total;
}

/*
 * Clear the hardware store's inventory - at the end the hardware store has
 * no items.
 *
 * IMPLEMENTATION NOTES:
 * Release the storage for all hw_item nodes in the list, then
 * set the pointer to the head of the list to NULL.
 *
 * BE CAREFUL! Do not release the space for a node until you've
 * saved the pointer to its successor for use on the next iteration.
 */
void clear_inventory() {
	//Loop through all, save next to var, free
	hw_item* curr = hw_itemlist;
	hw_item* next = NULL;
	while (curr != NULL){
		next = curr->next_hw_item;
		free(curr);
		curr = next;
	}
	hw_itemlist = NULL;
	return ;
}
