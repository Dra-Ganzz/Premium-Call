#!/data/data/com.termux/files/usr/bin/bash

Bash.import: log/warnings

class __parallel__;{
	{
		public: app =\> [setup]
		public: app =\> [exec_sh]
	}

	public __parallel__::setup(){
		Named.argv "$1" ~\> [alg]
		Named.argv "$2" ~\> [value_alg]
		
		# capture semua fungsi yg ada
		var all:func = $(
			declare -F|cut -d ' ' -f 3
		)

		if test "$alg" != "jobs:"; then {
			log.info "Error in Line: [${BASH_LINENO[0]}] From: [${BASH_SOURCE[1]}]"
			log.warn "exception: 500Identification"
			log.error "Msg: $@ error $1"
			e="500Indentification"
			exit 25
		}; fi

		for myfuncts in $(@return: [all:func]); do
			export -f $myfuncts
		done
	}

	public __parallel__::exec_sh(){
		var al_command = $(echo "$@"|sed 's/{//g'|sed 's/}//g')

		parallel -j "$value_alg" ::: "$al_command"
	}
}

#const: __parallel__ =\> shell_pl
