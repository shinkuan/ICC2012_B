setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false \
    -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3
streamout Design_CHIP.gds -mapFile /mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/SOCE/streamOut.map \
    -merge { /mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/Phantom/fsa0m_a_generic_core_cic.gds \
        /mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/Phantom/fsa0m_a_t33_generic_io__cic.gds \
        /mnt4/CBDK018_UMC_Faraday_v1.1_all/CBDK018_UMC_Faraday_v1.1/CIC/Phantom/BONDPAD.gds } \
    -stripes 1 -units 1000 -mode ALL