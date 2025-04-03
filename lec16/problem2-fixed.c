#include <stdio.h>
#include <stdlib.h>

struct person {
  int age;
  int grad_year;
  double height;
};

struct person* make_person() {
  struct person* p = malloc(sizeof(struct person));
  p->age = 1;
  p->grad_year = 0;
  p->height = 0.1;
  return p;
}

int main(void) {
  struct person* greg = make_person();
  if(greg == NULL) {
    return 1;
  }
  
  printf("greg's age: %d\n", greg->age);
  free(greg);
  return 0;
}

