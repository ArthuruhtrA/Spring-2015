/*
* BST - Implement a binary search tree (for strings).
*       Interface file
*
*/
#ifndef BST_H

#define TRUE  1
#define FALSE 0

/*
* The definition of what a treeNode contains.
*   - all strings in the left subtree, if any, precede
*     the value in this node.
*   - all strings in the right subtree, if any, follow
*     the value in this node.
*/

struct treeNode {
	struct treeNode * left ;    /* pointer to left subtree */
	struct treeNode * right ;   /* pointer to right subtree */
	char *value ; 				/* pointer to the value held at this node */
};


/*
* Return a new, empty binary search tree.
*/

struct treeNode *bst_make() ;

/*
* Insert the <value> string into the binary search <tree>.
* Returns a pointer to the updated <tree>.
*
* Note: Adding a value that is already in the tree has no 
*       observable effect.
*/

struct treeNode *bst_insert(struct treeNode *tree, char *value) ;

/*
* Return TRUE if the binary searcy <tree> contains the given
* string <value>, otherwise return FALSE.
*/

int bst_contains(struct treeNode *tree, char *value) ;

#endif

