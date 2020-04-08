#!/bin/bash

set -x

export EXPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
$EXPDIR/ush/driver_JGLOBAL_PREP
