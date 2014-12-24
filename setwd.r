#  This overloads base::setwd to dynamically change prompt,
# similar to toys available in bash
#choose either full path or just local directory 
setwd<-function(dir,fullpath=TRUE,dontchange=FALSE) {
	base::setwd(dir)
# For those who prefer to keep whatever prompt they have:
	if(dontchange) return(invisible())
	prpth <- if(fullpath) getwd() else (basename(getwd() ))
	options(prompt=paste(prpth,'\n> ',sep=""))
	}