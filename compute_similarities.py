from sklearn.metrics.pairwise import pairwise_distances
import sys
from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
import numpy as np
import pickle

def main():
    parser = ArgumentParser("Compute Similarities",
                            formatter_class=ArgumentDefaultsHelpFormatter,
                            conflict_handler='resolve')
    parser.add_argument('--filename', type=str, help='embedding file name')
    parser.add_argument('--workers', type=int, help='embedding file name')
    args = parser.parse_args()

    filename = args.filename

    data = []
    with open(filename, 'r') as f:
        for i, line in enumerate(f):
            if i == 0:
                continue
            st = line.split()
            data.append([float(s) for s in st[1:]])

    sim = 0 - pairwise_distances(np.array(data, dtype=np.float), metric="euclidean", n_jobs=args.workers)

    with open(filename + '.pkl', 'wb') as f:
        pickle.dump(sim, f, protocol=4)

if __name__ == '__main__':
    sys.exit(main())
