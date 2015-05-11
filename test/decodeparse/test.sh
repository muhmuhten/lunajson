#!/bin/sh
source ../luabin.sh

echo "# valid"
for l in all-*-decoder.lua test-*-decoder.lua; do
	echo "## $l"
	for j in validjson/*.json; do
		echo "### ${j}"
		echo "#### lua51"
		eval "${lua51}" test.lua valid "${l}" "${j}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua valid "${l}" "${j}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua valid "${l}" "${j}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua valid "${l}" "${j}" 2>&1
	done
done

echo "# invalid"
for l in all-*-decoder.lua test-*-decoder.lua; do
	echo "## $l"
	for j in invalidjson/*.json; do
		echo "### ${j}"
		echo "#### lua51"
		eval "${lua51}" test.lua invalid "${l}" "${j}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua invalid "${l}" "${j}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua invalid "${l}" "${j}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua invalid "${l}" "${j}" 2>&1
	done
done

echo "# saxread"
echo "#### lua51"
eval "${lua51}" test-saxread.lua 2>&1
echo "#### lua52"
eval "${lua52}" test-saxread.lua 2>&1
echo "#### lua53"
eval "${lua53}" test-saxread.lua 2>&1
echo "#### luajit"
eval "${luajit}" test-saxread.lua 2>&1

echo "# bench"
for l in all-*-decoder.lua bench-*-decoder.lua; do
	echo "## $l"
	for j in benchjson/*.json; do
		echo "### ${j}"
		echo "#### lua51"
		eval "${lua51}" test.lua bench "${l}" "${j}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua bench "${l}" "${j}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua bench "${l}" "${j}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua bench "${l}" "${j}" 2>&1
	done
done
