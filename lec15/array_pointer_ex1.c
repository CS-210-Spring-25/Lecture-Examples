#include <stdio.h>

int main(void) {
  int arr[] = {123,456,789};
  int* p;

  
  p = arr;
  printf("p == arr: %d\n", p == arr);
  printf("value of p: %p\n", p);
  printf("deref. p: %d\n",*p);

  
  p++;
  printf("value of p: %p\n", p);
  printf("deref new p: %d\n", *p);
}
