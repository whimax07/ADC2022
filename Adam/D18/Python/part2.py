from tqdm import tqdm
import numpy as np


def insert_ignore_bounds(d3array: np.array, x: int, y: int, z: int, val: int):
    try:
        if d3array[x][y][z] == 0:
            d3array[x][y][z] = val
    except IndexError:
        pass


def propagate(d3array: np.array, x: int, y: int, z: int, val: int):
    insert_ignore_bounds(d3array, x-1, y,   z,   val)
    insert_ignore_bounds(d3array, x+1, y,   z,   val)
    insert_ignore_bounds(d3array, x,   y-1, z,   val)
    insert_ignore_bounds(d3array, x,   y+1, z,   val)
    insert_ignore_bounds(d3array, x,   y,   z-1, val)
    insert_ignore_bounds(d3array, x,   y,   z+1, val)


def get_first_unchecked_block(d3array: np.array):
    for i in range(len(d3array[:][0][0])):
        for j in range(len(d3array[0][:][0])):
            for k in range(len(d3array[0][0][:])):
                if d3array[i][j][k] == 0:
                    return i, j, k
    return None


if __name__ == '__main__':
    x = list()
    y = list()
    z = list()
    with open('input.txt', 'r') as f:
        for line in f.readlines():
            vals = line.replace(',', ' ').split()
            x.append(int(vals[0]))
            y.append(int(vals[1]))
            z.append(int(vals[2]))

    num_cubes = len(x)

    max_dim = max(max(x), max(y), max(z)) + 1
    m = np.zeros((max_dim, max_dim, max_dim))
    done = np.zeros((max_dim, max_dim, max_dim))

    # Occupied blocks have unique community
    community = 1
    for i in range(num_cubes):
        m[x[i]][y[i]][z[i]] = community

    # Propagate communities until no more changes can be made
    next_unchecked = get_first_unchecked_block(m)  # Assume the point at (0, 0, 0) is external to the drop
    while next_unchecked:
        community += 1
        m[next_unchecked] = community
        while True:
            changed = False
            for i in range(max_dim):
                for j in range(max_dim):
                    for k in range(max_dim):
                        if done[i][j][k]:
                            continue
                        if m[i][j][k] == community:
                            propagate(m, i, j, k, community)
                            done[i][j][k] = 1
                            changed = True
            if not changed:
                break
        next_unchecked = get_first_unchecked_block(m)

    # Add blocks to the enclosed areas
    for i in range(max_dim):
        for j in range(max_dim):
            for k in range(max_dim):
                if m[i][j][k] > 2:
                    x.append(i)
                    y.append(j)
                    z.append(k)

    # Perform same surface area computation as part 1
    num_cubes = len(x)
    surface_area = 6
    for i in tqdm(range(1, num_cubes)):
        surface_area += 6
        for j in range(i):
            d_x = abs(x[i] - x[j])
            d_y = abs(y[i] - y[j])
            d_z = abs(z[i] - z[j])
            if d_x + d_y + d_z == 1:
                surface_area -= 2

    print('Total surface area is: {}'.format(surface_area))
