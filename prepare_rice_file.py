
if __name__ == '__main__':
    with open('data/rice_raw.attr', 'r') as fin:
        with open('data/rice.attr', 'w') as fout:
            for l in fin:
                x, _, y = l.strip().split()[:3]
                y = 1 if int(y) > 19 else 0
                fout.write(str(x) + ' ' + str(y) + '\n')
