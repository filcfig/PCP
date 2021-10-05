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

Install the software above and clone this repo to your directory of choice (we used `~/Documents/`): 

```bash
git clone https://github.com/filcfig/PCP.git
```

Add the [`pycision.py`](https://github.com/Ahhgust/Pycision) file to the directory you have chosen to host the executable files in this repo. Add [`trimmomatic-0.39.jar`](https://github.com/usadellab/Trimmomatic) and clone [`RtN`](https://github.com/Ahhgust/RtN) to the `sequencing` folder. If you don't use `~/Documents/` as a base directory, please adjust the file `run_FASTQ.sh` accordingly.

## Usage

Start by adding the FASTQ files to the `sequencing/selected_fastqfiles` folder. Then, make `run_FASTQ.sh` executable and run it (make sure [Snakemake](https://snakemake.readthedocs.io/en/stable/) is activated):

```bash
chmod +x run_FASTQ.sh
./run_FASTQ.sh
```

If you wish to run FASTQ files **without** `RtN`, run `Snakefile_noRtN` instead:
```bash
snakemake -s Snakefile_noRtN -j
```
The final BAM files will be available at the `sequencing/merged` folder.

## Data
The data generated with samples previously sequenced within the 1000 Genome Project, are openly available in [Zenodo](https://zenodo.org/) at doi:10.5281/zenodo.5524539.

## Citation
Our manuscript is currently submitted to an open-source journal:

Cortes-Figueiredo, F.; Carvalho, F.S.; Fonseca, A.C.; Paul, F.; Ferro, J.M.; Schönherr, S.; Weissensteiner, H.; Morais, V.A.. From forensics to clinical research: expanding the variant calling pipeline for the Precision ID mtDNA Whole Genome Panel (submitted).

## License
Distributed under the [`MIT License`](https://choosealicense.com/licenses/mit/). See [LICENSE](/LICENSE) for more information.
