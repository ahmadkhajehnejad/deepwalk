from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter
import numpy as np

if __name__ == '__main__':
    parser = ArgumentParser("Synthesize Graph",
                            formatter_class=ArgumentDefaultsHelpFormatter,
                            conflict_handler='resolve')

    parser.add_argument('--nodes', type=int, help='Number nodes')
    parser.add_argument('--Pred', type=float, help='Probability of being red for each node')
    parser.add_argument('--Pblue', type=float, help='Probability of being blue for each node')
    parser.add_argument('--Prr', type=float, help='Probability of within group connections for red nodes')
    parser.add_argument('--Pbb', type=float, help='Probability of within group connections for blue nodes')
    parser.add_argument('--Pgg', type=float, help='Probability of within group connections for green nodes')
    parser.add_argument('--Prb', type=float, help='Probability of connections between red and blue')
    parser.add_argument('--Prg', type=float, help='Probability of connections between red and green')
    parser.add_argument('--Pbg', type=float, help='Probability of connections between blue and green')

    args = parser.parse_args()

    n = args.nodes
    n_red = int(n * args.Pred)
    n_blue = int(n * args.Pblue)

    edges = []
    for i in range(1, n_red + 1):
        for j in range(i + 1, n_red + 1):
            if np.random.rand() < args.Prr:
                edges.append((i, j))
                edges.append((j, i))
    for i in range(n_red + 1, n_red + n_blue + 1):
        for j in range(i + 1, n_red + n_blue + 1):
            if np.random.rand() < args.Pbb:
                edges.append((i, j))
                edges.append((j, i))
    for i in range(n_red + n_blue + 1, n + 1):
        for j in range(i + 1, n + 1):
            if np.random.rand() < args.Pgg:
                edges.append((i, j))
                edges.append((j, i))
    for i in range(1, n_red + 1):
        for j in range(n_red + 1, n_red + n_blue + 1):
            if np.random.rand() < args.Prb:
                edges.append((i, j))
                edges.append((j, i))
    for i in range(1, n_red + 1):
        for j in range(n_red + n_blue + 1, n + 1):
            if np.random.rand() < args.Prg:
                edges.append((i, j))
                edges.append((j, i))
    for i in range(n_red + 1, n_red + n_blue + 1):
        for j in range(n_red + n_blue + 1, n + 1):
            if np.random.rand() < args.Pbg:
                edges.append((i, j))
                edges.append((j, i))


    filename = 'synthetic_3g/synthetic_3g_n' + str(n) + '_Pred' + str(args.Pred) + '_Pblue' + str(args.Pblue) + \
               '_Prr' + str(args.Prr) + '_Pbb' + str(args.Pbb) + '_Pgg' + str(args.Pgg) + \
               '_Prb' + str(args.Prb) + '_Prg' + str(args.Prg) + '_Pbg' + str(args.Pbg) 

    with open(filename + '.attr', 'w') as f:
        for i in range(1, n_red + 1):
            f.write(str(i) + ' 1' + '\n')
        for i in range(n_red + 1, n_red + n_blue + 1):
            f.write(str(i) + ' 0' + '\n')
        for i in range(n_red + n_blue + 1, n + 1):
            f.write(str(i) + ' 2' + '\n')

    with open(filename + '.links', 'w') as f:
        for e in edges:
            f.write(str(e[0]) + ' ' + str(e[1]) + '\n')
