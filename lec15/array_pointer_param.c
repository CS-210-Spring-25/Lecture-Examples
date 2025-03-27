#include <stdio.h>

int sumit2(int* A, int size) {
  printf("sizeof A: %ld\n", sizeof(A));
  int sum = 0;
  for(int i = 0; i < size; i++) sum += A[i];
  return sum;
}

int sumit(int A[], int size) {
  printf("sizeof A: %ld\n", sizeof(A));
  int sum = 0;
  for(int i = 0; i < size; i++) sum += A[i];
  return sum;
}

int main(void) {
  int XARRAY[] = {10,20,5,6,10};
  printf("summed with array %d\n", sumit(XARRAY, 5));
  printf("summer with pointer %d\n", sumit2(XARRAY, 5));
}
