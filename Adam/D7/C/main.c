#include <stdio.h>
#include <memory.h>

#define SIZE 255
#define KEY_SIZE 1024
#define HASH_LIMIT 1024

// https://cp-algorithms.com/string/string-hashing.html#calculation-of-the-hash-of-a-string
long long compute_hash(const char s[KEY_SIZE]) {
    const long p = 31;
    const long m = 1000000009;
    long long hash_value = 0;
    long long p_pow = 1;
    for (int i = 0; i < KEY_SIZE; i++) {
        if (s[i] == 0) {
            break;
        }
        hash_value = (hash_value + (s[i] - 'a' + 1) * p_pow) % m;
        p_pow = (p_pow * p) % m;
    }
    return hash_value;
}

int get_next_var(const char s[SIZE], char out[SIZE], int start)
{
    int i = 0;
    memset(out, 0, SIZE);
    for (int j = start; j < SIZE; j++) {
        if (s[j] == 0 || s[j] == ' ' || s[j] == '\n') {
            break;
        }
        out[i++] = s[j];
    }
    return i;
}

int get_hash_uid(const long long lookup[HASH_LIMIT], const long long hash)
{
    for (int i = 0; i < HASH_LIMIT; i++) {
        if (lookup[i] == hash) {
            return i;
        }
    }
    return 0;
}

int append_key(char key[HASH_LIMIT], const char var[SIZE], int start) {
    int i = 0;
    for (; i < SIZE; i++) {
        if (var[i] == 0) {
            break;
        }
        key[start+i] = var[i];
    }
    key[start+i] = '/';
    return start + i + 1;
}

int decrement_key(char key[HASH_LIMIT], int start)
{
    // start is the index of the final slash
    key[start--] = 0;
    int i = start;
    for (; i >= 0; i--) {
        if (key[i] == '/') {
            break;
        }
        key[i] = 0;
    }
    return i;
}

int main() {

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];
    char var[SIZE];
    long long lookup[HASH_LIMIT] = {0};

    long long hash = 0;
    char key[HASH_LIMIT];
    int key_index = 0;
    char key_copy[HASH_LIMIT];
    int key_copy_index = 0;

    unsigned long node_size[HASH_LIMIT] = {0};
    int node_ls_done[HASH_LIMIT] = {0};

    int is_ls = 0;
    int skip_to_command = 0;

    // Hash the main dir
    key[0] = '/';
    lookup[1] = compute_hash(key);
    int uid = 1;

    while (1) {
        memset(buffer, 0, 255);
        char* out = fgets(buffer, SIZE, (FILE*)input);
        if (!out) {
            break;
        }

        if (skip_to_command) {
            if (buffer[0] != '$') {
                continue;
            }
            is_ls = 0;
            skip_to_command = 0;
        }

        // Parse ls
        if (is_ls) {
            // Ignore sub-folders
            if (buffer[0] == 'd') {
                continue;
            }
            if (buffer[0] != '$') {
                get_next_var(buffer, var, 0);
                unsigned long file_size;
                sscanf(var, "%lu", &file_size);

                // Recursively add to parent size
                memcpy(key_copy, key, HASH_LIMIT);
                key_copy_index = key_index - 1;
                while (key_copy_index != 0) {
                    node_size[get_hash_uid(lookup, compute_hash(key_copy))] += file_size;
                    key_copy_index = decrement_key(key_copy, key_copy_index);
                }
                node_size[get_hash_uid(lookup, compute_hash(key_copy))] += file_size;
            } else {
                is_ls = 0;
            }
        }

        // Parse command
        if (buffer[0] == '$') {

            // Parse cd
            if (buffer[2] == 'c') {
                int var_length = get_next_var(buffer, var, 5);
                if (var_length == 1 && var[0] == '/') {
                    memset(key, 0, HASH_LIMIT);
                    key[0] = '/';
                    key_index = 1;
                    continue;
                }
                if (var_length == 2 && var[0] == '.') {
                    key_index = decrement_key(key, key_index);
                    continue;
                }
                key_index = append_key(key, var, key_index);

                // Determine if we need a hash
                hash = compute_hash(key);
                if (get_hash_uid(lookup, hash) == 0) {
                    lookup[++uid] = hash;
                }
            }

            // Parse ls
            if (buffer[2] == 'l') {
                hash = compute_hash(key);
                uid = get_hash_uid(lookup, hash);

                // Ignore this ls if we have done it already
                if (node_ls_done[uid]) {
                    skip_to_command = 1;
                } else {
                    is_ls = 1;
                    node_ls_done[uid] = 1;
                }

            }
        }

    }

    unsigned long total = 0;
    for (int i = 0; i < uid; i++) {
        if (node_size[i] <= 100000 ) {
            total += node_size[i];
        }
    }

    printf("Total of <= 100,000 dirs is: %lu", total);

    unsigned long capacity = 70000000;
    unsigned long required_space = 30000000;
    unsigned long min_dir_size = required_space - (capacity - node_size[1]);

    unsigned long smallest_above_min = capacity;
    for (int i = 0; i < uid; i++) {
        if (node_size[i] >= min_dir_size && node_size[i] < smallest_above_min) {
            smallest_above_min = node_size[i];
        }
    }

    printf("\nThe smallest dir that can be deleted to meet spec has size: %lu", smallest_above_min);

    return 0;
}
