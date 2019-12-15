#!/bin/bash

dotnet fake build --parallel 3 > output.txt 2> error.txt &
#echo "wtf123" > output.txt &

pid=$!
while kill -0 $pid; do
    printf '.' > /dev/tty
    sleep 2
done

exitCode=`wait $pid`

tail -n 1000 output.txt
tail -n 1000 error.txt
printf "\nExitted with ${pid}" > /dev/tty

exit ${pid}
