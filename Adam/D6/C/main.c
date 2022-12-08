#include <stdio.h>
#include <memory.h>

#define PACKETSIZE 14
#define SIZE 4096

int contains(const char container[PACKETSIZE], int start)
{
    for (int i = start + 1; i < PACKETSIZE; i++) {
        if (container[i] == container[start]) {
            return 1;
        }
    }
    return 0;
}

int allUnique(const char container[PACKETSIZE])
{
    for (int i = 0; i < PACKETSIZE - 1; i++) {
        if (contains(container, i)) {
            return 0;
        }
    }
    return 1;
}

void lshift(char history[PACKETSIZE], char c)
{
    for (int i = 1; i < PACKETSIZE; i++) {
        history[i-1] = history[i];
    }
    history[PACKETSIZE-1] = c;
}

int main() {

    FILE* input = fopen("../input.txt", "r");
    if (!input)
        return 1;
    char buffer[SIZE];
    char history[PACKETSIZE];
    int results[SIZE];
    int resultsIndex = 0;
    int index = 0;

    while (1) {
        memset(buffer, 0, SIZE);
        memset(history, 0, PACKETSIZE);
        char* out = fgets(buffer, SIZE, (FILE*)input);
        if (!out) {
            break;
        }
        while (1) {
            if (index > PACKETSIZE) {
                if (allUnique(history)) {
                    results[resultsIndex++] = index;
                    index = 0;
                    break;
                }
            }
            lshift(history, buffer[index]);
            index++;
        }
    }

    for (int i = 0; i < resultsIndex; i++) {
        printf( "%d ", results[i]);
    }

    return 0;
}
