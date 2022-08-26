#!/bin/bash

##
# Pre-requirements:
#Please install curl before running this script
# - env TARGET: path to target work dir
##



for w in $(ls workloads); do
		#echo $w
		TARGET=$"workloads/"$w
		if [ "$w" == "libpng" ]; then
			
			git clone --no-checkout https://github.com/glennrp/libpng.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout a37d4836519517bdce6cb9d956092321eca3e73b
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "libsndfile" ]; then
			
			git clone --no-checkout https://github.com/libsndfile/libsndfile.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout 86c9f9eb7022d186ad4d0689487e7d4f04ce2b29
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "libtiff" ]; then
			
			git clone --no-checkout https://gitlab.com/libtiff/libtiff.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout c145a6c14978f73bb484c955eb9f84203efcb12e
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "libxml2" ]; then
			
			git clone --no-checkout https://gitlab.gnome.org/GNOME/libxml2.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout ec6e3efb06d7b15cf5a2328fabd3845acea4c815
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "lua" ]; then
			
			git clone --no-checkout https://github.com/lua/lua.git "$TARGET/repo"
			git -C "$TARGET/repo" checkout dbdc74dc5502c2e05e1c1e2ac894943f418c8431
			
			echo "$w"' has been fetched'
		
		elif [ "$w" == "openssl" ]; then
			
			git clone --no-checkout https://github.com/openssl/openssl.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout 3bd5319b5d0df9ecf05c8baba2c401ad8e3ba130
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "php" ]; then
			git clone --no-checkout https://github.com/php/php-src.git \
			"$TARGET/repo"
			git -C "$TARGET/repo" checkout bc39abe8c3c492e29bc5d60ca58442040bbf063b

			git clone --no-checkout https://github.com/kkos/oniguruma.git \
			"$TARGET/repo/oniguruma"
			git -C "$TARGET/repo/oniguruma" checkout 227ec0bd690207812793c09ad70024707c405376
			
			echo "$w"' has been fetched'
			
		elif [ "$w" == "sqlite3" ]; then
			OUT="$TARGET/out"
			mkdir -p $OUT
			curl "https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=8c432642572c8c4b" \
			-o "$OUT/sqlite.tar.gz" && \
			mkdir -p "$TARGET/repo" && \
			tar -C "$TARGET/repo" --strip-components=1 -xzf "$OUT/sqlite.tar.gz"
			
			echo "$w"' has been fetched'
				 
		fi
		
done

echo 'All workloads have been fetched'

