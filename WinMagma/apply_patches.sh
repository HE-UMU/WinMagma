#!/bin/bash
set -e

## Injects bugs into all workloads.
## Run only after fetching the workloads. 
for w in $(ls workloads); do
		#echo $w
		TARGET=$"workloads/"$w
		find "$TARGET/patches/setup" "$TARGET/patches/bugs" -name "*.patch" | \
		while read patch; do
			echo "Applying $patch"
			name=${patch##*/}
			name=${name%.patch}
			sed "s/%MAGMA_BUG%/$name/g" "$patch" | patch -p1 -d "$TARGET/repo"
		done
		
done
