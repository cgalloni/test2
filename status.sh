#!/bin/bash
RUN=$1
##cmsLs /store/caf/user/`whoami`/GainRun_$RUN | grep ".root" | sed 's;/; ;g;s;.root;;' | awk '{ print $NF }' | sort -n >! done.txt
cmsLs /store/group/dpg_tracker_pixel/comm_pixel/cgalloni/GainRun_$RUN | grep ".root" | sed 's;/; ;g;s;.root;;' | awk '{ print $NF }' | sort -n > done.txt
bjobs | grep $RUN | sed 's;_; ;' | awk '{ print $(NF-3) }' | sort -n  > running.txt
rm missing.txt
touch missing.txt
echo "touch missing.txt"
for n in {0..39}
do 
    echo "in the loop $n" 
    if  [ `grep '^'$n'$' done.txt | wc -l ` -eq 0 ] && [ `grep '^'$n'$' running.txt | wc -l   ` -eq 0 ] ; then 
	echo " wirting $n in  missing.txt"
	echo "$n" >> missing.txt 

    fi
done
echo "finish for loop"
echo "jobs with output in: /store/group/dpg_tracker_pixel/comm_pixel/cgalloni/GainRun_$RUN"
echo "jobs with output in: /store/caf/user/`whoami`/GainRun_$RUN"
cat done.txt | tr '\n' ' '; echo
echo "jobs running on lxbatch:"
cat running.txt | tr '\n' ' ' ; echo
echo "missing:"
cat missing.txt | tr '\n' ' ' ; echo
echo "resubmit:"
cat missing.txt | awk '{ print "./Run.sh -resubmit $RUN "$NF }'
##rm done.txt running.txt missing.txt