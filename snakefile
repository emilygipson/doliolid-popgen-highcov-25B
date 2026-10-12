# Doliolid_25B pipeline: raw reads to QC and trimming

RAW_DIR = "/scratch/eeg37520/Doliolid_25B"

wildcard_constraints:
    sample="[^/]+",
    pair="[12]"

SAMPLES, PAIRS = glob_wildcards(RAW_DIR + "/{sample}.{pair}.fq.gz")

rule all:
    input:
        "multiqc_raw/multiqc_raw_Doliolid_25B.html"

rule fastqc_raw:
    input:
        RAW_DIR + "/{sample}.{pair}.fq.gz"
    output:
        html="fastqc_raw/{sample}.{pair}_fastqc.html",
        zip="fastqc_raw/{sample}.{pair}_fastqc.zip"
    resources:
        mem_mb=10000,
        runtime=120
    shell:
        """
        module load FastQC
        fastqc -o fastqc_raw {input}
        """

rule multiqc_raw:
    input:
        expand("fastqc_raw/{sample}.{pair}_fastqc.zip", zip, sample=SAMPLES, pair=PAIRS)
    output:
        "multiqc_raw/multiqc_raw_Doliolid_25B.html"
    resources:
        mem_mb=10000,
        runtime=120
    shell:
        """
        module load MultiQC
        multiqc -o multiqc_raw -n multiqc_raw_Doliolid_25B.html {input}
        """
