#!/data/data/com.termux/files/usr/bin/bash

#Namespace Std :: Sys;

class __Say__;{
	{
		public: app =\> [Echo]
		public: app =\> [capital]
		public: app =\> [upper]
		public: app =\> [lower]
	}

	def: __Say__::Echo()
	{
		io.write "${@}\n"
	}

	def: __Say__::upper()
	{
		io.write "${@^^}\n"
	}

	def: __Say__::lower()
	{
		var args::str = $(echo "$@"|tr "A-Z" "a-z")

		io.write "${args__str}\n"
	}

	def: __Say__::capital()
	{
		io.write "${@^}\n"
	}
}

#const: __Say__ =\> say

#say.echo "halo world"
