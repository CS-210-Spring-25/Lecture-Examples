#include <stdlib.h>
#include <stdio.h>

struct list {
  struct node* head;
};
  
struct node {
  int data;
  struct node* next;
};

void add_ll(struct list* list, int data) {
  struct node* new_node = malloc(sizeof(struct node));
  if(new_node == NULL) {printf("error malloc\n"); return; }
  
  new_node->data = data;
  new_node->next = list->head;
  list->head = new_node;
}

void remove_ll(struct list* list) {
  if(list->head == NULL) {
    return;
  }
  struct node* to_remove = list->head;
  list->head = list->head->next;
  
  free(to_remove);
}

void print(struct list* l) {
  struct node* curr = l->head;
  
  while(curr != NULL) {
    printf("%d ->", curr->data);
    curr = curr->next;
  }
  
  printf("NULL\n");
}


int main(void) {
  struct list* stack = malloc(sizeof(struct list));
  if(stack == NULL) {
    printf("error malloc\n");
    return -1;
  }

  
  add_ll(stack, 1);
  add_ll(stack, 34);
  add_ll(stack, 47);
  add_ll(stack, 42);

  print(stack);

  remove_ll(stack);
  remove_ll(stack);

  add_ll(stack, 3);
  print(stack);
}
