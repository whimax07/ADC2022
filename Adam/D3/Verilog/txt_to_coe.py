import sys

DISGUSTING = 'abcdefghijklmnopqrstuvwxyz'


if __name__ == '__main__':
	if len(sys.argv) != 2:
		file_name = input('Please specify a file: ')
	else:
		file_name = sys.argv[1]
	with open(file_name, 'r') as f:
		lines = [line for line in f.readlines()]
		vals = []
		for line in lines:
			for c in line:
				if c == '\n':
					vals.append(0)
					continue
				i = DISGUSTING.find(c.lower()) + 1
				if i == 0:
					raise ValueError("txt file must contain letters only")
				if c.isupper():
					i += 26
				vals.append(i)
		if vals[:-1] != 0:
			vals.append(0)
	with open(file_name[:file_name.rfind('.')] + '.coe', 'w') as f:
		f.write('memory_initialization_radix=16;\nmemory_initialization_vector=\n')
		for v in vals:
			f.write('{:02x},'.format(v))
			if v == 0:
				f.write('\n')
		f.write('0;')
