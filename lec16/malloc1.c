#include <stdlib.h>
#include <stdio.h>

int main(void) {
  int* i = malloc(sizeof(int));

  if(i == NULL) {
    return 1;
  }

  *i = 5;
  *i += 7;
  
  printf("There is a value: %d at %p\n", *i,i);
}
