#!/bin/sh

lvm lvs vos-root
if [ $? -ne 0 ]; then
    exit 0
fi

lvm lvchange -a y /dev/vos-root/root
if [ $? -eq 0 ]; then
    exit 0
fi

lvm lvconvert --repair /dev/vos-root/root

lvm lvchange -a y /dev/vos-root/root
lvm lvchange -a y /dev/vos-root/root-a
lvm lvchange -a y /dev/vos-root/root-b

exit 0
