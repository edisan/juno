#!/bin/bash
#
# Copyright (c) 2020, Ed Sananikone. All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

IMG=$1
INPUT=$2
NB_HOME=/u01/notebooks

if [ "$IMG" = "" ];
then
    IMG=juno-base
fi

if [ "$INPUT" = "" ];
then
    docker cp $IMG:$NB_HOME .
else
    docker cp $INPUT $IMG:$NB_HOME
fi

