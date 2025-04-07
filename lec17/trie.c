#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct tree_node {
  int data;
  struct tree_node* next[127];
} trie;

void add_node(trie *root, char* word) {
	int i = 0;
	while(word[i] != 0 && root->next[(int)word[i]] != NULL) {
		root = root->next[(int)word[i]];
		i++;		
	}


	while(word[i] != 0) {
		root->next[(int)word[i]] = calloc(1, sizeof(struct tree_node));
		root = root->next[(int)word[i]];
		i++;
	}

	printf("added word %s %d\n", word, i);
	
	root->data += 1;
}

void print_trie(trie* node, char* buffer, int depth) {
    if (!node) return;

    if (node->data > 0) {
        buffer[depth] = '\0';
        printf("%s: %d\n", buffer, node->data);
    }

    for (int i = 0; i < 127; i++) {
		if(node->next[i] != NULL) {
			buffer[depth] = i;
			print_trie(node->next[i], buffer, depth + 1);
		}
    }
}

void max_word(trie* node, char* current, int depth,
	char* best_word, int* best_freq) {
	if (!node) return;

	if (node->data > *best_freq) {
		current[depth] = '\0';
		strcpy(best_word, current);
		*best_freq = node->data;
	}

	for (int i = 0; i < 127; i++) {
		if(node->next[i] != NULL) {
			current[depth] = i;
			max_word(node->next[i], current, depth + 1, best_word, best_freq);
		}
	}
}

void autocomplete(trie* node) {
	char buffer[100];
	int i = 0;

	while(1) {
		char c;

		printf("Type character: ");
		scanf(" %c", &c);

		if(c == '0') {
			return;
		}

		buffer[i] = c;
		buffer[i+1] = '\0';
		i++;

		char current[100];
		char best_word[100];
		int best_freq = -1;

		if(node->next[(int)c] == NULL) {
			printf("NONE FOUND\n");
			return;
		}
		strcpy(current,buffer);

		node = node->next[(int)c];

		max_word(node, current, i, best_word, &best_freq);

		printf("Did you mean %s? (Freq. %d)\n", best_word, best_freq);
	}
}

int main(void) {
	printf("Scanning input file input.txt and populating trie...\n");

	FILE *fptr;

	// Open a file in read mode
	fptr = fopen("input.txt", "r");

	char myString[100];

	trie* root = calloc(1, sizeof(trie));

	while(fgets(myString, 100, fptr)) {
		size_t ln = strlen(myString) - 1;
		if (myString[ln] == '\n')
    		myString[ln] = '\0';
		printf("%s\n", myString);
		add_node(root, myString);
	}

	// Close the file
	fclose(fptr);

	char buffer[256];
    print_trie(root, buffer, 0);

	autocomplete(root);
}