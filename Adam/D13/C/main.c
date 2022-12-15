#include <stdio.h>
#include <memory.h>
#include <malloc.h>

#define SIZE 512

struct node {
    struct node* children[SIZE];
    struct node* parent;
    int num_children;
    int value;
};

int is_ordered(struct node* n1, struct node* n2)
{
    if (n1->value != -1 && n2->value != -1) {
        if (n1->value < n2->value) {
            return 1; // Ordered
        } else if (n1->value == n2->value) {
            return 0;
        }
        return -1; // Not ordered
    }
    int min_items = n1->num_children < n2->num_children ? n1->num_children : n2->num_children;
    for (int i = 0; i < min_items; i++) {
        int code = is_ordered(n1->children[i], n2->children[i]);
        if (code != 0) {
            return code;
        }
    }
    if (n1->num_children < n2->num_children) {
        return 1; // Ordered
    } else if (n1->num_children == n2->num_children) {
        return 0;
    }
    return -1; // Not ordered
}

int get_num(const char s[SIZE], int* index, int* num)
{
    int i = 0;
    int j = *index;
    char out[SIZE];
    memset(out, 0, SIZE);
    int next_valid = 1;
    for (; j < SIZE; j++) {
        if (s[j] == 0 || s[j] == '\n' || s[j] == '[' || s[j] == ']') {
            next_valid = 0;
            break;
        }
        if (s[j] == ',') {
            break;
        }
        out[i++] = s[j];
    }
    sscanf(out, "%d", num);
    if (s[j + 1] == '[' || s[j + 1] == ']') {
        next_valid = 0;
    }
    if (next_valid) {
        *index = j + 1;
    }
    return next_valid;
}

struct node* get_nodes(const char buffer[SIZE])
{
    struct node* curr_node = malloc(sizeof(struct node));;
    curr_node->num_children = 0;
    curr_node->value = -1;
    curr_node->parent = curr_node;

    int i = 0;
    while (1) {
        char c = buffer[i];
        if (c == '\n' || c == 0) {
            break;
        }
        if (c == '[') {
            // Make a new node
            struct node* parse = malloc(sizeof(struct node));;
            parse->num_children = 0;
            parse->value = -1;
            parse->parent = curr_node;
            curr_node->children[curr_node->num_children++] = parse;
            curr_node = parse;
            i++;
        } else if (c == ']') {
            curr_node = curr_node->parent;
            i++;
        } else if (c == ',') {
            i++;
        } else {
            int val = 0;
            int valid = 0;
            while (1) {
                valid = get_num(buffer, &i, &val);
                struct node* val_node = malloc(sizeof(struct node));
                val_node->num_children = 1;
                val_node->value = val;
                val_node->parent = curr_node;
                val_node->children[0] = val_node;
                curr_node->children[curr_node->num_children++] = val_node;
                if (!valid) {
                    i++;
                    break;
                }
            }
        }
    }
    return curr_node;
}

int main() {
    struct node* all_nodes[SIZE] = {NULL};

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];

    int sum = 0;
    int i = 1;
    int node_index = 0;
    while (1) {
        memset(buffer, 0, SIZE);
        char *out = fgets(buffer, SIZE, (FILE *) input);
        if (!out) {
            break;
        }
        struct node* list1 = get_nodes(buffer);
        memset(buffer, 0, SIZE);
        fgets(buffer, SIZE, (FILE *) input);
        struct node* list2 = get_nodes(buffer);

        int code = is_ordered(list1, list2);
        if (code == 1) {
            sum += i;
        }
        fgets(buffer, SIZE, (FILE *) input);

        all_nodes[node_index++] = list1;
        all_nodes[node_index++] = list2;
        i++;
    }

    printf("Sum of ordered pair indices is: %d", sum);

    // Insert packets
    struct node* packet2 = get_nodes("[[2]]");
    struct node* packet6 = get_nodes("[[6]]");
    all_nodes[node_index++] = packet2;
    all_nodes[node_index++] = packet6;

    // bubble sort lmao
    int is_done = 0;
    while (!is_done) {
        is_done = 1;
        for (int j = 0; j < node_index - 1; j++) {
            if (is_ordered(all_nodes[j], all_nodes[j+1]) != 1) {
                struct node* temp = all_nodes[j];
                all_nodes[j] = all_nodes[j+1];
                all_nodes[j+1] = temp;
                is_done = 0;
            }
        }
    }

    int index2 = 0;
    int index6 = 0;
    for (int j = 0; j < node_index; j++) {
        if (all_nodes[j] == packet2) {
            index2 = j + 1;
        }
        if (all_nodes[j] == packet6) {
            index6 = j + 1;
        }
    }

    printf("\nDecoder key is: %d", index2 * index6);
}
