# mkprepbufr
Extract the `prep` step of the global-workflow related to generation of prepbufr files.  This repository in essense set's up the execution of `JGLOBAL_PREP` on Hera and WCOSS_DELL_P3 (Venus and Mars).

## Lazy Instructions
1. Clone this repository and cd into it.
    ```
    $> git clone https://github.com/aerorahul/mkprepbufr
    $> cd mkprepbufr
    ```

2. Edit the top section in `config/config.base` to configure your run between the `BEGIN` and `END` comments:
    - change the experiment parameters; e.g. `PSLOT` etc.
    - provide path to obsproc builds in `HOMEobsproc_prep` and `HOMEobsproc_global`. Pre-built paths on Hera and WCOSS_DELL_P3 are provided here for reference.

3. `setupRun.sh` will setup the `ROTDIR` and copy a set of backgrounds from the previous cycle:
    - Set of example backgrounds (C96 resolution) initialized at 2019050100 (GDATE) can be used.
        ```
        $> setupRun.sh
        $> ls -1 $ROTDIR/gdas.20190501/00
        gdas.t00z.atmf000.nemsio
        gdas.t00z.atmf003.nemsio
        gdas.t00z.atmf006.nemsio
        gdas.t00z.atmf009.nemsio
        ```
    - A soft-link to the `$ROTDIR` and `$RUNDIR` will be placed in the experiment directory for easy access.

4. Grab an interactive compute node:
    
    ```
    heraFE$> salloc --partition=hera --qos=debug --account=fv3-cpu --nodes=1 --ntasks-per-node=4 --time=00:15:00 --chdir=$PWD --job-name=InteractiveJob
    ```
    ```
    wcossP3FE$> bsub -Is -J InteractiveJob -P GFS-DEV -q debug -W 00:30 -n 4 -R 'span[ptile=4] affinity[core(1)]'  bash
    ```
    When a compute note is available, execute:
    ```
    $computeNode> runJGLOBAL_PREP.sh >& runLog.txt 2>&1
    ```
    `runJGLOBAL_PREP.sh` will call `JGLOBAL_PREP`


5. You are now ready to run this over and over and over.
