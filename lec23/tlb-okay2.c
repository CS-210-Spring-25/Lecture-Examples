#include <stdio.h>
#include <stdlib.h>

int main() {
  char *large_array = malloc(100);
    
    if (large_array == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }
    
    for (int i = 0; i < 1000000; i++) {
        int random_index = rand() % (100);
        volatile int value = large_array[random_index]; 
	large_array[random_index] = value * 2;
    }
    
    free(large_array);
    return 0;
}
