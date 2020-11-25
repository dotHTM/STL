#!/usr/bin/env bash
# docker_monitor.sh

announce_bin=`which figlet`
if [[ -z $announce_bin ]]; then
    echo fallback
    announce_bin=`which echo`
fi

announce(){
    message=$1 && shift
    echo '#########################################################'
    $announce_bin "$message"
    echo '#########################################################'
}

while (( 1 )); do
    clear
    docker-compose logs -f
    # clear
    announce 'Break'
    docker ps
    sleep 10
done


