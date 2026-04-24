#!/bin/bash
source ~/Metabarcoding-of-Algae/code/qiime2_parameters.sh

qiime feature-classifier classify-hybrid-vsearch-sklearn \
  --i-query results/${projname}_rep-seqs.qza \
  --i-classifier ${sklearn} \
  --i-reference-reads ${refreads} \
  --i-reference-taxonomy  ${reftax} \
  --p-threads ${threads} \
  --p-query-cov ${query_cov} \
  --p-perc-identity ${perc_identity} \
  --p-maxrejects all \
  --p-maxaccepts ${maxaccepts} \
  --p-maxhits all \
  --p-min-consensus 0.51 \
  --p-confidence 0.7 \
  --o-classification results/${projname}_hybrid_taxonomy