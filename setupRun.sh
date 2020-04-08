#!/bin/bash

set -ex

source config/config.base

PDY=${CDATE:0:8}
cyc=${CDATE:8:10}

GDATE=$(date -d "$PDY $cyc -6 hours" +%Y%m%d%H)
gPDY=${GDATE:0:8}
gcyc=${GDATE:8:10}

if [ $machine = "HERA" ]; then
  stagedROTDIR="/scratch1/NCEPDEV/stmp2/Rahul.Mahajan/ROTDIR/testPrep"
elif [ $machine = "WCOSS_DELL_P3" ]; then
  stagedROTDIR="/gpfs/dell2/stmp/Rahul.Mahajan/ROTDIR/testPrep"
else
  echo "stagedROTDIR is only provided for:"
  echo "HERA | WCOSS_DELL_P3"
  echo "stagedROTDIR is NOT provided for: $machine, ABORT!"
  exit 1
fi

# Remove old ROTDIR and RUNDIR and create new ones
rm -rf $ROTDIR $RUNDIR
mkdir -p $ROTDIR
mkdir -p $ROTDIR/$CDUMP.$gPDY/$gcyc

# Copy staged data into newly created ROTDIR
$NCP $stagedROTDIR/$CDUMP.$gPDY/$gcyc/$CDUMP.t${gcyc}z.atmf*.nemsio \
           $ROTDIR/$CDUMP.$gPDY/$gcyc/

# Soft-link ROTDIR and RUNDIR in the experiment directory for easy access
$NLN $ROTDIR ./ROTDIR
$NLN $RUNDIR ./RUNDIR

exit 0
