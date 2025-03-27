#include <stdio.h>

int main(void) {
  double d = 3.14;
  int i = 3;
  char c = 'a';

  double* pd = &d;
  int* pi = &i;
  char* pc = &c;

  printf("%p %p %p\n", pd, pi, pc);
  printf("%ld %p %p\n", ((long long) pd)*4, pi+1, pc+1);

  printf("%f\n", pd[0]);
}
