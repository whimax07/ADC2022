#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

#define SIZE 255
#define HISTORY_SIZE 16384
#define NUM_KNOTS 10

void record_tail_position(unsigned long long history[HISTORY_SIZE], int* index, int t_x, int t_y)
{
    unsigned long long t_x_ll = t_x & 0x00000000FFFFFFFF;
    unsigned long long t_y_ll = ((unsigned long long)t_y << 32) & 0xFFFFFFFF00000000;
    unsigned long long pos = t_x_ll | t_y_ll;
    for (int i = 0; i < *index; i++)
    {
        if (history[i] == pos) {
            return;
        }
    }
    history[*index] = pos;
    *index = *index + 1;
    if (*index >= HISTORY_SIZE) {
        printf("Error: Exceeded size limit of history!");
        exit(1);
    }
}

int is_touching(const int h_x, const int h_y, const int t_x, const int t_y)
{
    if (abs(h_x - t_x) < 2 && abs(h_y - t_y) < 2) {
        return 1;
    }
    return 0;
}

void update_head_position(int* h_x, int* h_y, int delta_x, int delta_y)
{
    *h_x = *h_x + delta_x;
    *h_y = *h_y + delta_y;
}

void update_tail_position(const int h_x, const int h_y, int* t_x, int* t_y)
{
    int x_delta = h_x - *t_x;
    int y_delta = h_y - *t_y;

    if (x_delta == 0 || y_delta == 0) {
        *t_x = *t_x + (x_delta / 2);
        *t_y = *t_y + (y_delta / 2);
        return;
    }
    if (x_delta > 0) {
        *t_x = *t_x + 1;
    } else {
        *t_x = *t_x - 1;
    }
    if (y_delta > 0) {
        *t_y = *t_y + 1;
    } else {
        *t_y = *t_y - 1;
    }
}

int get_next_int(const char s[SIZE], int start)
{
    int i = 0;
    char buf[SIZE] = {0};
    for (int j = start; j < SIZE; j++) {
        if (s[j] == 0 || s[j] == ' ' || s[j] == '\n') {
            break;
        }
        buf[i++] = s[j];
    }
    int num;
    sscanf(buf, "%d", &num);
    return num;
}

void parse_command(const char buffer[SIZE], unsigned long long history[HISTORY_SIZE], int* history_index, int knots_x[NUM_KNOTS], int knots_y[NUM_KNOTS])
{
    char direction = buffer[0];
    int x_move = 0;
    int y_move = 0;
    if (direction == 'U') {
        y_move = -1;
    }
    else if (direction == 'L') {
        x_move = -1;
    }
    else if (direction == 'R') {
        x_move = 1;
    }
    else if (direction == 'D') {
        y_move = 1;
    }
    int num_moves = get_next_int(buffer, 2);
    for (int i = 0; i < num_moves; i++) {
        update_head_position(&knots_x[0], &knots_y[0], x_move, y_move);
        for (int j = 1; j < NUM_KNOTS; j++) {
            if (!is_touching(knots_x[j-1], knots_y[j-1], knots_x[j], knots_y[j])) {
                update_tail_position(knots_x[j-1], knots_y[j-1], &knots_x[j], &knots_y[j]);
                if (j == NUM_KNOTS - 1) {
                    record_tail_position(history, history_index, knots_x[j], knots_y[j]);
                }
            }
        }
    }
}

int main() {

    unsigned long long history[HISTORY_SIZE] = {0};
    int history_index = 1;

    int knots_x[NUM_KNOTS] = {0};
    int knots_y[NUM_KNOTS] = {0};

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];
    while (1) {
        memset(buffer, 0, SIZE);
        char* out = fgets(buffer, SIZE, (FILE*)input);
        if (!out) {
            break;
        }
        parse_command(buffer, history, &history_index, knots_x, knots_y);
    }

    printf("\nNumber of locations visited by tail: %d", history_index);

    return 0;
}
