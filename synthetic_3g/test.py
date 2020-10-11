import numpy as np

attr = []
address = 'synthetic_3g_n500_Pred0.6_Pblue0.25_Prr0.025_Pbb0.025_Pgg0.025_Prb0.01_Prg0.005_Pbg0.005'
with open(address + '.attr', 'r') as file:
    for line in file:
        attr.append(int(line.split(' ')[1]))

rb, rg, bg, rr, bb, gg = 0, 0, 0, 0, 0, 0
with open(address + '.links', 'r') as file:
    for line in file:
        s = line.split(' ')
        v, u = int(s[0]), int(s[1])
        if v < u:
            c1, c2 = attr[v-1], attr[u-1]
            if c1 > c2:
                c1, c2 = c2, c1
            if c1 == 0 and c2 == 1:
                rb += 1
            if c1 == 0 and c2 == 2:
                bg += 1
            if c1 == 1 and c2 == 2:
                rg += 1
            if c1 == 0 and c2 == 0:
                bb += 1
            if c1 == 1 and c2 == 1:
                rr += 1
            if c1 == 2 and c2 == 2:
                gg += 1

    print(rr / (300 * 299 / 2))
    print(bb / (125 * 124 / 2))
    print(gg / (75 * 74 / 2))
    print(rb / (300 * 125))
    print(rg / (300 * 75))
    print(bg / (125 * 75))
    print(address)