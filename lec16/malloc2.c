#include <stdlib.h>
#include <stdio.h>

int main(void) {

  double sum = 0;
  for(int i = 0; i < 10000000; i++) {
    double* x = (double*) malloc(sizeof(double) * 500000);
    if(x == NULL) {
      printf("Error while malloc\n");
      return 1;
    }
    for(int j = 0; j < 100; j++) {
      x[j] = rand() % 100;
    }
    for(int j = 0; j < 100; j++) {
      sum += x[j];
    }

    if(i % 100000 == 0) {
      printf("%lf%% done\n", i / 100000.0);
    }
  }
  
  printf("the sum is: %lf\n", sum);
}
