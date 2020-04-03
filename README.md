# mkprepbufr
Extract bits of global-workflow related to generation of prepbufr file.

## Lazy Instructions
1. Clone this repository and cd into it.
    ```
    $> git clone https://github.com/aerorahul/mkprepbufr
    $> cd mkprepbufr
    ```

2. Edit the top section in `config/config.base` to configure your run between the `BEGIN` and `END` comments:
    - change the experiment parameters.
    - provide path to obsproc builds. Pre-built paths to HERA are provided here for reference. The user can build their own versions, and point those directories to these variables here.

3. Drop a set of backgrounds in $ROTDIR from the previous cycle:
    - Set of example backgrounds (C96 resolution) initialized at 2019050100 (GDATE) are at:
        ```
        $> cd /scratch1/NCEPDEV/stmp2/Rahul.Mahajan/ROTDIR/testPrep/gdas.20190501/00
        $> ls -1
        gdas.t00z.atmf000.nemsio
        gdas.t00z.atmf003.nemsio
        gdas.t00z.atmf006.nemsio
        gdas.t00z.atmf009.nemsio
        ```
    - To use these, I am providing a `setupRun.sh`. To use it (on Hera only):
        ```
        $> setupRun.sh
        ```

4. Grab an interactive node on Hera/WCOSS_C and execute: (example for Hera below [1 node 4 processes, appropriate for the C96 files above]):
    ```
    $> salloc --partition=hera --qos=debug --account=fv3-cpu --nodes=1 --ntasks-per-node=4 --time=00:15:00 --chdir=$PWD --job-name=InteractiveJob
    $onComputeNode> runMe.sh >& runLog 2>&1
    ```

5. You are now ready to run this over and over and over.
