#! /bin/sh
# -*- encoding: utf-8 -*-
#
# Written by Alexis de Lattre <alexis.delattre@akretion.com>

# Example of wrapper for set_name_agi.py which makes sure that the
# script doesn't take too much time to execute

# Limiting the execution time of set_name_agi.py is important because
# the script is designed to be executed at the beginning of each
# incoming or outgoing phone call... and if the script get stucks, the
# phone call will also get stucks !

# For Debian Lenny and Ubuntu Lucid, you need to install the package "timeout"
# For Ubuntu >= Maverick and Debian >= Squeeze, the "timeout" command is shipped
# in the "coreutils" package

# The first argument of the "timeout" command is the maximum execution time
# In this example, we chose 2 seconds.

# To test this script manually (i.e. outside of Asterisk), run :
# echo "agi_callerid:0141401242"|openerp_popup_timeout.sh
# where 0141401242 is a phone number that could be presented by the calling party
this="$(cd $(dirname $0) && pwd )"
PATH=/usr/local/sbin:/usr/local/bin:/var/lib/asterisk/agi-bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/share/asterisk/agi-bin:$this
timeout 2s set_name_agi.py --server $1 --database $2 --user-id $3 --password $4 --notify $6
