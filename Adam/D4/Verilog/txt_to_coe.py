import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        file_name = input('Please specify a file: ')
    else:
        file_name = sys.argv[1]
    with open(file_name, 'r') as f:
        lines = [line[:-1].replace('-', ',').split(',') for line in f.readlines()]
        vals = []
        for line in lines:
            vals += line
    with open(file_name[:file_name.rfind('.')] + '.coe', 'w') as f:
        f.write('memory_initialization_radix=16;\nmemory_initialization_vector=\n')
        i = 0
        for v in vals:
            f.write('{:02x},'.format(int(v)))
            i += 1
            if i == 4:
                f.write('\n')
                i = 0
        f.write('0;')
    print('Done: {} bits written'.format(len(vals) * 8 + 8))
