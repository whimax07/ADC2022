import sys


if __name__ == '__main__':
    if len(sys.argv) != 2:
        file_name = input('Please specify a file: ')
    else:
        file_name = sys.argv[1]
    with open(file_name, 'r') as f:
        lines = [line for line in f.readlines()]
        moves = []
        for line in lines:
            moves.append([line[0], line[2]])

    with open(file_name[:file_name.rfind('.')] + '_tb_instructions.txt', 'w') as f:
        for m in moves:
            f.write("#10\nplayer1_move = {};\nplayer2_move = {};\n#10\nplay = 1'b1;\n#10\nplay = 1'b0;\n".format(m[0], m[1]))
