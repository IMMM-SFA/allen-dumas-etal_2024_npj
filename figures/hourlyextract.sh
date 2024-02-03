for f in dca_15min_HI_2010-07-01-10_10m.nc; do
    echo 'Processing' $f
    i=0
    for hr in {0..239}; do
        start=$(($hr*4))
        end=$(($start+3))

        ncra -d Time,$start,$end $f "dca_HI_hr${i}_10m.nc"
        #echo $start, $end, $i
        i=$(($i+1))

    done
done