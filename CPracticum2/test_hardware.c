/*
 * Test suite for the four functions in the hardware store module.
 */

#include <stdlib.h>
#include <stdio.h>

#include "memory.h"
#include "assert.h"
#include "hardware.h"

/*
 * Numbers for types.
 */
#define PAINT		(0)
#define TOOL		(1)
#define FASTENER	(2)

/*
 * Numbers for names (unique within type)
 */

#define STAIN		(0)	/* PAINT */
#define EXTERIOR	(1)	/* PAINT */
#define JIGSAW		(0)	/* TOOL */
#define HAMMER		(1)	/* TOOL */
#define NAILS		(0)	/* FASTENER */
#define SCREWS		(1)	/* FASTENER */

/*
 * The test functions.
 */

static void test1() ;
static void test2() ;
static void test3() ;

int main() {
	set_test_mode(RUN_TO_TEST_FAILURE) ;

	test1() ;
	test2() ;
	test3() ;

	summary() ;
}

/*
 * Requires record() & item_count().
 */
static void test1() {
	newtest("record() and item_count()") ;

	printf("Add 3 items to the store inventory\n") ;
	record(PAINT, EXTERIOR, 12) ;
	record(TOOL, JIGSAW, 10) ;
	record(FASTENER, NAILS, 7) ;

	printf("All counts correct?\n") ;
	assert(item_count(PAINT, EXTERIOR) == 12) ;
	assert(item_count(PAINT, STAIN) == 0) ;
	assert(item_count(TOOL, JIGSAW) == 10) ;
	assert(item_count(TOOL, HAMMER) == 0) ;
	assert(item_count(FASTENER, NAILS) == 7) ;
	assert(item_count(FASTENER, SCREWS) == 0) ;

	printf("3 areas allocated?\n") ;
	assert(allocated_area_count() == 3) ;

	printf("Add items to the inventory: 2 new items, 2 updated items\n") ;
	record(FASTENER, SCREWS, 21) ;
	record(FASTENER, NAILS, 10) ;
	record(TOOL, JIGSAW, 9) ;
	record(PAINT, STAIN, 2) ;

	printf("All counts correct?\n") ;
	assert(item_count(PAINT, EXTERIOR) == 12) ;
	assert(item_count(PAINT, STAIN) == 2) ;
	assert(item_count(TOOL, JIGSAW) == 19) ;
	assert(item_count(TOOL, HAMMER) == 0) ;
	assert(item_count(FASTENER, NAILS) == 17) ;
	assert(item_count(FASTENER, SCREWS) == 21) ;

	printf("5 areas allocated?\n") ;
	assert(allocated_area_count() == 5) ;
}

/*
 * Requires test1() passed and type_total()
 */
static void test2() {
	newtest("totals by type") ;

	printf("Total of PAINT correct?\n") ;
	assert(type_total(PAINT) == 14) ;
	printf("Total of TOOL correct?\n") ;
	assert(type_total(TOOL) == 19) ;
	printf("Total of FASTENER correct?\n") ;
	assert(type_total(FASTENER) == 38) ;
}

/*
 * Requires test2() passed and clear_inventory().
 */
static void test3() {
	newtest("clear hardware store inventory") ;

	printf("Clearing inventory ...\n") ;
	clear_inventory() ;

	printf("All item counts == 0?\n") ;
	assert(item_count(PAINT, EXTERIOR) == 0) ;
	assert(item_count(PAINT, STAIN) == 0) ;
	assert(item_count(TOOL, JIGSAW) == 0) ;
	assert(item_count(TOOL, HAMMER) == 0) ;
	assert(item_count(FASTENER, NAILS) == 0) ;
	assert(item_count(FASTENER, SCREWS) == 0) ;

	printf("No orphan storage?\n") ;
	assert(allocated_area_count() == 0) ;
}
