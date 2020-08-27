#for c in 50 100 1000; do #2 3 5 7 10; do
#	for d in 32 64 92 128; do
#		python deepwalk --format edgelist --input data/rice.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/rice.embeddings_wconstant${c}_d$d --weighted constant_$c --sensitive-attr-file data/rice.attr
#	done
#done

d=32
#prb=0.7
#pbr=0.7



nodes=500
Pred=0.7

Phom=0.025

for Phet in 0.001 0.005 0.01 0.015 0.02 0.025; do
  	filename=synthetic/synthetic_n${nodes}_Pred${Pred}_Phom${Phom}_Phet${Phet}
#	#for method in 'unweighted' 'constant_100' 'constant_1000' 'prb_0.5_pbr_0.5' 'prb_0.7_pbr_0.7' 'prb_0.9_pbr_0.9' 'pch_0.5' 'pch_0.7' 'pch_0.9' 'random'; do
#	#for method in 'random_walk_5'; do
#	#for method in 'smartshortcut_0.1' 'smartshortcut_0.2' 'smartshortcut_0.5' 'smartshortcut_0.7' 'smartshortcut_0.9' ; do
	method='unweighted'
	outfile=${filename}.embeddings_${method}_d$d 
	python deepwalk --format edgelist --input ${filename}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output $outfile --weighted $method --sensitive-attr-file ${filename}.attr
	for rwl in 5; do #5 10 20; do
		for bndry in 0.5 0.6 0.7 0.8 0.9; do #0.2 0.5 0.7 0.9; do
			for exponent in 2.0 6.0 8.0; do #0.5 1.0 2.0; do
				for bndrytype in 'bndry'; do # 'revbndry'; do
					method='random_walk_'${rwl}'_'${bndrytype}'_'${bndry}'_exp_'${exponent}
					outfile=${filename}.embeddings_${method}_d$d 
					echo '   '
					echo $filename'  '$method
					if test -f "$outfile"; then
						    echo "$outfile exists."
					else
						python deepwalk --format edgelist --input ${filename}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output $outfile --weighted $method --sensitive-attr-file ${filename}.attr
#						#python deepwalk --format edgelist --input ${filename}.links --max-memory-data-size 0 --number-walks 160 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output ${filename}.pmodified_${pmodified}_embeddings_${method}_d$d --weighted $method --pmodified $pmodified --sensitive-attr-file ${filename}.attr
					fi
				done
			done
		done
	done
done




#filename='data/rice/rice'
#for rwl in 5; do # 5 10 20; do
#	for bndry in 0.5 0.7 0.9; do #0.2 0.5 0.7 0.9; do
#		for exponent in '1.0' '2.0' '3.0' '4.0'; do #0.5 1.0 2.0; do
#			for bndrytype in 'bndry'; do # 'bndry' 'revbndry'; do
#				method='random_walk_'${rwl}'_'$bndrytype'_'${bndry}'_exp_'${exponent}
#				echo '   '
#				echo $filename'  '$method
#				python deepwalk --format edgelist --input ${filename}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output ${filename}.embeddings_${method}_d$d --weighted $method --sensitive-attr-file ${filename}.attr
#			done
#		done
#	done
#done

#dataset='rice'
#for pmodified in 0.2 0.5 0.7 0.9 1.0; do
##for pmodified in 1.0; do
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 160 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.pmodified_${pmodified}_embeddings_pch_0.9_d$d --weighted pch_0.9  --pmodified $pmodified --sensitive-attr-file data/${dataset}/${dataset}.attr
	#python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 160 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output alaki.txt --weighted pch_0.9 --pmodified $pmodified --sensitive-attr-file data/${dataset}/${dataset}.attr
#done


#python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 160 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/test/rice.embeddings_pch_0.9_d${d}__2 --weighted pch_0.9 --sensitive-attr-file data/${dataset}/${dataset}.attr

#python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/test/rice.embeddings_pch_0.9_d${d}__1 --weighted pch_0.9 --sensitive-attr-file data/${dataset}/${dataset}.attr

#for d in 64 92 128; do
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_prb_${prb}_pbr_${pbr}_d$d --weighted prb_${prb}_pbr_${pbr} --sensitive-attr-file data/${dataset}/${dataset}.attr

##for dataset in 'rice' 'sample_1000' 'sample_4000'; do
#for dataset in 'rice'; do # 'sample_1000' 'sample_4000'; do
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_random_d$d --weighted random --sensitive-attr-file data/${dataset}/${dataset}.attr
	#for psc in 0.9 0.7 0.5 0.2; do
	#	echo $dataset	
	#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_smartshortcut_${psc}_d$d --weighted smartshortcut_${psc} --sensitive-attr-file data/${dataset}/${dataset}.attr
	#done
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_prb_${prb}_pbr_${pbr}_d$d --weighted prb_${prb}_pbr_${pbr} --sensitive-attr-file data/${dataset}/${dataset}.attr
	
	# python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_wexpandconstant${c}_d$d --weighted expandar_constant_$c --sensitive-attr-file data/${dataset}/${dataset}.attr

#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_wrb_${wrb}_wbr_1_d$d --weighted rb_${wrb}_br_1 --sensitive-attr-file data/${dataset}/${dataset}.attr
#	python deepwalk --format edgelist --input data/${dataset}/${dataset}.links --max-memory-data-size 0 --number-walks 80 --representation-size $d --walk-length 40 --window-size 10 --workers 30 --output data/${dataset}/${dataset}.embeddings_unweighted --sensitive-attr-file data/${dataset}/${dataset}.attr
#done


