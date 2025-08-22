#!/data/data/com.termux/files/usr/bin/bash

def: minimist.argv()
{
	var value::variabel = "${@/[/}"
	var value::variabel = "${value__variabel/]/}"

	var value::set1 = "${value__variabel/[a-zA-Z0-9]*[^>]=/}"
	var value::set2 = "${value__variabel%=*}"
#	echo "${value__set2}${value__set1}"
	local IFS=$'\r\n'
	eval "$(@return: [value::set2])=\"$(@return: [value::set1])\"" || { e="Error into ${@}"; }
}
