#!/bin/bash
conda activate qiime2-amplicon-2026.1

source ~/Metabarcoding-of-Algae/code/qiime2_parameters.sh

qiime tools import \
    --type "SampleData[PairedEndSequencesWithQuality]"  \
    --input-format CasavaOneEightSingleLanePerSampleDirFmt \
    --input-path data/poly-G-trimmed \
    --output-path data/results/${projname}_demux 

### See qiime2_parameters.sh for cutadapt parameters and 01_trim.sh for polyG filter parameters.
qiime cutadapt trim-paired \
    --i-demultiplexed-sequences data/results/${projname}_demux.qza \
    --p-error-rate 0.12 \
    --o-trimmed-sequences data/results/${projname}_demux_cutadapt.qza \
    --p-cores 4 \
    --p-front-f ${fws} \
    --p-front-r ${rvs} \
    --p-discard-untrimmed \
    --p-match-adapter-wildcards \
    --verbose

qiime demux summarize \
    --i-data data/results/${projname}_demux_cutadapt.qza \
    --o-visualization data/results/${projname}_demux_cutadapt.qzv
