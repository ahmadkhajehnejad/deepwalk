#for c in 50 100 1000; do #2 3 5 7 10; do
#	for d in 32 64 92 128; do
#		python deepwalk --format edgelist --input data/rice.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/rice.embeddings_wconstant${c}_d$d --weighted constant_$c --sensitive-attr-file data/rice.attr
#	done
#done

d=32

#for dataset in 'rice' 'sample_1000' 'sample_4000'; do
for dataset in 'rice' 'sample_1000' 'sample_4000'; do
	echo $dataset
#	if [ $dataset = 'rice' ];
#	then
#		wrb=1.4505426213145256
#	else
#		if [ $dataset = 'sample_1000' ];
#		then
#			wrb=0.23002630472183228
#		else
#			wrb=0.18492755200713873
#		fi
#	fi
#	echo $wrb

	for c in 7 10 50 100 1000; do
		python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_wconstant${c}_d$d --weighted constant_$c --sensitive-attr-file data/${dataset}/${dataset}.attr
	done
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_wrb_${wrb}_wbr_1_d$d --weighted rb_${wrb}_br_1 --sensitive-attr-file data/${dataset}/${dataset}.attr
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_unweighted --sensitive-attr-file data/${dataset}/${dataset}.attr
done

# sample_4000: 0.18492755200713873
# sample_1000: 0.23002630472183228
# rice: 1.4505426213145256

