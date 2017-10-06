#!/bin/bash
prefix=$(pwd)
relpath=${1#$prefix}

scp  $1 root@odoo-ansit-com.raxx24.de:/opt/odoo/v9/addons$relpath
