#!/data/data/com.termux/files/usr/bin/bash


class __warn__;{
	{
		public: app =\> [warn]
		public: app =\> [info]
		public: app =\> [error]
	}

	public __warn__::warn(){
		var tst = "$@"
		io.write "\033[90m[\033[93mWARN\033[90m]\033[0m ${tst}\n"
	}

	public __warn__::info()
	{
		var tst = "$@"
		io.write "\033[90m[\033[92mINFO\033[90m]\033[0m ${tst}\n"
	}

	public __warn__::error()
	{
		var tst = "$@"
		io.write "\033[90m[\033[91mERROR\033[90m]\033[0m ${tst}\n"
	}
}

# const: __warn__ =\> log
