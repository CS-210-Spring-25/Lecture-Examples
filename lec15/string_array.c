#include <stdio.h>

int main(void) {
  char *p_msg = "Hello CS210";
  char a_msg[] = "Hello CS210";

  printf("%p %p\n", p_msg, a_msg);
}
