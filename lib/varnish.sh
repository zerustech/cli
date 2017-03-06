#!/bin/bash

# This file is part of the ZerusTech HTTP Cache Tutorial package.
# 
# (c) Michael Lee <michael.lee@zerustech.com>
#
# For the full copyright and license information, please view the LICENSE file 
# that was distributed with this source code.

varnish_base=`cd $(dirname $BASH_SOURCE) && pwd`
source $varnish_base/tty.sh

# This script provides functions for starting and stopping varnish cache server.
# 
# @author Michael Lee <michael.lee@zerustech.com>

# This function starts a varnish cache server.
#
# Usage: varnish_start varnish_home http_hos>:http_port varnish_host:varnish_port key_file config_file pid_file [arguments ...]
#
# @param varnish_home The home directory of varnish.
# @param http_socket The <host>:<port> of varnish frontend.
# @param varnish_socket The <host>:<port> of varnish backend.
# @param key_file The varnish security file.
# @param config_file The varnish configuration file.
# @param pid_file The file that will store the varnish server's PID.
# @param arguments Additional arguments
function varnish_start
{
    local varnish_home=$1
    local http_socket=$2
    local varnish_socket=$3
    local key_file=$4
    local config_file=$5
    local pid_file=$6

    shift 6

    tty_printf "Starting varnish server ... "

    sudo $varnish_home/sbin/varnishd \
        -j unix,user=nobody \
        -a $http_socket \
        -T $varnish_socket \
        -s malloc,256M \
        -S $key_file \
        -f $config_file \
        -P $pid_file $@

    tty_printf -f green "done"
}

# This function stops a varnish cache server.
#
# Usage: varnish_stop pid_file
#
# @param pid_file The file that will store the varnish server's PID.
function varnish_stop
{
    local pid_file=$1

    if [ -f $pid_file ]; then

        tty_printf "Stopping varnish ... "

        sudo kill -9 `cat $pid_file` >& /dev/null && sudo rm -f $pid_file

        tty_printf -f green "done"

    fi
}
