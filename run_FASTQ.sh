#!/bin/bash
snakemake -s Snakefile_1 -j && for i in sequencing/trimmed_sortedreads/*.bam; do echo $i; tools/RtN/Nix_binary/rtn -h tools/RtN/humans.fa -n tools/RtN/Calabrese_Dayama_Smart_Numts.fa -b $i; done && snakemake -s Snakefile_2 -j
