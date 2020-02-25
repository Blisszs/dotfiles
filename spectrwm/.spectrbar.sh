#!/usr/bin/bash

clock() {
    date '+%Y-%m-%d %H:%M'
}


while true; do
    echo -e "\uf017 $(clock)"
    sleep 1
done

