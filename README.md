# API

## Usage (AIME or BIFO server)

1. download a GenomeNet model and change path to it in `deploy.R`
2. tunnel port to you local machine in case you use AIME `ssh -L 9000:localhost:9000 aime@192.168.178.59`
3. `Rscript deploy.R`
4. navigate to http://127.0.0.1:9000/__docs__/ where you can upload a `.fasta` file

## AWS

1. you need at least an `t2.medium` instance
2. connect via ssh, in our case `ssh -i key.pem ubuntu@ec2-54-93-203-100.eu-central-1.compute.amazonaws.com`
3. install `deepG` according to Notion documentation, but use non-GPU versions when installing TF via conda
