#include <stdlib.h>
#include <stdio.h>

void main(){
    puts("Fahrenheit - Celcius");
    int i;
    for (i = 0; i <= 300; i += 20){
        printf("%d\t%d\n", i, (5 * (i - 32) / 9));
    }
}
