function compile-planck {
    rm -rf ~/qmk_firmware/keyboards/planck/keymaps/dpitty
    cp ~/projects/qmk_keymaps/planck/dpitty ~/qmk_firmware/keyboards/planck/keymaps/dpitty
    qmk compile -kb planck/rev3 -km dpitty
}

function compile-corne {
    rm -rf ~/qmk_firmware/keyboards/crkbd/keymaps/dpitty
    cp ~/projects/qmk_keymaps/corne/dpitty ~/qmk_firmware/keyboards/crkbd/keymaps/dpitty
    qmk compile -kb crkbd/rev1 -km dpitty
}
