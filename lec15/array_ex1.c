#include <stdio.h>

int main(void) {
  int arr[10];
  // int arr3[]; // throws an error
  int arr2[] = {10,20,5,10,6,-3,1,0,-7,8};
  printf("size of arr: %lu\n", sizeof(arr));

  
  for(int i = 0; i < 10; i++) {
    printf("%d ", arr2[i]);
  }
  printf("\n");

  // Hmmm... what will this print?
  for(int i = 0; i < 10; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}
