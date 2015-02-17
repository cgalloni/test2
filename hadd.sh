#!/bin/bash
RUN=$1
##eosmount /store/caf/dpg_tracker_pixel/comm_pixel/`whoami`/
eosmount /tmp/`whoami`/eos
dir="/tmp/`whoami`/eos/cms/store/group/dpg_tracker_pixel/comm_pixel/`whoami`/GainRun_$RUN"
hadd -f $dir/GainCalibration.root $dir/*.root