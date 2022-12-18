from tqdm import tqdm


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
