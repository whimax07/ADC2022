from enum import Enum
from copy import deepcopy


class D(Enum):
    N = 0
    E = 1
    S = 2
    W = 3


class Elf:
    def __init__(self):
        self.move = None


class Map(dict):
    def __init__(self):
        super().__init__()
        self.choices = [D.N, D.S, D.W, D.E]

    def adjust_choices(self):
        self.choices = self.choices[1:] + [self.choices[0]]

    def has_neighbour(self, x: int, y: int):
        keys = super().keys()
        if (x-1, y) in keys or (x-1, y-1) in keys or (x-1, y+1) in keys:
            return True
        if (x, y-1) in keys or (x, y+1) in keys:
            return True
        if (x+1, y) in keys or (x+1, y-1) in keys or (x+1, y+1) in keys:
            return True

    def is_empty(self, x, y, direction):
        keys = super().keys()
        if direction == D.N:
            return not ((x, y-1) in keys or (x-1, y-1) in keys or (x+1, y-1) in keys)
        if direction == D.E:
            return not ((x+1, y) in keys or (x+1, y-1) in keys or (x+1, y+1) in keys)
        if direction == D.S:
            return not ((x, y+1) in keys or (x-1, y+1) in keys or (x+1, y+1) in keys)
        if direction == D.W:
            return not ((x-1, y) in keys or (x-1, y-1) in keys or (x-1, y+1) in keys)

    def get_offset(self, x, y, direction):
        if direction == D.N:
            return x, y-1
        if direction == D.E:
            return x+1, y
        if direction == D.S:
            return x, y+1
        if direction == D.W:
            return x-1, y

    def get_prop_pos(self, coords: tuple):
        choice = None
        new_pos = None
        x = coords[0]
        y = coords[1]
        e = super().get(coords)
        if not self.has_neighbour(x, y):
            return None
        for d in self.choices:
            if self.is_empty(x, y, d):
                choice = d
                new_pos = self.get_offset(x, y, d)
                break

        if choice:
            e.move = choice
            return new_pos
        return None


if __name__ == '__main__':
    elves = Map()
    with open('input.txt', 'r') as f:
        lines = f.readlines()
        x = 0
        y = 0
        for line in lines:
            y += 1
            for c in line:
                x += 1
                if c == '#':
                    elves[(x, y)] = Elf()
            x = 0

    proposals = dict()
    freq = dict()
    num_rounds = 0
    is_done = False
    while not is_done:
        is_done = True
        num_rounds += 1
        proposals.clear()
        freq.clear()
        for coords in elves.keys():
            new_pos = elves.get_prop_pos(coords)
            if new_pos:
                proposals[new_pos] = coords
                freq[new_pos] = freq.get(new_pos, 0) + 1

        for new_pos, old_pos in proposals.items():
            if freq[new_pos] != 1:
                continue
            elves[new_pos] = deepcopy(elves[old_pos])
            del elves[old_pos]
            is_done = False

        elves.adjust_choices()

    print('First round where no elf moves: {}'.format(num_rounds))
