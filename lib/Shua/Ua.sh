#!/data/data/com.termux/files/usr/bin/bash

class __SHUA__;{
	{
		public: app =\> [random]
	}

	def: __SHUA__::random()
	{
		generate__ua=$(bash <<< $({ cat << __EOF__
							curl --silent \
								 --location \
								 --request GET \
								 --header "user-agent: Mozilla/5.0 (Linux; Android 8.1.0; H96MAX+) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.96 Safari/537.36" \
								 --ssl \
								 --url "https://gist.githubusercontent.com/pzb/b4b6f57144aea7827ae4/raw/cf847b76a142955b1410c8bcef3aabe221a63db1/user-agents.txt" \
								 --insecure --compressed
__EOF__
			})
			#}|grep -Eo "<a href=\"[a-zA-Z0-9/%-_.+]*\" title=\".*\""|sed 's/<a[[:space:]]href="[a-zA-Z0-9/%-_.+]*"[[:space:]]title=//')
		)

		var set::random::ua = $(@return: [generate::ua]|sort -R|head -1)
		io.write "$(@return: [set::random::ua])"
		#@return: [generate::ua]
	}
}
