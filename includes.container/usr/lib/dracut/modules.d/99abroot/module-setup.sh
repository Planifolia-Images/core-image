#!/bin/bash

check() {
    return 0
}

depends() {
    echo systemd plymouth
    return 0
}

install() {
    inst_multiple abroot jq

    # Add abroot configs
    inst_simple /etc/abroot/abroot.json /etc/abroot/abroot.json
    inst_simple /usr/share/abroot/abroot.json /usr/share/abroot/abroot.json

    # Install services
    inst_simple "$moddir/abroot-unlock-var.service" "$systemdsystemunitdir/abroot-unlock-var.service"
    inst_simple "$moddir/abroot-mount-sys.service" "$systemdsystemunitdir/abroot-mount-sys.service"
    $SYSTEMCTL -q --root "$initdir" enable abroot-unlock-var.service
    $SYSTEMCTL -q --root "$initdir" enable abroot-mount-sys.service
}
