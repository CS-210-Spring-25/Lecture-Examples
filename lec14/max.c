#include <stdio.h>

int max(int x, int y) {
  int bigger = x;
  if(y > x) {
    bigger = y;
    x = y; // set x to bigger val
  }
  printf("in max x: %d, y: %d\n", x,y);
  return bigger;
}


int main(void) {
  int x = 3;
  int y = 4;

  int ret = max(x,y);

  printf("ret: %d, x: %d, y: %d\n", ret, x,y);
}
