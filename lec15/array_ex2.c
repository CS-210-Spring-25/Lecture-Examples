#include <stdio.h>

int main(void) {
  int arr[] = {99,99,99,99};
  int arr2[] = {101,102,103,104};
  
  printf("arr[0]: %d, OUT OF BOUNDS?: %d\n", arr[0], arr[4]);
  printf("arr2[0]: %d\n", arr2[0]);

  printf("%p\n", arr);
  printf("%p\n", arr2);

  //printf("*arr %d\n", *arr);
}
