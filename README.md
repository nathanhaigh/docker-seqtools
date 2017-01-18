This `Dockerfile` contains the SeqTools from the [Sanger](http://www.sanger.ac.uk/science/tools/seqtools).

# Running on Linux

Prerequisits:

  1. [Docker Engine](https://docs.docker.com/engine/installation/#/on-linux)

```bash
# Pull the latest image for SeqTools v4.44.1
docker pull nathanhaigh/seqtools:4.44.1

####################
##### UNTESTED #####
####################
# Run a blixem example
docker run -it --env="DISPLAY" nathanhaigh/seqtools:4.44.1 \
  blixem --display-type="N" /opt/seqtools/examples/chr4_ref_seq.fasta /opt/seqtools/examples/chr4_dna_align.gff
```

# Running on Windows

Prerequisits:
  1. [Docker for Windows](https://docs.docker.com/docker-for-windows/#/download-docker-for-windows) OR [Docker Toolbox](https://docs.docker.com/toolbox/overview/)
  2. [Xming](https://sourceforge.net/projects/xming/) the X Window System Server for Windows

At a Windows command prompt, start the Xming X server with the `-ac` options. On my system, I can do the following:

```bat
"C:\Program Files (x86)\Xming\Xming.exe" -ac
```

Start the "Docker QuickStart Terminal" using the "Start menu". Now in the "Docker QuickStart Terminal" type:

```bash
# Pull the latest image for SeqTools v4.44.1
docker pull nathanhaigh/seqtools:4.44.1

##################
##### TESTED #####
##################
# Run a blixem example
# NOTE: Change <ip_address> to one of the VirtualBox Host Only IP Addresses. See `ipconfig` output.
docker run -it --env="DISPLAY=<ip_address>:0.0" nathanhaigh/seqtools:4.44.1 \
  blixem --display-type="N" /opt/seqtools/examples/chr4_ref_seq.fasta /opt/seqtools/examples/chr4_dna_align.gff
```
