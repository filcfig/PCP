# The PrecisionCallerPipeline (PCP)

The PCP pipeline automatically takes the FASTQ files from a sequencing facility using the Precision ID mtDNA Whole Genome Panel (Thermo Fisher Scientific, USA) and outputs fully aligned BAM files mapped to the commonly-used reference sequence rCRS.

## Prerequisites

We use a workflow based on [Snakemake](https://snakemake.readthedocs.io/en/stable/) in a Linux-based system with:
- Awk, for SAM file editing;
- [BEDTools](https://bedtools.readthedocs.io/en/latest/), for BAM to FASTQ conversion;
- [BWA-MEM](https://github.com/lh3/bwa), for read alignment;
- [Pycision](https://github.com/Ahhgust/Pycision), for amplicon delimitation and selection;
- [RtN!](https://github.com/Ahhgust/RtN), for NUMT removal;
- [SAMtools](https://github.com/samtools/samtools), for BAM conversion, sorting, indexing, and merging;
- [Trimmomatic](https://github.com/usadellab/Trimmomatic), for read quality control and trimming.

## Installation

Install the software above and clone this repo to your directory of choice: 

```bash
git clone https://github.com/filcfig/PCP.git
```

Add [`pycision.py`](https://github.com/Ahhgust/Pycision), [`trimmomatic-0.39.jar`](https://github.com/usadellab/Trimmomatic), and the [`RtN`](https://github.com/Ahhgust/RtN) folder (don't forget to perform `bunzip2 humans.fa.bz2 && bwa index humans.fa`) to the `tools` folder.

## Usage

Start by adding the FASTQ files to the `sequencing/selected_fastqfiles` folder. Then, make `run_FASTQ.sh` executable and run it (make sure [Snakemake](https://snakemake.readthedocs.io/en/stable/) is activated - if you use [`conda`](https://docs.conda.io/en/latest/), type `conda activate snakemake`):

```bash
chmod +x run_FASTQ.sh
./run_FASTQ.sh
```

Since running RtN requires some time per sample and a [good amount of RAM](https://github.com/Ahhgust/RtN/issues/1), it is possible to run FASTQ files **without** `RtN`, by running `Snakefile_noRtN` instead:

```bash
snakemake -s Snakefile_noRtN -j
```
The final BAM files will be available at the `sequencing/merged` folder.

## Data
The data generated with samples previously sequenced within the 1000 Genomes Project are openly available in [Zenodo](https://doi.org/10.5281/zenodo.5524539).

## Citation
Our manuscript is published at:
Cortes-Figueiredo, F.; Carvalho, F.S.; Fonseca, A.C.; Paul, F.; Ferro, J.M.; Schönherr, S.; Weissensteiner, H.; Morais, V.A. From Forensics to Clinical Research: Expanding the Variant Calling Pipeline for the Precision ID mtDNA Whole Genome Panel. Int. J. Mol. Sci. 2021, 22, 12031. [https://doi.org/10.3390/ijms222112031](https://doi.org/10.3390/ijms222112031).

## License
Distributed under the [`MIT License`](https://choosealicense.com/licenses/mit/). See [LICENSE](/LICENSE) for more information.
