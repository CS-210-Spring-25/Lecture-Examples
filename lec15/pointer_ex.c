#include <stdio.h>

int global_i = 123;
char global_c = '1';


int main(void) {
  int i = 10;
  float f = 12.3;

  int *pi = &i;
  float *pf = &f;
  
  int *pgi = &global_i; 
  char *pgc = &global_c;

  printf("pi: %p, pf: %p, pgi: %p, pgc %p\n",pi,pf,pgi,pgc);

  *pi = *pgi * 3;

  printf("i: %d\n",i);
  
  int **to_pi = &pi;
  **to_pi = 1;
  printf("i: %d\n", i);
}
