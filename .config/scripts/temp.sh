#!/bin/sh
sensors | awk '/^Package id 0/ {print $4}'  | cut -c 2- | sed 's/.\{4\}$//' | sed s/$/°/
