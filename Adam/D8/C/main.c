#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

#define SIZE 255

int is_visible(const int height, int* max_height, int* visible)
{
    if (height > *max_height || *max_height == 0) {
        *max_height = height;
        if (*visible == 0) {
            *visible = 1;
            return 1;
        }
    }
    return 0;
}

int scenic_score(const int matrix[SIZE][SIZE], int row, int column, int num_rows, int num_columns)
{
    int l_score = 0;
    int r_score = 0;
    int u_score = 0;
    int d_score = 0;
    int height = matrix[row][column];
    for (int r = row - 1; r >= 0; r--) {
        l_score++;
        if (matrix[r][column] >= height) {
            break;
        }
    }
    for (int r = row + 1; r < num_rows; r++) {
        r_score++;
        if (matrix[r][column] >= height) {
            break;
        }
    }
    for (int c = column - 1; c >= 0; c--) {
        u_score++;
        if (matrix[row][c] >= height) {
            break;
        }
    }
    for (int c = column + 1; c < num_rows; c++) {
        d_score++;
        if (matrix[row][c] >= height) {
            break;
        }
    }
    return l_score * r_score * u_score * d_score;
}

int main() {

    int matrix[SIZE][SIZE] = {0};
    int visible[SIZE][SIZE] = {0};

    // Parse matrix definition
    int num_rows = 0;
    int num_columns = 0;

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
        num_columns = 0;
        for (int i = 0; i < SIZE; i++) {
            if (buffer[i] == 0 || buffer[i] == '\n') {
                break;
            }
            matrix[num_rows][num_columns++] = (buffer[i] - '0') + 1;
        }
        num_rows++;
    }

    // zero-effort iter over rows/columns
    int num_trees_visible = 0;
    int max_height;
    for (int row = 0; row < num_rows; row++) {
        max_height = 0;
        for (int column = num_columns-1; column >= 0; column--) {
            num_trees_visible += is_visible(matrix[row][column], &max_height, &visible[row][column]);
        }
        max_height = 0;
        for (int column = 0; column < num_columns; column++) {
            num_trees_visible += is_visible(matrix[row][column], &max_height, &visible[row][column]);
        }
    }
    for (int column = 0; column < num_columns; column++) {
        max_height = 0;
        for (int row = num_rows-1; row >= 0; row--) {
            num_trees_visible += is_visible(matrix[row][column], &max_height, &visible[row][column]);
        }
        max_height = 0;
        for (int row = 0; row < num_rows; row++) {
            num_trees_visible += is_visible(matrix[row][column], &max_height, &visible[row][column]);
        }
    }

    printf("Total number of visible trees: %d", num_trees_visible);

    // Find the spot with the highest score
    int highest_score = 0;
    for (int r = 0; r < num_rows; r++) {
        for (int c = 0; c < num_columns; c++) {
            int score = scenic_score(matrix, r, c, num_rows, num_columns);
            if (score > highest_score) {
                highest_score = score;
            }
        }
    }
    printf("\nMost scenic spot(s) score: %d", highest_score);

    return 0;
}
