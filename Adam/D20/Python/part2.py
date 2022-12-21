from tqdm import tqdm
NUM_MIXES = 10
KEY = 811589153


if __name__ == '__main__':
    with open('input.txt', 'r') as f:
        vals = [int(l)*KEY for l in f.readlines()]
    i = 0
    num_vals = len(vals)
    indexes = [i for i in range(num_vals)]
    for _ in tqdm(range(NUM_MIXES)):
        for curr in range(num_vals):
            i = indexes.index(curr)

            ni = i + vals[i]
            if ni < 0 or ni > num_vals:
                ni %= (num_vals - 1)

            if ni > i:
                delta = 1
            else:
                delta = -1

            while ni != i:
                indexes[i], indexes[i + delta] = indexes[i + delta], indexes[i]
                vals[i], vals[i + delta] = vals[i + delta], vals[i]
                i += delta

    start = vals.index(0)
    v1 = vals[(start + 1000) % num_vals]
    v2 = vals[(start + 2000) % num_vals]
    v3 = vals[(start + 3000) % num_vals]
    print('{} + {} + {} = {}'.format(v1, v2, v3, v1 + v2 + v3))
