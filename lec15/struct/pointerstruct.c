#include <stdio.h>

struct person {
  int age;
  int grad_year;
  double height;
};

int main(void) {
  struct person sarah;
  sarah.age = 60;
  sarah.grad_year = 1980;
  sarah.height = 1.2;

  printf("sarah's old age: %d\n", sarah.age);
  struct person* sp;
  sp = &sarah;

  (*sp).age++;

  printf("sarah's new age: %d\n", sarah.age);
  
}
