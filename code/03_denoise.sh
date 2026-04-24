#!/bin/bash
source ~/Metabarcoding-of-Algae/code/qiime2_parameters.sh

echo "begin denoise..."

qiime dada2 denoise-paired \
    --i-demultiplexed-seqs results/${projname}_demux_cutadapt.qza  \
    --p-trunc-len-f ${trunclenf} \
    --p-trunc-len-r ${trunclenr} \
    --p-trim-left-f ${trimleftf} \
    --p-trim-left-r ${trimleftr} \
    --p-n-threads ${threads} \
    --p-pooling-method 'pseudo' \
    --p-min-overlap ${overlap} \
    --p-allow-one-off \
    --o-denoising-stats results/${projname}_dns \
    --o-table results/${projname}_table \
    --o-representative-sequences results/${projname}_rep-seqs \
