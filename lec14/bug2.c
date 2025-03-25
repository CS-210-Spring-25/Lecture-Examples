#include <stdio.h>

int *f(void) {
  int i = 12;
  printf("%p\n", &i);
  return &i;
}

int main(void) {
  int *pi = f();

  printf("i: %d\n", *pi);
}
