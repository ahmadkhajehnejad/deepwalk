for d in 32 64 92 128; do
        python deepwalk --format edgelist --input data/rice.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 20 --output data/rice.embeddings_unweighted_d$d # --weighted constant_5 --sensitive-attr-file data/rice.attr
done
