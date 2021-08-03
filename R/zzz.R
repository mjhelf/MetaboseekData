.onAttach <- function(libname, pkgname) {
  #utils::data("isotopes", package = "enviPat", envir = as.environment("package:Metaboseek"))
  
 packageStartupMessage(
    paste("\nWelcome to MetaboseekData version",
          utils::packageVersion("MetaboseekData"),
          "\nVisit our websites: http://metaboseek.com and https://github.com/mjhelf/Metaboseek\n"))
  
  
}

.onLoad <- function(libname, pkgname) {
  
  options(scipen = 5)

  #MseekOptions()
  
    #Update example ms file locations
  if(dirname(system.file(package = "MetaboseekData")) %in% .libPaths()
     && !file.exists(system.file("extdata", "examples", "example_projectfolder", "filegroups.csv", package = "MetaboseekData"))){
    rawgroups <- read.csv(system.file("extdata", "examples", "example_projectfolder", "filegroups_base.csv", package = "MetaboseekData"), stringsAsFactors = F, row.names = 1)
    rawgroups$File <- file.path(system.file("extdata", "examples", package = "MetaboseekData"), rawgroups$File)
    write.csv(rawgroups, file.path(system.file("extdata", "examples", "example_projectfolder", package = "MetaboseekData"), "filegroups.csv"))
    #write.csv(rawgroups[rawgroups$Group != "MS2",], file.path(system.file("extdata", "examples", "example_projectfolder", package = "Metaboseek"), "filegroups_ms1.csv"))
   # write.csv(rawgroups[rawgroups$Group == "MS2",], file.path(system.file("extdata", "examples", "example_projectfolder", package = "Metaboseek"), "filegroups_ms2.csv"))
  }
  
  
}