#/bin/bash

logfile="${XDG_CACHE_HOME:-$HOME/.cache}/netlog"
[ -f "$logfile" ] || echo "0 0" > "$logfile"
read -r rxprev txprev < "$logfile"

rxcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/rx_bytes)))"
txcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/tx_bytes)))"

rxformatted="$(numfmt --to=iec-i --suffix=B $(((rxcurrent-rxprev))))"
txformatted="$(numfmt --to=iec-i --suffix=B $(((txcurrent-txprev))))"

echo "$rxformatted/$txformatted"

echo "$rxcurrent $txcurrent" > "$logfile"
