# mkprepbufr
Extract bits of global-workflow related to generation of prepbufr file.

## Lazy Instructions
Copy this directory to your location and lets call this directory $EXPDIR:
1. edit the top 20 lines in `config/config.base` to configure your run
- change the experiment parameters: lines 7-14
- provide path to obsproc builds: lines 19-20

Nothing else needs to change, but feel free to look around.

2. Drop a set of backgrounds in $ROTDIR from the previous cycle:
```
$> GDATE = $CDATE - 6H
$> gPDY=${GDATE:0:8}; gcyc=${GDATE:9:10}
$> mkdir -p $ROTDIR/gdas.$gPDY/$gcyc
$> cp gdas.t$gcyc.atmfXXX.nemsio $ROTDIR/gdas.$gPDY/$gcyc/
```
Example backgrounds (C96 resolution) initialized at 2019050100 (GDATE) are at:
```
$> cd /scratch1/NCEPDEV/stmp2/Rahul.Mahajan/ROTDIR/testPrep/gdas.20190501/00
$> ls -1
gdas.t00z.atmf000.nemsio
gdas.t00z.atmf003.nemsio
gdas.t00z.atmf006.nemsio
gdas.t00z.atmf009.nemsio
```

3. Grab an interactive node on Hera/WCOSS_C and execute
Example for Hera (1 node 4 processes):
```
$> salloc --partition=hera --qos=debug --account=fv3-cpu --nodes=1 --ntasks-per-node=4 --time=00:30:00 --chdir=$PWD --job-name=InteractiveJob
$onComputeNode> runMe.sh >& runLog 2>&1
```

You are now ready to run this over and over and over.
