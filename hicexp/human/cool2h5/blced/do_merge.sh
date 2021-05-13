for f in *_r1.*.cool.blc.h5
do
	bn=`basename $f`
	#rn=`echo $bn | sed "s/.cool.blc.h5//g"`
	
	if [[ ! ${bn} =~ ".20000." ]] #&&  [[ ! ${bn} =~ ".40000." ]]
	then
		gene=`echo $bn | cut -d "_" -f 1,2`
		res=`echo $bn | cut -d "." -f 2`
		root=`echo $bn | cut -d "." -f 3,4,5`
		#rep1=`echo ${gene}_rp1`
		#rep2=`echo ${gene}_rp2`

		echo ${gene}.${res} merging
		qsub -N ${bn}_merging -v inp1=${gene}_r1.${res}.${root},inp2=${gene}_r2.${res}.${root},out=${gene}_${res} hicsummat.pbs
		
	fi
done

