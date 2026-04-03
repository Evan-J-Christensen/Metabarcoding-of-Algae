#!/bin/bash

## qiime2 parameters for each metabarcode


## RBCL
    
    fw1="^AGGTGAAGTAAAAGGTTCWTACTTAAA"
    fw2="^AGGTGAAGTTAAAGGTTCWTAYTTAAA"
    fw3="^AGGTGAAACTAAAGGTTCWTACTTAAA"
 
    rv1="^CCTTCTAATTTACCWACWACTG"
    rv2="^CCTTCTAATTTACCWACAACAG"

    cutadapt_config="--p-front-f $fw1 --p-front-f $fw2 --p-front-f $fw3 --p-front-r $rv1 --p-front-r $rv2"


    polyg_len=150
    
    ## denoise
    ## trunc
    trunclenr=200
    trunclenf=200
    ## trim
    trimleftf=0
    trimleftr=0

    overlap=12

    ## taxonomy
    maxaccepts=all
    query_cov=0.80 
    perc_identity=0.80
    weak_id=0.50 
    #tophit_perc_identity=0.90

    refreads=${refreads:-/home/unhAW/jtmiller/watts/ref-database/rbcl/diat_barcode_v10_263bp-seqs.qza}
    reftax=${reftax:-/home/unhAW/jtmiller/watts/ref-database/rbcl/diat_barcode_v10_263bp-tax.qza}
    blastdb=${blastdb:-/home/unhAW/jtmiller/watts/ref-database/rbcl/blast_diat.barcode}
    sklearn=${sklearn:-/home/unhAW/jtmiller/watts/ref-database/rbcl/diat_barcode_v10_263bp-sklearn-classifier.qza}


### 18s
	
    overlap=10
    fw='GTACACACCGCCCGTC'
    rv='TGATCCTTCTGCAGGTTCACCTAC'

    cutadapt_config="--p-front-f $fw --p-front-r $rv"

    echo $cutadapt_config

    ## denoise
    polyg_len=85

    ## taxonomy
    maxaccepts=10
    query_cov=0.8 
    perc_identity=0.90 
    weak_id=0.80
    
    ## trunc
    trunclenf=85 
    trunclenr=85

    ## trim
    trimleftf=0
    trimleftr=0

    reftax=${reftax:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-tax.qza}
    refreads=${refreads:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-seqs-pid_0.65-extracted.qza}
    sklearn=${sklearn:-/home/users/jtm1171/refdbs/18s/SILVA/silva-138-99-seqs-pid_0.65-classifier.qza}
 
    min=50
    max=175


