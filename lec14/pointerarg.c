#include <stdio.h>


// foo takes in a pointer to an int
// foo changes the value of the int to 2.
void foo(int* var) {
  *var = 2;
}


int main(void) {
  int i = 5;

  printf("i before: %d\n",i);
  foo(&i);
  printf("i after: %d\n", i);
}
