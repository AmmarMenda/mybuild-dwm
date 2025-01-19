#/bin/sh

status () { 

  echo -n "CPU:$(lscpu -e=CPU,MHZ |awk '{print $2}'|tail -n1)mHz|"TMP:$(sensors |awk '{print $2}'|tail -n 5|tail -n 2)"|BAT:$(acpi|awk '{print $3}')$(acpi|awk '{print $4}')|$(date +"%I:%M:%S %p")|$(xset -q |grep Cap|awk '{print $2 $3 $4}')|$(xset -q |grep Cap|awk '{print $6 $7 $8}')"
}

while :; do
	
	xsetroot -name "$(status)"
	sleep 1

done
