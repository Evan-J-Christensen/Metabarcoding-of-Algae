#!/bin/bash
source ~/Metabarcoding-of-Algae/code/qiime2_parameters.sh

### import 
qiime tools import \
    --type "SampleData[PairedEndSequencesWithQuality]"  \
    --input-format CasavaOneEightSingleLanePerSampleDirFmt \
    --input-path reads/poly-G-trimmed \
    --output-path results/${projname}_demux 

qiime cutadapt trim-paired \
    --i-demultiplexed-sequences results/${projname}_demux.qza \
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



