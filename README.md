# API

## Usage (AIME or BIFO server)

1. download a GenomeNet model and change path to it in `deploy.R`
2. tunnel port to you local machine in case you use AIME `ssh -L 9000:localhost:9000 aime@192.168.178.59`
3. `Rscript deploy.R`
4. navigate to http://127.0.0.1:9000/__docs__/ where you can upload a `.fasta` file

## AWS

1. you need at least an `t2.medium` (Ubuntu 18.04) instance, even then its limited to small (<100k nt) sized fasta files
2. change EC2 security group and allow inbound/outbound connections
3. connect via ssh, in our case `ssh -i key.pem ubuntu@ec2-18-192-3-46.eu-central-1.compute.amazonaws.com`
4. Install deepG and API via

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
sudo apt update
sudo apt install r-base
sudo apt-get install libhdf5-dev libxml2-dev libcurl4-openssl-dev libsodium-dev
```

and in R

```r
install.packages(c("keras", "ggplot2", "tokenizers",
  "ArgumentCheck", "readr", "tm", "abind", "stringr",
  "xfun", "plyr", "yardstick", "hdf5r", "BiocManager",
  "Rtsne", "remotes", "microseq", "fs"))
remotes::install_github("https://github.com/r-tensorflow/wavenet")
install_tensorflow(version = "2.0.0") #/home/ubuntu/.local/share/r-miniconda
remotes::install_github("genomenet/deepG", auth_token = "82c89481e1915fe45880bf90d462feadb34bd770")
```

5. run `sudo Rscript aws_deploy.R`
