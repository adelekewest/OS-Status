#!/bin/bash

##
#Bash scripts that checks:
# - Memory Usage
# - CPU load
# - Number of TCP connections
# - Kernel version
##

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

##
# Color Variables
##

green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

colorGreen() {
    echo -ne "$green$1$clear"
}

colorBlue() {
    echo -ne "$blue$1$clear"
}

##
# Interactive Menu
##

menu() {
    echo -ne "
    My First Menu
    $(colorGreen '1)') Memory Usage
    $(colorGreen '2)') CPU Load
    $(colorGreen '3)') Number of TCP Connections
    $(colorGreen '4)') Kernel Version
    $(colorGreen '5)') Check all
    $(colorGreen '0)') Exit
    $(colorBlue 'Choose an option:') "
        read a
        case $a in 
        1) memory_check ; menu ;;
        2) cpu_check ; menu ;;
        3) tcp_check ; menu ;;
        4) kernel_check ; menu ;;
        5) all_checks ; menu ;;
        0) exit 0 ;;
        *) echo -e $(colorBlue "Wrong option. Choose again") ; menu ;;
    esac
    }

    #Call the menu function
    menu

   