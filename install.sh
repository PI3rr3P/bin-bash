#!/usr/bin/env bash

set -e

for file in $( find ~+ -maxdepth 1 -type f -not -path '.*' ); do
    name=$( basename ${file} )
    [[ "${name}" == "install.sh" || "${name}" == "LICENSE" ]] && continue
    if [[ "${name:0:2}" == "p-" ]]; then
        ln -fs ${file} ~/bin/${name}
    elif [[ "${name:0:1}" == "p" ]]; then
        ln -fs ${file} ~/bin/p-${name:1 }
    else
        ln -fs ${file} ~/bin/p-${name}
    fi
done
