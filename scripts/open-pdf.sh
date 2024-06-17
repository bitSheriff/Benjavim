#! /bin/sh

compile $1
ps -C "zathura\ $1" || zathura $1
