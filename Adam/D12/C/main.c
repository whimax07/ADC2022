#include <stdio.h>
#include <memory.h>

#define SIZE 128

int m_index(int row, int column, int num_columns)
{
    return (row * num_columns) + column + 1;
}

int is_valid_path(const int matrix[SIZE][SIZE], int num_rows, int num_columns, int r1, int c1, int r2, int c2)
{
    if (r1 < 0 || c1 < 0 || r2 < 0 || c2 < 0) {
        return 0;
    }
    if (r1 == num_rows || c1 == num_columns || r2 == num_rows || c2 == num_columns) {
        return 0;
    }
    if (matrix[r1][c1] + 1 >= matrix[r2][c2]) {
        return 1;
    }
    return 0;
}

int array_empty(const int arr[SIZE*SIZE])
{
    for (int i = 0; i < SIZE*SIZE; i++) {
        if (arr[i] != 0) {
            return 0;
        }
    }
    return 1;
}

void dijkstra_shortest_path(const int graph[SIZE*SIZE][4], int path[SIZE*SIZE], int dist[SIZE*SIZE], int start, int num_nodes)
{
    int all_visited[SIZE*SIZE] = {0};
    for (int i = 1; i <= num_nodes; i++) {
        dist[i] = -1;
        path[i] = -1;
    }

    int curr = start;
    dist[curr] = 0;
    int curr_visited[SIZE*SIZE] = {0};
    while (1) {
        all_visited[curr] = 1;
        for (int i = 0; i < 4; i++) {
            int succ = graph[curr][i];
            if (succ == 0) {
                break;
            }
            if (all_visited[succ]) {
                continue;
            }
            curr_visited[succ] = 1;
            int path_len = dist[curr] + 1;
            if (path_len == -1) {
                continue;
            }
            if (dist[succ] == -1 || path_len < dist[succ]) {
                dist[succ] = path_len;
                path[succ] = curr;
            }
        }
        curr_visited[curr] = 0;
        if (array_empty(curr_visited)) {
            break;
        }
        int min_dist = -1;
        int min_dist_node = 0;
        for (int i = 1; i <= num_nodes; i++) {
            if (curr_visited[i] == 0) {
                continue;
            }
            if (dist[i] == -1) {
                continue;
            }
            if (min_dist == -1 || dist[i] < min_dist) {
                min_dist = dist[i];
                min_dist_node = i;
            }
        }
        curr = min_dist_node;
    }
}

int main() {

    int matrix[SIZE][SIZE] = {0};
    int graph[SIZE*SIZE][4] = {0};

    // Parse matrix definition
    int num_rows = 0;
    int num_columns = 0;
    int start_row = 0;
    int start_column = 0;
    int end_row = 0;
    int end_column = 0;
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
            char c = buffer[i];
            if (c == 0 || c == '\n') {
                break;
            }
            matrix[num_rows][num_columns] = c - 'a';
            if (c == 'S') {
                matrix[num_rows][num_columns] = 'z' - 'a' + 1;
                start_column = num_columns;
                start_row = num_rows;
            } else if (c == 'E') {
                matrix[num_rows][num_columns] = 0;
                end_column = num_columns;
                end_row = num_rows;
            }
            num_columns++;
        }
        num_rows++;
    }

    // Height of the end point must be >= surrounding maxima
    if (is_valid_path(matrix, num_rows, num_columns, end_row-1, end_column, end_row, end_column))
        matrix[end_row][end_column] = matrix[end_row-1][end_column];
    if (is_valid_path(matrix, num_rows, num_columns, end_row+1, end_column, end_row, end_column))
        matrix[end_row][end_column] = matrix[end_row+1][end_column];
    if (is_valid_path(matrix, num_rows, num_columns, end_row, end_column-1, end_row, end_column))
        matrix[end_row][end_column] = matrix[end_row][end_column-1];
    if (is_valid_path(matrix, num_rows, num_columns, end_row, end_column+1, end_row, end_column))
        matrix[end_row][end_column] = matrix[end_row][end_column+1];

    // Build the graph
    int matrix_i = 1;
    for (int r = 0; r < num_rows; r++) {
        for (int c = 0; c < num_columns; c++) {
            int i = 0;
            if (is_valid_path(matrix, num_rows, num_columns, r, c, r-1, c)) {
                graph[matrix_i][i++] = m_index(r - 1, c, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r, c, r+1, c)) {
                graph[matrix_i][i++] = m_index(r + 1, c, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r, c, r, c-1)) {
                graph[matrix_i][i++] = m_index(r, c - 1, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r, c, r, c+1)) {
                graph[matrix_i][i++] = m_index(r, c + 1, num_columns);
            }
            matrix_i++;
        }
    }

    int path[SIZE*SIZE] = {0};
    int dist[SIZE*SIZE] = {0};
    dijkstra_shortest_path(graph, path, dist, m_index(start_row, start_column, num_columns), num_rows * num_columns);

    printf("Shortest path from (%d, %d) to (%d, %d) has length: %d", start_column, start_row, end_column, end_row, dist[m_index(end_row, end_column, num_columns)]);

    // Build the inverse graph
    memset(graph, 0, SIZE*SIZE*4*sizeof(int));
    for (int r = 0; r < num_rows; r++) {
        for (int c = 0; c < num_columns; c++) {
            int i = 0;
            if (is_valid_path(matrix, num_rows, num_columns, r-1, c, r, c)) {
                graph[m_index(r, c, num_columns)][i++] = m_index(r-1, c, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r+1, c, r, c)) {
                graph[m_index(r, c, num_columns)][i++] = m_index(r+1, c, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r, c-1, r, c)) {
                graph[m_index(r, c, num_columns)][i++] = m_index(r, c-1, num_columns);
            }
            if (is_valid_path(matrix, num_rows, num_columns, r, c+1, r, c)) {
                graph[m_index(r, c, num_columns)][i++] = m_index(r, c+1, num_columns);
            }
        }
    }
    memset(path, 0, SIZE*SIZE*sizeof(int));
    memset(dist, 0, SIZE*SIZE*sizeof(int));
    dijkstra_shortest_path(graph, path, dist, m_index(end_row, end_column, num_columns), num_rows * num_columns);

    int min_dist_a = -1;
    int i = 1;
    for (int r = 0; r < num_rows; r++) {
        for (int c = 0; c < num_columns; c++) {
            if (matrix[r][c] == 0) {
                if ((min_dist_a == -1 || dist[i] < min_dist_a) && dist[i] != -1) {
                    min_dist_a = dist[i];
                }
            }
            i++;
        }
    }
    printf("\nShortest path from (%d, %d) to point with zero elevation has length: %d", end_column, end_row, min_dist_a);

    return 0;
}
