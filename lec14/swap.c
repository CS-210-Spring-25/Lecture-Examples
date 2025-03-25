#include <stdio.h>

void swap(int *px, int *py) {
  int temp;

  temp = *px;
  *px = *py;
  *py = temp;
}

int main() {
  int a = 2, b = 3;
  swap(&a,&b);

  printf("%d, %d\n", a,b);
}
