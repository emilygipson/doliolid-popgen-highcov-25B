# Doliolid_25B pipeline: raw reads to QC and trimming

rule all:
    input:
        "fastqc_raw/DD_6_26.1_fastqc.html"

rule fastqc_raw:
    input:
        "/scratch/eeg37520/Doliolid_25B/DD_6_26.1.fq.gz"
    output:
        html="fastqc_raw/DD_6_26.1_fastqc.html",
        zip="fastqc_raw/DD_6_26.1_fastqc.zip"
    shell:
        """
        module load FastQC
        fastqc -o fastqc_raw {input}
        """
