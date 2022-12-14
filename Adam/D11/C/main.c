#include <stdio.h>
#include <memory.h>

#define SIZE 255
#define NUM_TURNS 20
#define NUM_MOD_TURNS 10000
#define MAX_MONKEYS 12
#define MONKEY_CAPACITY 255

int get_first_op_pos(const char s[SIZE])
{
    for (int i = 0; i < SIZE; i++) {
        if (s[i] == '*' || s[i] == '+') {
            return i;
        }
    }
    return -1;
}

int get_first_num_pos(const char s[SIZE])
{
    for (int i = 0; i < SIZE; i++) {
        if (9 >= s[i] - '0' && s[i] - '0' >= 0) {
            return i;
        }
    }
    return -1;
}

int get_num(const char s[SIZE], int* index, int* num)
{
    int i = 0;
    int j = *index;
    char out[SIZE];
    memset(out, 0, SIZE);
    int next_valid = 1;
    for (; j < SIZE; j++) {
        if (s[j] == 0 || s[j] == '\n') {
            next_valid = 0;
            break;
        }
        if (s[j] == ',') {
            break;
        }
        out[i++] = s[j];
    }
    sscanf(out, "%d", num);
    *index = j + 2;
    return next_valid;
}

unsigned long long operation(unsigned long long init_val, int op_code, unsigned long long rhs)
{
    if (rhs == -1) {
        rhs = init_val;
    }
    if (op_code == 0) {
        return init_val * rhs;
    }
    if (op_code == 1) {
        return init_val + rhs;
    }
    printf("Warning: Unknown op code!");
    return init_val;
}

int get_next_index(const unsigned long long stuff[MONKEY_CAPACITY])
{
    for (int i = 0; i < MONKEY_CAPACITY; i++) {
        if (stuff[i] == 0) {
            return i;
        }
    }
    return -1;
}

void lshift_stuff(unsigned long long stuff[MONKEY_CAPACITY])
{
    for (int i = 0; i < MONKEY_CAPACITY - 1; i++) {
        stuff[i] = stuff[i + 1];
    }
    stuff[MONKEY_CAPACITY - 1] = 0;
}

void monkey_turn_mod_divisor(unsigned long long mod_divisor, int monkey, unsigned long long monkey_stuff[MAX_MONKEYS][MONKEY_CAPACITY], int monkey_inspections[MAX_MONKEYS], int modulo, int monkey_op_code[MAX_MONKEYS], int op_rhs, int true_dest, int false_dest) {
    int num_shifts = 0;
    for (int i = 0; i < MONKEY_CAPACITY; i++) {
        unsigned long long worry = monkey_stuff[monkey][i];
        if (!worry) {
            break;
        }

        worry = operation(worry, monkey_op_code[monkey], op_rhs);
        worry %= mod_divisor;

        if (worry % modulo == 0) {
            int index = get_next_index(monkey_stuff[true_dest]);
            monkey_stuff[true_dest][index] = worry;
        } else {
            int index = get_next_index(monkey_stuff[false_dest]);
            monkey_stuff[false_dest][index] = worry;
        }
        num_shifts++;
    }
    for (int i = 0; i < num_shifts; i++) {
        lshift_stuff(monkey_stuff[monkey]);
    }
    monkey_inspections[monkey] += num_shifts;
}

void monkey_turn(int monkey, unsigned long long monkey_stuff[MAX_MONKEYS][MONKEY_CAPACITY], int monkey_inspections[MAX_MONKEYS], int modulo, int op_code, int op_rhs, int true_dest, int false_dest) {
    int num_shifts = 0;
    for (int i = 0; i < MONKEY_CAPACITY; i++) {
        unsigned long long worry = monkey_stuff[monkey][i];
        if (!worry) {
            break;
        }
        worry = operation(worry, op_code, op_rhs);
        worry /= 3;
        if (worry % modulo == 0) {
            int index = get_next_index(monkey_stuff[true_dest]);
            monkey_stuff[true_dest][index] = worry;
        } else {
            int index = get_next_index(monkey_stuff[false_dest]);
            monkey_stuff[false_dest][index] = worry;
        }
        num_shifts++;
    }
    for (int i = 0; i < num_shifts; i++) {
        lshift_stuff(monkey_stuff[monkey]);
    }
    monkey_inspections[monkey] += num_shifts;
}

int main() {

    unsigned long long init_monkey_stuff[MAX_MONKEYS][MONKEY_CAPACITY] = {0};
    unsigned long long monkey_stuff[MAX_MONKEYS][MONKEY_CAPACITY] = {0};
    int monkey_inspections[MAX_MONKEYS] = {0};
    int monkey_modulo[MAX_MONKEYS] = {0};
    int monkey_op_code[MAX_MONKEYS] = {0};
    int monkey_op_rhs[MAX_MONKEYS] = {0};
    int true_dest[MAX_MONKEYS] = {0};
    int false_dest[MAX_MONKEYS] = {0};

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];

    int monkey = 0;
    while (1) {
        memset(buffer, 0, SIZE);
        char* out = fgets(buffer, SIZE, (FILE*)input);
        if (!out) {
            break;
        }

        // Monkey num
        monkey = 0;
        int num_i = get_first_num_pos(buffer);
        get_num(buffer, &num_i, &monkey);
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);

        // Starting items
        int item = 0;
        int i = 0;
        int item_i = get_first_num_pos(buffer);
        int next_valid = 1;
        while (next_valid) {
            next_valid = get_num(buffer, &item_i, &item);
            init_monkey_stuff[monkey][i++] = item;
        }
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);

        // Operation
        int op_i = get_first_op_pos(buffer);
        if (op_i == -1) {
            printf("Error: Failed to extract operation");
            return 1;
        } else if (buffer[op_i] == '*') {
            monkey_op_code[monkey] = 0;
        } else if (buffer[op_i] == '+') {
            monkey_op_code[monkey] = 1;
        } else {
            printf("Error: Unknown operation %c", buffer[op_i]);
            return 1;
        }
        int monkey_mod = 0;
        int mod_i = get_first_num_pos(buffer);
        if (mod_i == -1) {
            monkey_op_rhs[monkey] = -1;
        } else {
            get_num(buffer, &mod_i, &monkey_mod);
            monkey_op_rhs[monkey] = monkey_mod;
        }
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);

        // Test
        int monkey_test = 0;
        int test_i = get_first_num_pos(buffer);
        get_num(buffer, &test_i, &monkey_test);
        monkey_modulo[monkey] = monkey_test;
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);

        // True destination
        int monkey_true = 0;
        int true_i = get_first_num_pos(buffer);
        get_num(buffer, &true_i, &monkey_true);
        true_dest[monkey] = monkey_true;
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);

        // False destination
        int monkey_false = 0;
        int false_i = get_first_num_pos(buffer);
        get_num(buffer, &false_i, &monkey_false);
        false_dest[monkey] = monkey_false;
        memset(buffer, 0, SIZE);
        out = fgets(buffer, SIZE, (FILE*)input);
    }

    memcpy(monkey_stuff, init_monkey_stuff, MAX_MONKEYS*MONKEY_CAPACITY*sizeof(unsigned long long));
    for (int i = 0; i < NUM_TURNS; i++) {
        for (int m = 0; m <= monkey; m++) {
            monkey_turn(m, monkey_stuff, monkey_inspections, monkey_modulo[m], monkey_op_code[m], monkey_op_rhs[m], true_dest[m], false_dest[m]);
        }
    }
    unsigned long long first = 0;
    unsigned long long second = 0;
    for (int m = 0; m <= monkey; m++) {
        int inspects = monkey_inspections[m];
        if (inspects > second) {
            if (inspects > first) {
                second = first;
                first = inspects;
            } else {
                second = inspects;
            }
        }
    }
    printf("Monkey business after %d turns is: %llu", NUM_TURNS, first * second);

    // Compute the greatest common divisor
    unsigned long long common_divisor = 1;
    for (int i = 0; i <= monkey; i++) {
        common_divisor *= monkey_modulo[i];
    }
    memcpy(monkey_stuff, init_monkey_stuff, MAX_MONKEYS*MONKEY_CAPACITY*sizeof(unsigned long long));
    memset(monkey_inspections, 0, MAX_MONKEYS*sizeof(int));
    for (int i = 0; i < NUM_MOD_TURNS; i++) {
        for (int m = 0; m <= monkey; m++) {
            monkey_turn_mod_divisor(common_divisor, m, monkey_stuff, monkey_inspections, monkey_modulo[m], monkey_op_code, monkey_op_rhs[m], true_dest[m], false_dest[m]);
        }
    }
    first = 0;
    second = 0;
    for (int m = 0; m <= monkey; m++) {
        int inspects = monkey_inspections[m];
        if (inspects > second) {
            if (inspects > first) {
                second = first;
                first = inspects;
            } else {
                second = inspects;
            }
        }
    }
    printf("\nMonkey business after %d turns (without reduction) is: %llu", NUM_MOD_TURNS, first * second);

    return 0;
}
