options("encoding" = "UTF-8")
xconfig <- function(json_path="")
{
  #if let's use json_path option
  if(json_path != "")
  {
    file_name = basename(json_path);
    #get extention
    tmp = strsplit(file_name,'[.]')[[1]];
    ext = tmp[length(tmp)];
    if(ext == "json")
    {
      destination = paste(.libPaths()[1],"/x.ent/www/config/",sep="");
      
      file.copy(json_path,destination,overwrite = TRUE)
      #if file name uploaded est different with the file name ini.json of x.ent
      if(file_name != "ini.json")
      {
        file.rename(file.path(destination, file_name),file.path(destination, "ini.json"))
      }
    }
    else
    {
      print("File name must be a text file in JSON format. X.ent will use the default configuration file.")
    }
  }
    opencpu$browse("/library/x.ent/www/config.html")  
}
save_config <- function(data = "")
{
  if(data == ""){
    stop("Data is empty!")
  }
  else
  {
    #message = paste("Save data successful!", R.Version()$version.string)  
    write(data,paste(.libPaths()[1],"/x.ent/www/config/ini.json",sep="")) 
  }
}