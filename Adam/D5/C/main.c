#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

#define SIZE 255
#define CRANE 9000

int getNextInt(const char buffer[SIZE], int* i)
{
    int j = 0;
    char s[SIZE];
    memset(s, 0, SIZE);
    while (buffer[*i] != ' ' && buffer[*i] != 0) {
        s[j++] = buffer[*i];
        *i = *i + 1;
    }
    return atoi(s);
}

int getActiveIndex(const char column[SIZE])
{
    int index = 0;
    while (column[index] == 0) {
        index++;
    }
    return index;
}

int getFloorIndex(const char column[SIZE])
{
    int index = 0;
    while (column[index] != '1' && index < SIZE) {
        index++;
    }
    return index;
}

void shiftMatrix(char matrix[SIZE][SIZE])
{
    // 100% legit method no judging please
    for (int i = 0; i < SIZE; i++) {
        int floorIndex = getFloorIndex(matrix[i]);
        if (floorIndex == SIZE) {
            // Done for all active columns
            break;
        }
        if (floorIndex == SIZE-1) {
            printf("Error: Matrix size allocation exceeded!");
            exit(1);
        }
        for (int j = floorIndex+1; j > 0; j--) {
            matrix[i][j] = matrix[i][j-1];
        }
        matrix[i][0] = 0;
    }
}

void moveBox(char matrix[SIZE][SIZE], int to, int from)
{
    int fromActiveIndex = getActiveIndex(matrix[from]);
    int toActiveIndex = getActiveIndex(matrix[to]);

    if (toActiveIndex == 0) {
        shiftMatrix(matrix);
        fromActiveIndex++;
        toActiveIndex++;
    }

    matrix[to][toActiveIndex-1] = matrix[from][fromActiveIndex];
    matrix[from][fromActiveIndex] = 0;
}

void moveBoxes(char matrix[SIZE][SIZE], int to, int from, int numBoxes)
{
    int fromActiveIndex = getActiveIndex(matrix[from]);
    int toActiveIndex = getActiveIndex(matrix[to]);

    while (toActiveIndex - numBoxes < 0) {
        shiftMatrix(matrix);
        fromActiveIndex++;
        toActiveIndex++;
    }

    for (int i = numBoxes; i > 0; i--) {
        matrix[to][toActiveIndex-1] = matrix[from][fromActiveIndex+i-1];
        matrix[from][fromActiveIndex+i-1] = 0;
        toActiveIndex--;
    }
}

int getMatrixRow(const char buffer[SIZE], char row[SIZE])
{
    memset(row, 0, SIZE);
    int i = 1;
    while (buffer[i] != 0) {
        if (buffer[i] == ' ') {
            row[i >> 2] = 0;
        } else {
            row[i >> 2] = buffer[i];
        }
        i += 4;
    }
    return i >> 2;
}

void performInstruction(const char buffer[SIZE], char matrix[SIZE][SIZE])
{
    int i = 5;
    int numMoves = getNextInt(buffer, &i);
    i += 6;
    if (numMoves == 31) {
        int f= 0;
    }
    int from = getNextInt(buffer, &i) - 1;
    i += 4;
    int to = getNextInt(buffer, &i) - 1;

    //for (int k = 0; k < numMoves; k++) {
    //    moveBox(matrix, to, from);
    //}
    moveBoxes(matrix, to, from, numMoves);

}

int main() {

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];

    char matrix[SIZE][SIZE];
    char curr_row[SIZE];
    int column = 0;
    int maxColumns = 0;
    int row = 0;

    // Parse the matrix definition
    memset(buffer, 0, SIZE);
    fgets(buffer, 255, (FILE*)input);
    while (buffer[1] != '1') {
        int numColumns = getMatrixRow(buffer, curr_row);
        if (numColumns > maxColumns) {
            maxColumns = numColumns;
        }
        for (column = 0; column < numColumns; column++) {
            matrix[column][row] = curr_row[column];
        }
        row++;
        memset(buffer, 0, SIZE);
        fgets(buffer, 255, (FILE*)input);
    }

    // Insert a 'floor' for the matrix
    for (column = 0; column < maxColumns; column++) {
        matrix[column][row] = '1';
    }

    // Parse and perform the move instructions
    memset(buffer, 0, SIZE);
    fgets(buffer, 255, (FILE*)input);
    while (buffer[0] != 0) {
        memset(buffer, 0, SIZE);
        char* c = fgets(buffer, 255, (FILE*)input);
        if (!c) {
            break;
        }
        performInstruction(buffer, matrix);
    }

    // Results
    char results[SIZE];
    int i = 0;
    for (int j = 0; j < maxColumns; j++) {
        char c = matrix[j][getActiveIndex(matrix[j])];
        if (c != '1') {
            results[i++] = c;
        }
    }

    printf( "Result: %s ", results);

    return 0;
}
