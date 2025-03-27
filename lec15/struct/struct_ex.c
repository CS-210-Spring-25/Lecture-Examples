#include <stdio.h>

struct person {
  int age;
  int grad_year;
  double height;
};

int main(void) {
  struct person tom;
  printf("size of person struct: %ld bytes\n", sizeof(struct person));

  tom.age = 40;
  tom.grad_year = 1999;
  tom.height = 3.2;
  
  printf("struct info:\n age: %d\n grad year: %d\n Height: %lf (m)\n",
	 tom.age,
	 tom.grad_year,
	 tom.height);
  return 0;
}
