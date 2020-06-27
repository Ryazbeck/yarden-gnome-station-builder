#! /usr/bin/env bash
pipe=networkHandlerPipe
# [ -p "$pipe" ] || mkfifo -m 0600 "$pipe" || exit 1
while :; do
    while read -r cmd; do
        if [ "$cmd" ]; then
            $cmd
        fi
    done <"$pipe"
done