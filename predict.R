#* Log some information about the incoming request
#* @filter logger
function(req){
	  cat(as.character(Sys.time()), "-",
	          req$REQUEST_METHOD, req$PATH_INFO, "-",
		      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
  plumber::forward()
}

#* Predict sequence class
#* @param reg:file
#* @post /upload
function(req) {
	multipart <- mime::parse_multipart(req)
	fp <- purrr::pluck(multipart, 1, "datapath", 1)
	f_name <- purrr::pluck(multipart, 1, "name")
	u_path <- file.path("uploaded", f_name)
	fs::file_copy(fp, u_path)
	if (file.exists("states.h5")) 
  		file.remove("states.h5")
	prediction <- deepG::writeStates(model = model,
					 fasta.path = u_path,
					 batch.size = 100,
					 verbose = F,
					 returnStates = T,
					 mode = "label",
					 step = 10000, padding = T)
	if (file.exists(u_path))
		file.remove(u_path)
	return(prediction[,2])


}



