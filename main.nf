#!/usr/bin/env nextflow

params.in = "/home/cs16golf/Desktop/cpic/data/sample/390.vcf.gz"

process vcfConversion {

    input:
    path vcf from params.in

    output:
    stdout result

    conda "/home/cs16golf/anaconda3/envs/cpic"

    """
    tabix $vcf
    python /home/cs16golf/Desktop/cpic/cpic/vcf/vcf_region_query.py $vcf
    """
}

result.subscribe { print "$it" }
