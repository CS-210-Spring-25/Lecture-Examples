#include <stdio.h>

struct A {
  char a;
  int b;
  char c[3];
};

struct B {
  int a;
  int b;
};

int main(void) {
  struct A a = {'Z', -1, "AB"};
  struct B b = {4,2};

  printf("size A: %lu size B: %lu\n", sizeof(a), sizeof(b));
}
