nodes=500
Pred=0.7

Phom=0.025

for Phet in 0.005 0.02; do #0.001 0.01 0.015 0.025; do
  python ./synthesize_graph.py --nodes 500 --Pred $Pred --Phom $Phom --Phet $Phet
done
