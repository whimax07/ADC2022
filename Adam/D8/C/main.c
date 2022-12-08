#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

#define SIZE 255

int scenic_score(const int matrix[SIZE][SIZE], int row, int column, int num_rows, int num_columns, int* visible)
{
    if (row == 0 || row == num_rows - 1 || column == 0 || column == num_columns - 1) {
        *visible = 1;
        return 0;
    }

    int l_score = 0;
    int r_score = 0;
    int u_score = 0;
    int d_score = 0;
    int blocked = 0;
    int height = matrix[row][column];
    for (int r = row - 1; r >= 0; r--) {
        l_score++;
        if (matrix[r][column] >= height) {
            blocked++;
            break;
        }
    }
    for (int r = row + 1; r < num_rows; r++) {
        r_score++;
        if (matrix[r][column] >= height) {
            blocked++;
            break;
        }
    }
    for (int c = column - 1; c >= 0; c--) {
        u_score++;
        if (matrix[row][c] >= height) {
            blocked++;
            break;
        }
    }
    for (int c = column + 1; c < num_rows; c++) {
        d_score++;
        if (matrix[row][c] >= height) {
            blocked++;
            break;
        }
    }

    *visible = blocked < 4;
    return l_score * r_score * u_score * d_score;
}

int main() {

    int matrix[SIZE][SIZE] = {0};

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

    // Find the spot with the highest score
    int highest_score = 0;
    int num_trees_visible = 0;
    for (int r = 0; r < num_rows; r++) {
        for (int c = 0; c < num_columns; c++) {
            int v = 0;
            int score = scenic_score(matrix, r, c, num_rows, num_columns, &v);
            if (score > highest_score) {
                highest_score = score;
            }
            num_trees_visible += v;
        }
    }
    printf("\nTotal number of visible trees: %d", num_trees_visible);
    printf("\nMost scenic spot(s) score: %d", highest_score);

    return 0;
}
