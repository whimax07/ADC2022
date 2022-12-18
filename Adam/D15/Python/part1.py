import re


def manhattan(p1, p2):
    return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])


if __name__ == '__main__':
    with open('input.txt', 'r') as f:
        min_dists = dict()
        beacons = set()
        lines = [l for l in f.readlines()]
        for l in lines:
            m = re.search(r"x=(-?\d+).+y=(-?\d+).+x=(-?\d+).+y=(-?\d+)", l)
            sx, sy = int(m.group(1)), int(m.group(2))
            bx, by = int(m.group(3)), int(m.group(4))
            min_dists[(sx, sy)] = manhattan((sx, sy), (bx, by))
            beacons |= {(bx, by)}

        # Find the sensor closest to the desired row
        y = 2000000
        deltas = []
        for s, d in min_dists.items():
            delta = d - abs(y - s[1])
            if delta < 0:
                continue
            deltas.append((s[0] - delta, s[0] + delta))

        deltas = sorted(deltas, key=lambda t: t[0])
        x = deltas[0][0]
        sum_x = 0
        for x1, x2 in deltas:
            if x1 > x:
                sum_x += x2 - x1
                x = x2
            elif x2 > x:
                sum_x += x2 - x
                x = x2

    print("There are a total of {} points along row {} which cannot have beacon".format(sum_x, y))
