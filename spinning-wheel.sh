#!/bin/bash

# Number of full spins
n=${1:-5}

a=('|' '/' '-' '\')
echo -n "My spinning wheel: "

for i in $(seq 0 $((8*n))); do
  [[ "$i" -gt 0 ]] && printf '\e[2D'
  echo -n "${a[$(($i%4))]} "
  sleep 0.1
done

echo
