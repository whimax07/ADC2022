import itertools
import re
from typing import List
from functools import lru_cache
TIME = 30
SIZE = 4


class Graph:
    def __init__(self):
        self.valves = dict()
        self.edges = dict()

    def add_node(self, valve: str, pressure: int, neighbours: List[str]):
        self.valves[valve] = pressure
        for n in neighbours:
            self.edges[n] = self.edges.get(n, set()) | {valve}
            self.edges[valve] = self.edges.get(valve, set()) | {n}

    def compute_all_permutations(self):
        best_score = 0
        valid_valves = [v for v, p in self.valves.items() if p > 0]
        for i in range(6, len(valid_valves)):
            changed = False
            for moves in itertools.permutations(valid_valves, i):

                time = TIME - self.get_shortest_path_len('AA', moves[0])
                score = 0
                index = 0
                for sub in range(SIZE, i, SIZE):
                    for delta_t, s in self.compute_sub_score(moves[sub-SIZE:sub]):
                        time -= delta_t
                        score += s * time
                    index = sub

                if index != i:
                    if index != 0:
                        time -= self.get_shortest_path_len(moves[index-1], moves[index])
                    for delta_t, s in self.compute_sub_score(moves[index:]):
                        time -= delta_t
                        score += s * time

                if time < 0:
                    continue

                if score > best_score:
                    best_score = score
                    changed = True
                    print('New best score: {}'.format(best_score))
            if not changed:
                break
            print('Best score for moving between {} valves is: {}'.format(i, best_score))

        print('Highest possible pressure release is: {}'.format(best_score))

    def compute_score(self, moves: List[str]) -> int:
        time = 30
        delta_p = 0
        start = 'AA'
        for v in moves:
            path_len = self.get_shortest_path_len(start, v)
            time -= path_len + 1

            if time < 0:
                return delta_p
            delta_p += time * self.valves[v]
            start = v

        return delta_p

    @lru_cache
    def compute_sub_score(self, moves: List[str]):
        if not len(moves):
            return []
        delta_p = []
        start = moves[0]
        for v in moves:
            path_len = self.get_shortest_path_len(start, v)
            time = path_len + 1

            delta_p.append((time, self.valves[v]))
            start = v

        return delta_p

    @lru_cache
    def get_shortest_path_len(self, start: str, end: str):
        if start == end:
            return 0
        visited = set()
        next_layer = self.edges[start]
        min_len = 0
        while True:
            this_layer = next_layer
            next_layer = set()
            min_len += 1
            visited |= next_layer
            for n in this_layer:
                if n == end:
                    return min_len
                next_layer |= self.edges[n] - visited


if __name__ == '__main__':
    g = Graph()
    with open('input.txt', 'r') as f:
        for line in f.readlines():
            m = re.search(r"Valve (\S+).+=(\d+).+valve(s?) (.+)", line)
            valve = m.group(1)
            pressure = int(m.group(2))
            neighbours = m.group(4).replace(',', '').split()
            g.add_node(valve, pressure, neighbours)

    g.compute_all_permutations()
