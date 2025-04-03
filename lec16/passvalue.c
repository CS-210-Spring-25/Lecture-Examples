#include <stdio.h>

struct person {
  int age;
  int grad_year;
  double height;
};

void age_up(struct person p) {
  p.age++;
  printf("in age_up: %d\n", p.age);
}

int main(void) {
  struct person tom = {40,1999, 3.2};
  age_up(tom);
  printf("in main: %d\n", tom.age);
  return 0;
}
