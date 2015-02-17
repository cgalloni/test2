set RUN=$1
##cmsLs /store/caf/user/`whoami`/GainRun_$RUN | grep ".root" | sed 's;/; ;g;s;.root;;' | awk '{ print $NF }' | sort -n >! done.txt
cmsLs /store/group/dpg_tracker_pixel/comm_pixel/cgalloni/GainRun_$RUN | grep ".root" | sed 's;/; ;g;s;.root;;' | awk '{ print $NF }' | sort -n >! done.txt
bjobs | grep $RUN | sed 's;_; ;' | awk '{ print $(NF-3) }' | sort -n  >! running.txt
touch missing.txt
foreach n ( `seq 0 39` )
    if ( ( `grep '^'$n'$' done.txt | wc -l` == 0) && (`grep '^'$n'$' running.txt | wc -l` == 0) ) then
	echo $n >> missing.txt
    endif
end
echo "jobs with output in: /store/group/dpg_tracker_pixel/comm_pixel/cgalloni/GainRun_$RUN"
cat done.txt | tr '\n' ' '; echo
echo "jobs running on lxbatch:"
cat running.txt | tr '\n' ' ' ; echo
echo "missing:"
cat missing.txt | tr '\n' ' ' ; echo
echo "resubmit:"
cat missing.txt | awk '{ print "./Run.sh -resubmit $RUN "$NF }'
rm done.txt running.txt missing.txt
