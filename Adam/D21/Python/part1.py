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


if __name__ == '__main__':
    nodes = dict()
    values = dict()
    with open('input.txt', 'r') as f:
        for line in f.readlines():
            vars = line.split()
            if len(vars) == 2:
                values[vars[0][:-1]] = float(vars[1])
            else:
                nodes[vars[0][:-1]] = Node(vars[1], vars[3], vars[2])

    nodes_todo = nodes.keys()
    while len(nodes_todo):
        for n in nodes_todo:
            d = nodes[n]
            if d.lhs in values and d.rhs in values:
                val = eval_op(values[d.lhs], values[d.rhs], d.op)
                values[n] = val
        nodes_todo = [n for n, d in nodes.items() if n not in values]

    print('Value of root is: {}'.format(int(values['root'])))
