# Practica source files and the object files derived from them.
SOURCES = test_hardware.c hardware.c memory.c assert.c
OBJS = $(SOURCES:.c=.o)

# Primary target - test_hardware executable

test_hardware: $(OBJS)
	gcc -o test_hardware -ggdb $(OBJS)

# Object file dependencies.
# See .c.o rule for how C files are converted to object files implicitly.

test_hardware.o: test_hardware.c hardware.h memory.h assert.h

hardware.o: hardware.c hardware.h memory.h

memory.o: memory.c assert.h memory.h

# Clean up the directory

clean:
	rm -f test_hardware test_hardware.exe
	rm -f *.o *.bak *~*

# Implicit rule for converting .c files to .o files when the
# .o file is out of date.
.c.o:
	gcc -c -ggdb $<
