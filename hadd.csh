set RUN=$1
eosmount /tmp/`whoami`/eos
#set dir="/tmp/`whoami`/eos/cms/store/caf/user/`whoami`/GainRun_$RUN"
set dir="/tmp/`whoami`/eos/cms/store/caf/dpg_tracker_pixel/comm_pixel/`whoami`/GainRun_$RUN"
hadd -f $dir/GainCalibration.root $dir/*.root
#hadd -f $dir/GainCalibration_0.root $dir/0.root $dir/1.root $dir/2.root $dir/3.root $dir/4.root $dir/5.root $dir/6.root $dir/7.root $dir/8.root $dir/9.root
#hadd -f $dir/GainCalibration_1.root $dir/10.root $dir/11.root $dir/12.root $dir/13.root $dir/14.root $dir/15.root $dir/16.root $dir/17.root $dir/18.root $dir/19.root
#hadd -f $dir/GainCalibration_2.root $dir/20.root $dir/21.root $dir/22.root $dir/23.root $dir/24.root $dir/25.root $dir/26.root $dir/27.root $dir/28.root $dir/29.root
#hadd -f $dir/GainCalibration_3.root $dir/30.root $dir/31.root $dir/32.root $dir/33.root $dir/34.root $dir/35.root $dir/36.root $dir/37.root $dir/38.root $dir/39.root
#hadd -f $dir/GainCalibration.root $dir/GainCalibration_0.root $dir/GainCalibration_1.root $dir/GainCalibration_2.root $dir/GainCalibration_3.root

