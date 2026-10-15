#!/bin/bash
#SBATCH --job-name=smk_25B_controller
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --time=72:00:00
#SBATCH --output=/scratch/eeg37520/Doliolid_25B/snakemake_25B/logs/controller_%j.out
#SBATCH --error=/scratch/eeg37520/Doliolid_25B/snakemake_25B/logs/controller_%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=eeg37520@uga.edu

cd /scratch/eeg37520/Doliolid_25B/snakemake_25B || exit 1

module purge
module load snakemake/9.22.0-foss-2025b

snakemake --profile profiles/slurm
