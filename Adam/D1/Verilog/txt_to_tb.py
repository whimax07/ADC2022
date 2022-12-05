import sys


if __name__ == '__main__':
	if len(sys.argv) != 2:
		file_name = input('Please specify a file: ')
	else:
		file_name = sys.argv[1]
	with open(file_name, 'r') as f:
		lines = [line for line in f.readlines()]
		vals = []
		for line in lines:
			if line == '\n':
				vals.append(0)
			else:
				vals.append(int(line))
			
	with open(file_name[:file_name.rfind('.')] + '_tb_instructions.txt', 'w') as f:
		for v in vals:
			f.write("#10\ninput_val = 32'h{:08x};\n#10\ninput_next_val = 1'b1;\n#10\ninput_next_val = 1'b0;\n".format(v))
