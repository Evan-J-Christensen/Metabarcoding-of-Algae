# test branch

#!/bin/bash
source ~/Metabarcoding-of-Algae/code/qiime2_parameters.sh

### See qiime2_parameters.sh for cutadapt parameters and 01_trim.sh for polyG filter parameters.
qiime cutadapt trim-paired \
    --i-demultiplexed-sequences data/results/${projname}_demux.qza \
    --p-error-rate 0.12 \
    --o-trimmed-sequences results/${projname}_demux_cutadapt.qza \
    --p-cores 4 \
    "${cutadapt_config}" \
    --p-discard-untrimmed \
    --p-match-adapter-wildcards \
    --verbose 

qiime demux summarize \
    --i-data results/${projname}_demux_cutadapt.qza \
    --o-visualization results/${projname}_demux_cutadapt.qzv
