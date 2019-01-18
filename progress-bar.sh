#/bin/bash

# Approximate duration of progress bar in seconds
s=${1:-3}

interval=0.01
iterations=$(bc <<<"$s/$interval")

echo -n "[                                                  ]   0% "

for i in $(seq 0 "$iterations"); do
  percent=$(($i*100/$iterations))
  bars=$((50*$percent/100))
  printf '\e7\e[%dD%d\e8' $((${#percent}+2)) "$percent"
  [[ "$bars" -gt 0 ]] && printf "\e7\e[G\e[%dC#\e8" "$bars"
  sleep "$interval"
done

echo "✅"
