#include <stdlib.h>
#include <stdio.h>

int print_numbers(void) {
  int* arr = malloc(sizeof(int)*30);

  if(arr == NULL) {
    return 1;
  }

  for(int i = 0; i < 30; i++) {
    arr[i] = i*3;
  }

  for(int i = 0; i < 30; i++) {
    printf("%d ", *(arr + i));
  }
  printf("\n");
  return 0;
}

int main(void) {
  print_numbers();
}
