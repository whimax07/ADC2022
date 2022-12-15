def get_delta(p1, p2):
    if p1 > p2:
        return -1
    if p2 > p1:
        return 1
    return 0


def at_rest(matrix, x, y, max_depth):
    while True:
        y += 1
        if matrix.get((x, y), None):
            if not matrix.get((x-1, y), None):
                x -= 1
            elif not matrix.get((x+1, y), None):
                x += 1
            else:
                return False, x, y - 1
        else:
            if y > max_depth:
                return True, 0, 0


if __name__ == '__main__':
    m = dict()
    max_depth = 0
    with open('input.txt', 'r') as f:
        coordinates = [s for s in [l.replace(',', ' ').replace(' -> ', ' ').split() for l in f.readlines()]]
        for l in coordinates:
            line_x = [int(i) for i in l[0::2]]
            line_y = [int(i) for i in l[1::2]]

            max_depth = max(max_depth, max(line_y))

            for i in range(len(line_x)-1):
                x, y = line_x[i], line_y[i]
                nx, ny = line_x[i+1], line_y[i+1]
                while x != nx or y != ny:
                    m[(x, y)] = 1
                    x += get_delta(x, nx)
                    y += get_delta(y, ny)
                m[(x, y)] = 1

    i = 0
    while True:
        done, x, y = at_rest(m, 500, 0, max_depth)
        if done:
            break
        m[(x, y)] = 1
        i += 1
    print('{} particles'.format(i))
