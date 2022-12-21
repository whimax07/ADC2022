from copy import deepcopy
from tqdm import tqdm


class Node:
    def __init__(self, lhs: str, rhs: str, op: str):
        self.lhs = lhs
        self.rhs = rhs
        self.op = op


def eval_op(v1: float, v2: float, op: str):
    if op == '+':
        return v1 + v2
    if op == '-':
        return v1 - v2
    if op == '*':
        return v1 * v2
    if op == '/':
        return v1 / v2
    raise ValueError


def get_opposite_op(op: str):
    if op == '+':
        return '-'
    if op == '-':
        return '+'
    if op == '*':
        return '/'
    if op == '/':
        return '*'
    raise ValueError


class Solver:
    def __init__(self, values: dict, nodes: dict):
        self.values = values
        self.nodes = nodes
        self.new = 0

    def get_new_node(self, n1, op, n2):
        self.new += 1
        n = Node(n1, op, n2)
        self.nodes[str(self.new)] = n
        self.values[str(self.new)] = eval_op(self.values[n.lhs], self.values[n.rhs], n.op)
        return str(self.new)

    def eval(self, node: str, value_node: str):
        self.values[node] = self.values[value_node]
        if node == 'humn':
            return

        n = self.nodes[node]
        assert n.lhs in self.values or n.rhs in self.values
        if n.lhs in self.values:
            if n.op == '-':
                self.eval(n.rhs, self.get_new_node(n.lhs, value_node, '-'))
            else:
                self.eval(n.rhs, self.get_new_node(value_node, n.lhs, get_opposite_op(n.op)))
        else:
            self.eval(n.lhs, self.get_new_node(value_node, n.rhs, get_opposite_op(n.op)))


if __name__ == '__main__':
    nodes = dict()
    values = dict()
    root = None
    with open('input.txt', 'r') as f:
        for line in f.readlines():
            vars = line.split()
            if len(vars) == 2:
                if vars[0] != 'humn:':
                    values[vars[0][:-1]] = float(vars[1])
            else:
                if vars[0] == 'root:':
                    root = (vars[1], vars[3])
                else:
                    nodes[vars[0][:-1]] = Node(vars[1], vars[3], vars[2])

    # Evaluate as many nodes as possible
    nodes_todo = nodes.keys()
    while len(nodes_todo):
        is_done = True
        for n in nodes_todo:
            d = nodes[n]
            if d.lhs in values and d.rhs in values:
                val = eval_op(values[d.lhs], values[d.rhs], d.op)
                values[n] = val
                is_done = False
        if is_done:
            break
        nodes_todo = [n for n, d in nodes.items() if n not in values]

    r1 = root[0]
    r2 = root[1]

    # Kind of cheating here because I know we're not solving simultaneous equations
    assert r1 in values or r2 in values
    s = Solver(values, nodes)
    if r1 in values:
        s.eval(r2, r1)
    else:
        s.eval(r1, r2)

    print('Value for humn is: {}'.format(int(values['humn'])))


