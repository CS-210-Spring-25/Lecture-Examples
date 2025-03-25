#include <stdio.h>

int main(void) {
  int i = 5;
  int* ip = &i;

  printf("i is: %d\n",i);
  printf("ip is %p\n",ip);
  printf("go to ip in memory: %d\n", *ip);
}
