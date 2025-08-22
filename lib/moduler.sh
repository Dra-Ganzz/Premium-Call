#!/data/data/com.termux/files/usr/bin/bash

# 33 = error syntax
# 22 = error identifikasi

sys::require()
{
	local set_path="$(pwd)/lib/$1"

	for files in ${set_path/\.sh/}; do
		if [[ ! -f "${files}.sh" ]]; then
			echo -e "[!] Module tidak ada di directory lib [[${files}]]"
			exit 33
		fi

		builtin source "${files}.sh" "$@";
	done
}

sys::Namespace()
{
	local name_app="$1"
	local name_package="$3"

	eval "${name_app}${2}${name_package}" || { echo "[*] Namespace Error"; exit 33; }
}

sys::import()
{
	local lib="${@/,/ }"
	for map in ${lib}; do
		sys::require "$map"
	done
}

App:Import()
{
	local file_or_src="${@#[*}"
	local file_or_src="${file_or_src%]*}"

	if ! (cat "$file_or_src" &> /dev/null); then
		for __depencies__ in $(cat ${file_or_src}); do
			builtin source < <(curl -sL "${__depencies__}" --insecure --compressed) || { echo "[*] Error Include"; exit 33; }
		done
	else {
			builtin source < <(curl -sL "${__depencies__}" --insecure --compressed) || { echo "[*] Error Include"; exit 33; }
	}; fi
		
}
# --------------------------------- { Namespace list } ---------------------------- #
Std::Sys()
{
	var()
	{
		local name_variabel=$(echo "$1"|sed 's/:/_/g')
		#value_variabel="${@:3}"
		
		if (test "$2" != "="); then
			echo "Syntax Error: syntax tidak teridentifikasi ${@} => ${2}"
			echo "From: [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
			exit 33
		fi

		#export ${name_variabel}="${@:3}"
		#eval "${name_variabel}=\"${@:3}\""
		#echo "${name_variabel}=\"${@:3}\""
		#declare "${name_variabel}"="${@:3}"
		#read -s ${name_variabel} <<< "$value_variabel"
		printf -v "${name_variabel}" "%b" "${*:3}"
		#bash <<< "${name_variabel}=\"${value_variabel}\""
			
	}

system.function()
{
	__namefunc__="$1"
    __funct__="${@:3}"
	#__funct__="${__funct__/[/}"
	#__funct__="${__funct__/]/}"
	__funct__=$(echo "$__funct__"|sed 's/\[/''/g')
	__funct__=$(echo "$__funct__"|sed 's/\]/''/g')

	#eval "${__namefunc__}(){ eval \"\$__func__\"; }"
	if (test "$2" != "="); then
		echo "None"; exit 22
	fi

	if ! (echo "$__funct__"|grep -o "lambda:" &> /dev/null); then
		echo "Failed: ${BASH_LINENO[1]} -> ${__funct__}"
		exit 32
	else
		eval "\${__funct__}"
	fi

	eval "${__namefunc__:-null}=\"Object: [\${__funct__}]\""
}

lambda:()
{
	__func__="${@:3}"

	if (test "$1" != "command"); then
		echo "None: ${BASH_LINENO[1]} -> ${1}"
	elif (test "$2" != ":"); then
		echo "None: ${BASH_LINENO[1]} -> ${2}"
	fi

	eval "alias ${__namefunc__:-null}=\"${__func__}\";"
	#alias ${__namefunc__:-null}="${__func__}"
}

shopt -s expand_aliases
alias var::lambda="system.function"

	join.by(){ local IFS="$1"; shift; echo "$*"; }
	
	sys::as()
	{
		local func="$1"
		local into="${3#[*}"

		if (test "$2" != "=>"); then
			echo "[¥] Syntax Error: Syntax Tidak Teridentifikasi sys::as ${@} -> ${2}"
			echo "[¥] From: [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
			exit 33
		fi

		eval "alias ${func}=\"${into%]*}\""
	}

	Named.argv()
	{
		local __named__="${3/[/}"
		local __value__="$1"

		if [[ "$2" != "~>" ]]; then
			echo "[••] Error into ${@} -> ${2}"
			echo "[••] From: ${BASH_LINENO[0]} :: ${BASH_SOURCE[1]}"
			exit 33
		fi

		eval "${__named__/]/}=\"${__value__}\"" || echo "[*] Error"
	}
	
	class()
	{
		defclass="$1"
		eval CLASS_${defclass}_VARS="" CLASS_${defclass}_FUNCTIONS=""

		public:()
		{
			local __OBJ__="${3#[*}"
			local __OBJ__="${__OBJ__%]*}"

			if [[ "$1" == "app" || "$1" == "APP" ]]; then true
			else
				echo "[!] Syntax Error: Syntax Error public: ${@} >> [$1] Error"
				echo "[!] From: [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
				exit 33
			fi

			if [[ "$2" != "=>" ]]; then
				echo "[!] Syntax Error: Syntax Error public: ${@} >> [$2] Error"
				echo "[!] From: [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
			else {
				local varname="CLASS_${defclass}_FUNCTIONS"
				eval "$varname=\"\${$varname}$__OBJ__ \""
				#echo "$__OBJ__"
			};fi
		}

		self.var()
		{
			local varname="CLASS_${defclass}_VARS"
			eval "${varname}=\"\${${varname}}$1 \""
		}

		static()
		{
			return 0
		}

		loadvar()
		{
			eval "varlist=\"\$CLASS_${CLASS}_VARS\""
			for var in ${varlist};do
				eval "${var}=\"\$INSTANCE_${THIS}_VARS\""
			done
		}

		this:loadfunc()
		{
			eval "funclist=\"\$CLASS_${CLASS}_FUNCTIONS\""
			for func in ${funclist}; do
				eval alias ${func}="${CLASS}::${func}"
			done
		}

		savevar()
		{
			eval "varlist=\"\$CLASS_${CLASS}_VARS\""
			for var in ${varlist}; do
				eval "INSTANCE_${THIS}_$var=\"\$$var\""
			done
		}

		typeof()
		{
			eval echo \$TYPEOF_$1
		}
	}
	
		sys:path()
		{
			pwd
		}
		
		main:class()
		{
			local class="$1"
			local cvar="$2"
			local id=$(uuid|tr "A-F" a-f|sed 's/-//g'|sed 's/=//g')
			shift
			shift
			eval TYPEOF_${id}=$class
			eval $cvar=$id
			local funclist
			eval "funclist=\"\$CLASS_${class}_FUNCTIONS\""
			#echo "${funclist}"
			for func in `echo "${funclist}"`; do
			#	echo "${cvar}.${func}"
				alias "$func"="${class}::${func}"
				alias "${cvar}.${func}"="t=\$this; this=\$id; c=\sCLASS; CLASS=$class; loadvar; this:loadfunc; rt=\$?; savevar; CLASS=\$c; this=\$t; ${class}::${func}"
			done || eval "${cvar}.${func} \$*" || true
		}

		const:()
		{
			if [[ "$2" != "=>" ]]; then
				echo "[!] Syntax Error: Syntax Error public: ${@} >> [$2] Error"
				echo "[!] From: [${BASH_LINENO[0]}:${BASH_SOURCE[1]}]"
				exit 33
			fi

			main:class "$1" "$3"
		}

		alias def:="function"
		io.write()
		{
			printf "$@"
		}

	#set -o pipefail
	shopt -s expand_aliases
	declare -ig __insideTryCatch__=0
	__shell_opts=$-
	# system try
	system.try(){
		[[ "$__insideTryCatch__" -gt 0 ]] || __shell_opts=$(echo $- | sed 's/[is]//g'); __insideTryCatch__+=1; set +e
	}

	# system clean
	system.clean(){
		local exitcod=$?

		exit $exitcod
	};
	# system get last exception
	excep.getlast(){
		echo "${BASH_SOURCE[2]}#./\n${BASH_LINENO[0]}"
	};

	excep.ekstrak(){
		local val=$1

		unset __Tryresult__

		if [[ $val -gt 0 ]]; then
			local IFS=$'\n'
			__EXCEPTION__=( $(excep.getlast) )

			local __LINE__=1
			local __SOURCE__=0
		fi; return 0
	};

	alias try='system.try; ( set -e; true;'
	alias catch='); declare __Tryresult__=$?; __insideTryCatch__+=-1; [[ $__insideTryCatch__ -lt 1 ]] || set -${__shell_opts:-e} && excep.ekstrak $__Tryresult__ || '

}

sys:throw()
{
	eval "cat <<< \"[**] ${e} ${BASH_SOURCE[1]}:${BASH_LINENO[0]}\"; read -s -N 1"
}

sys:Debug(){ :; }

@return:(){
	local __vars__=$(echo "$@"|sed 's/:/_/g')
	local __vars__="${__vars__#[*}"
	local __vars__="${__vars__%]*}"

	eval "echo \"\$${__vars__}\""
}


shopt -s expand_aliases
alias public="function"
alias Namespace="sys::Namespace"
alias Bash.import:="sys::import"
alias @require:="source"
