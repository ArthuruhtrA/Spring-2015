/*
 * Maintain counts of items in the hardware store.
 *
 * Items have a type (paint, tools, fasteners, etc.) and a name,
 * both encoded as unsigned integers.
 *
 * The numbers for names are only guaranteed to be unique to a given type
 * (that is, a can of stain in paint and a jigsaw tool may both have their name
 * encoded as 1).
 */

/*
 * Interface to the hardware store item tracking program.
 */

#ifndef HARDWARE_H
#define HARDWARE_H

/*
 * Record <count> new items of the given <type> and <name> and add
 * these to the existing inventory.
 * That is, increment the hardware store's record of copies of this
 * item by <count>.
 */
void record(unsigned type, unsigned name, unsigned count) ;

/*
 * Return the count of the number of the given item (<type> and <name>) held
 * by the hardware store's inventory.
 */
unsigned item_count(unsigned type, unsigned name) ;

/*
 * Return the total number of items in the store's inventory of a
 * given <type>.
 */
unsigned type_total(unsigned type) ;

/*
 * Clear the hardware store's inventory - at the end the hardware store has
 * no items.
 */
void clear_inventory() ;

#endif
