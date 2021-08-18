#!/bin/bash
snakemake -s Snakefile_1 -j && cd ~/Documents/sequencing/trimmed_sortedreads/ && for i in *.bam; do echo $i; ~/Documents/sequencing/RtN/Nix_binary/rtn -h ~/Documents/sequencing/RtN/humans.fa -n ~/Documents/sequencing/RtN/Calabrese_Dayama_Smart_Numts.fa -b $i; done && cd ~/Documents/ && snakemake -s Snakefile_2 -j
