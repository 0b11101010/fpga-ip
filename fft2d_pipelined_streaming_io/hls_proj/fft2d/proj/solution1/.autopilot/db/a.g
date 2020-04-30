#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/erhan/workspace/Xilinx/Vivado_HLS_2019.1/fft2d/proj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
