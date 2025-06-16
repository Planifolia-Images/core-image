#!/bin/bash

check() {
    return 0
}

depends() {
    echo lvm
}

install() {
    inst /usr/sbin/pdata_tools /usr/sbin/pdata_tools
    inst_hook pre-mount 50 "$moddir/lvm-fix.sh"
}
