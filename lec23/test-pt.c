#include <stdio.h>

double data[] = {123,5,4,5,5,2,45,2,7652,1,5,42,51,41,5,313,4,62,4151,134,13,4,1};

int main(void) {
  int on_stack[100];

  for(int i = 0; i < 100; i++) {
    on_stack[i] = ((int) data) % 24;
  }
  printf("on_stack addr: %p\n", on_stack);
  printf("data addr: %p\n", data);
  getchar();
  
  printf("on_stack[0]: %d\n", on_stack[0]);
}
