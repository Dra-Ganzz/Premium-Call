#!/data/data/com.termux/files/usr/bin/bash

mode.bold:(){
	local color=$1

	  case $color in
	            merah){ (io.write "\e[1;91m") }
	                   return 0 ;;
	            hijau){ (io.write "\e[1;92m") }
	                   return 0 ;;
	            kuning){ (io.write "\e[1;93m") }
	                   return 0 ;;
	            biru){ (io.write "\e[1;94m") }
	                  return 0 ;;
	            pink){ (io.write "\e[1;95m") }
	                   return 0 ;;
	            cyan){ (io.write "\e[1;96m") }
	                  return 0 ;;
	            putih){ (io.write "\e[1;97m") }
	                  return 0 ;;
	            ungu){ (io.write "\033[1;38;5;99m") }
	                   return 0 ;;
	            *)e="[**] Error $1 \n\tsepertinya argument tidak ada di daftar list\n\t\t[Index error] "
	              io.writeN "$e" ;;
	           esac
}

mode.normal:(){
      local color=$1

          case $color in
                    hitam)io.write "\e[90m" ;;
                    merah){ (io.write "\e[91m") }
                           return 0 ;;
                    hijau){ (io.write "\e[92m") }
                           return 0 ;;
                    kuning){ (io.write "\e[93m") }
                           return 0 ;;
                    biru){ (io.write "\e[94m") }
                          return 0 ;;
                    pink){ (io.write "\e[95m") }
                           return 0 ;;
                    cyan){ (io.write "\e[96m") }
                          return 0 ;;
                    putih){ (io.write "\e[97m") }
                          return 0 ;;
                    ungu){ io.write "\e[38;5;99m"; }
                         return 0 ;;
                    *)e="[**] Error $1 \n\tsepertinya argument tidak ada di daftar list\n\t\t[Index error] "
                      io.writeN "$e" ;;
                   esac
           }

default.color(){
	io.write "\e[00m"
}

shopt -s expand_aliases

alias mode::bg.merah='io.write "\033[0;1;41m"'
alias mode::bg.hijau='io.write "\033[0;1;42m"'
alias mode::bg.kuning='io.write "\033[0;1;43m"'
alias mode::bg.biru='io.write "\033[0;1;44m"'
alias mode::bg.pink='io.write "\033[0;1;45m"'
alias mode::bg.cyan='io.write "\033[0;1;46m"'
alias mode::bg.putih='io.write "\033[0;1;47m"'
alias mode::bg.ungu="io.write '\033[0;1;48;5;99m'"
alias mode::Source.bold='io.write "\033[1m"'
alias mode::Source.invis='io.write "\033[8m"'
alias mode::Source.dim='io.write "\033[2m"'
alias mode::Source.italic='io.write "\033[3m"'
alias mode::Source.bawahline='io.write "\033[4m"'
alias mode::Source.invert='io.write "\033[7m"'

# Counter

alias anti.bold="io.write '\033[21m'"
alias anti.dim="io.write '\033[22m'"
alias anti.italic="io.write '\033[23m'"
alias anti.bawahline="io.write '\033[24m'"
alias anti.invert="io.write '\033[27m'"
alias anti.invis="io.write '\033[28m'"

# bg mode merah

alias mode::bg.merah.hijau="mode::bg.merah; mode::bold hijau"
alias mode::bg.merah.merah="mode::bg.merah; mode::bold merah"
alias mode::bg.merah.kuning="mode::bg.merah; mode::bold kuning"
alias mode::bg.merah.biru="mode::bg.merah; mode::bold biru"
alias mode::bg.merah.pink="mode::bg.merah; mode::bold pink"
alias mode::bg.merah.cyan="mode::bg.merah; mode::bold cyan"
alias mode::bg.merah.putih="mode::bg.merah; mode::bold putih"

# bg mode hijau

alias mode::bg.hijau.merah="mode::bg.hijau; mode::bold merah"
alias mode::bg.hijau.hijau="mode::bg.hijau; mode::bold hijau"
alias mode::bg.hijau.kuning="mode::bg.hijau; mode::bold kuning"
alias mode::bg.hijau.biru="mode::bg.hijau; mode::bold biru"
alias mode::bg.hijau.pink="mode::bg.hijau; mode::bold pink"
alias mode::bg.hijau.cyan="mode::bg.hijau; mode::bold cyan"

: '
<comming soon>'
