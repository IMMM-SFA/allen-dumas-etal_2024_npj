for f in arb_HI_hrly_10m.nc; do
    echo 'Processing' $f
    i=1
    for hr in {0..9}; do
        start=$(($hr*24))
        end=$(($start+23))

        ncra -d Time,$start,$end $f "arb_HI_day${i}_10m.nc"
        #echo $start, $end, $i
        i=$(($i+1))

    done
done