#!/bin/bash

set -x

source config/config.base

PDY=${CDATE:0:8}
cyc=${CDATE:8:10}

GDATE=$(date -d "$PDY $cyc -6 hours" +%Y%m%d%H)
gPDY=${GDATE:0:8}
gcyc=${GDATE:8:10}

mkdir -p $ROTDIR
mkdir -p $ROTDIR/$CDUMP.$gPDY/$gcyc

if [ $machine = "HERA" ]; then
	stagedROTDIR="/scratch1/NCEPDEV/stmp2/Rahul.Mahajan/ROTDIR/testPrep"
else
	echo "stagedROTDIR is only provided for HERA, ABORT!"
	exit 1
fi

$NCP $stagedROTDIR/$CDUMP.$gPDY/$gcyc/$CDUMP.t${gcyc}z.atmf*.nemsio \
           $ROTDIR/$CDUMP.$gPDY/$gcyc/

exit 0
