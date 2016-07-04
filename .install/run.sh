#!/usr/bin/env bash

set +x -euo pipefail
toolsdir="`cd $(dirname $0) && pwd`"

runfrom=$(mktemp -d -p `pwd`)
pushd $runfrom >/dev/null
while read script; do
	echo $script    
done < <(find $toolsdir -maxdepth 1 -type f -iname '*.install')
popd
rm -rf $runfrom