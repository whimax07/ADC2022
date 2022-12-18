SHAPES = {'H_LINE': [(0, 0), (1, 0), (2, 0), (3, 0)],
          'CROSS': [(1, 0), (1, -1), (1, -2), (0, -1), (2, -1)],
          'L': [(0, 0), (1, 0), (2, 0), (2, -1), (2, -2)],
          'V_LINE': [(0, 0), (0, -1), (0, -2), (0, -3)],
          'SQUARE': [(0, 0), (0, -1), (1, 0), (1, -1)]}
NUM_ROCKS = 2022


class Shape:
    def __init__(self, x: int, y: int, shape: str):
        self.origin_x = x
        self.origin_y = y
        self.coordinates = SHAPES[shape]
        self.l_offset = min([x for x, y in self.coordinates])
        self.r_offset = max([x for x, y in self.coordinates])

    def get_coordinates(self):
        return [(self.origin_x + x, self.origin_y + y) for x, y in self.coordinates]

    def get_min_x(self):
        return self.origin_x - self.l_offset

    def get_max_x(self):
        return self.origin_x + self.r_offset

    def move(self, x: int, y: int):
        self.origin_x += x
        self.origin_y += y


class Column:
    def __init__(self, width: int, jets: str):
        self.width = width
        self.jets = jets
        self.rock_order = ['H_LINE', 'CROSS', 'L', 'V_LINE', 'SQUARE']
        self.curr_rock = None
        self.rocks = list()
        self.jets_i = 0
        self.rock_i = 0
        self.floor = 1  # Because we subtract 4 the first time
        self.points = set()
        self.debug = list()

    def get_next_rock(self):
        s = self.rock_order[self.rock_i]
        self.rock_i += 1
        self.rock_i %= len(self.rock_order)
        return s

    def get_next_move(self):
        m = self.jets[self.jets_i]
        self.jets_i += 1
        self.jets_i %= len(self.jets)
        return m

    def add_rock(self):
        self.curr_rock = Shape(2, self.floor - 4, self.get_next_rock())
        self.rocks.append(self.curr_rock)

    def occupied(self, coordinates):
        for c in coordinates:
            if c in self.points:
                return True
        return False

    def move_curr_rock(self):
        move = self.get_next_move()
        if move == '<':
            self.curr_rock.move(-1, 0)
            if self.curr_rock.get_min_x() == -1 or self.occupied(self.curr_rock.get_coordinates()):
                self.curr_rock.move(1, 0)
        else:
            self.curr_rock.move(1, 0)
            if self.curr_rock.get_max_x() == self.width or self.occupied(self.curr_rock.get_coordinates()):
                self.curr_rock.move(-1, 0)

        # Drop the rock
        self.curr_rock.move(0, 1)
        if self.curr_rock.origin_y == 1 or self.occupied(self.curr_rock.get_coordinates()):
            self.curr_rock.move(0, -1)
            return False
        return True

    def simulate_rock(self):
        self.add_rock()
        while self.move_curr_rock():
            pass
        self.points |= set(self.curr_rock.get_coordinates())
        self.floor = min([y for x, y in self.points])
        self.debug.append(self.curr_rock.get_coordinates())


if __name__ == '__main__':
    with open('input.txt', 'r') as f:
        jets = ''
        for line in f.readlines():
            jets += line.replace('\n', '')
        c = Column(7, jets)

    for _ in range(NUM_ROCKS):
        c.simulate_rock()

    print('After {} rocks column is {} units tall'.format(NUM_ROCKS, abs(c.floor) + 1))
