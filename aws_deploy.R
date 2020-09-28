library(plumber)

library(reticulate)
library(tensorflow)
library(wavenet)
library(keras)
library(deepG)
library(microseq)

model <- keras::load_model_hdf5("Ep.027-val_loss0.11-val_acc0.961.hdf5")

genomenet_api <- plumber::plumb("predict.R")
genomenet_api$run(host = '0.0.0.0', port = 80, swagger = TRUE)
