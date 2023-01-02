from enum import IntEnum


class Direction(IntEnum):
    N = 3
    E = 0
    S = 1
    W = 2


class Point(IntEnum):
    Empty = 1
    Wall = 2


class Navigator:
    def __init__(self):
        self.points = dict()
        self.direction = Direction.E
        self.x = 0
        self.y = 0
        self.max_x = 0
        self.max_y = 0

    def add_point(self, x: int, y: int, c: str):
        if c == '.':
            self.points[(x, y)] = Point.Empty
        elif c == '#':
            self.points[(x, y)] = Point.Wall
        else:
            raise ValueError('Invalid tile char: {}'.format(c))

        self.max_x = max(self.max_x, x)
        self.max_y = max(self.max_y, y)
        if not self.x and not self.y:
            self.x = x
            self.y = y

    def move(self, dist: int):
        x_delta = 0
        y_delta = 0
        if self.direction == Direction.N:
            y_delta = -1
        elif self.direction == Direction.E:
            x_delta = 1
        elif self.direction == Direction.S:
            y_delta = 1
        elif self.direction == Direction.W:
            x_delta = -1
        else:
            raise ValueError('Invalid direction: {}'.format(self.direction))

        for _ in range(dist):
            self.x += x_delta
            self.y += y_delta
            if not self.points.get((self.x, self.y)):
                old_x = self.x - x_delta
                old_y = self.y - y_delta
                self.wraparound()
                if self.points[(self.x, self.y)] == Point.Wall:
                    self.x = old_x
                    self.y = old_y
                    return
            elif self.points[(self.x, self.y)] == Point.Wall:
                self.x -= x_delta
                self.y -= y_delta
                return

    def wraparound(self):
        if self.direction == Direction.N:
            self.y = self.max_y
            while not self.points.get((self.x, self.y)):
                self.y -= 1
        elif self.direction == Direction.E:
            self.x = 1
            while not self.points.get((self.x, self.y)):
                self.x += 1
        elif self.direction == Direction.S:
            self.y = 1
            while not self.points.get((self.x, self.y)):
                self.y += 1
        elif self.direction == Direction.W:
            self.x = self.max_x
            while not self.points.get((self.x, self.y)):
                self.x -= 1

    def turn(self, direction: str):
        if direction == 'L':
            self.direction -= 1
            if self.direction == -1:
                self.direction = Direction.N
        elif direction == 'R':
            self.direction += 1
            if self.direction == 4:
                self.direction = Direction.E
        else:
            raise ValueError('Invalid turn: {}'.format(direction))

    def get_password(self):
        return (self.y * 1000) + (self.x * 4) + self.direction


if __name__ == '__main__':
    nav = Navigator()
    commands = list()
    max_width = 0
    with open('input.txt', 'r') as f:
        x = 0
        y = 0
        lines = f.readlines()

        empty_index = lines.index('\n')

        for line in lines[:empty_index]:
            y += 1
            if line == '':
                break
            for c in line:
                x += 1
                if c != ' ' and c != '\n':
                    nav.add_point(x, y, c)
            if x > max_width:
                max_width = x
            x = 0

        # Commands
        for line in lines[empty_index+1:]:
            line = line.replace('L', ' L ').replace('R', ' R ').split()
            for c in line:
                commands.append(c)

    print(commands)
    print('X: {} Y: {} D: {}'.format(nav.x, nav.y, nav.direction))

    is_dist = False
    for c in commands:
        is_dist = not is_dist
        if is_dist:
            nav.move(int(c))
        else:
            nav.turn(c)
        print('{} X: {} Y: {} D: {}'.format(c, nav.x, nav.y, nav.direction))

    print('Password: {}'.format(nav.get_password()))
