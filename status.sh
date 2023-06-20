#!/bin/bash

###
#Bash scripts that checks:
# - Memory Usage
# - CPU load
# - Number of TCP connections
# - Kernel version
###


server_name=$(hostname)

function memory_check() {
    echo ""
    echo "The current memory usage on ${server_name} is: "
    free -h
    echo ""
}

function cpu_check() {
    echo ""
    echo "The current cpu load on ${server_name} is: "
    uptime
    echo ""
}

function tcp_check() {
    echo ""
    echo "TCP connections on ${server_name}: "
    echo ""
    cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
    echo "The current kernel version on ${server_name} is: "
    uname -r
    echo ""
}

function all_checks() {
    memory_check
    cpu_check
    tcp_check
    kernel_check
}

#Call the function
all_checks

