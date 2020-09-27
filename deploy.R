library(plumber)

Sys.setenv(LD_LIBRARY_PATH = '/home/aime/anaconda3/envs/r-retriculate/lib/', required = T)
Sys.setenv(CUDA_VISIBLE_DEVICES = '0', required = T)

library(reticulate)
library(tensorflow)
library(wavenet)
library(keras)
library(deepG)
library(microseq)

use_python("/home/aime/anaconda3/bin/python", required = FALSE)
reticulate::use_condaenv("r-reticulate")

model <- keras::load_model_hdf5("virusnet.hdf5")

genomenet_api <- plumber::plumb("predict.R")
genomenet_api$run(host = '0.0.0.0', port = 9000, swagger = TRUE)
