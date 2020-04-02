#!/bin/bash

set -x

eval expdir=$(grep "export EXPDIR=" ./config/config.base)
export EXPDIR
$EXPDIR/ush/driver_JGLOBAL_PREP
