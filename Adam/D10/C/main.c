#include <stdio.h>
#include <memory.h>

#define SIZE 255
#define SPRITE_WIDTH 3
#define SCREEN_WIDTH 40

void check_cycle_count(int cycle, int reg, int* sum)
{
    if (cycle < 20) {
        return;
    }
    if (cycle == 20 || (cycle - 20) % 40 == 0) {
        *sum = *sum + (cycle * reg);
        //printf("\nReg value on cycle %d is: %d", cycle, reg);
    }
}

int is_sprite_visible(int reg, int row_pixel)
{
    for (int i = 0; i < SPRITE_WIDTH; i++) {
        if (row_pixel == reg + i) {
            return 1;
        }
    }
    return 0;
}

void draw_to_display(int reg, int* row_pixel)
{
    if (is_sprite_visible(reg, *row_pixel)) {
        printf("#");
    } else {
        printf(".");
    }
    if (*row_pixel == SCREEN_WIDTH) {
        *row_pixel = 1;
        printf("\n");
    } else {
        *row_pixel = *row_pixel + 1;
    }
}

int get_next_num(const char s[SIZE], int start)
{
    int i = 0;
    char out[SIZE];
    memset(out, 0, SIZE);
    for (int j = start; j < SIZE; j++) {
        if (s[j] == 0 || s[j] == ' ' || s[j] == '\n') {
            break;
        }
        out[i++] = s[j];
    }
    int num = 0;
    sscanf(out, "%d", &num);
    return num;
}

void parse_command(const char buffer[SIZE], int* reg, int* cycle, int* sum, int* row_pixel)
{
    *cycle = *cycle + 1;
    draw_to_display(*reg, row_pixel);

    // Parse noop
    if (buffer[0] != 'n') {
        int delta = get_next_num(buffer, 5);
        draw_to_display(*reg, row_pixel);
        check_cycle_count(*cycle, *reg, sum);
        *reg = *reg + delta;
        *cycle = *cycle + 1;
    }
    check_cycle_count(*cycle, *reg, sum);
}

int main() {

    int reg = 1;
    int cycle = 1;
    int sum = 0;
    int row_pixel = 1;

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];

    printf("\nDisplay:\n");
    while (1) {
        memset(buffer, 0, SIZE);
        char* out = fgets(buffer, SIZE, (FILE*)input);
        if (!out) {
            break;
        }
        parse_command(buffer, &reg, &cycle, &sum, &row_pixel);
    }

    printf("\nSum of signal values is: %d", sum);

    return 0;
}
