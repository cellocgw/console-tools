#Based on code written by dash2@stackoverflow,  with advice from Ben Bolker
# (search StackOverflow for "visibull")
# this automagically updates info on the named object whenever it changes.
watchit<-function(seeit) {
#check for existence,  which isn't allowed
isit<-as.character(substitute(seeit))
if (exists(isit, where=.GlobalEnv) ) stop("Can't bind to existing object.")
dotname<-(paste0('.', isit))
makeActiveBinding(as.character(substitute(seeit)),  function(dumnam) {
    if (! missing(dumnam)) { 
	     #yeah I know sloppy 
	     eval(parse(text=paste0(dotname, '<<-dumnam')))
	     # Could choose other options besides "View()" here
	     View(get(dotname), title=dotname)
	     # For "first time thru",  create dotname as well
 		} else if(exists(dotname,  where=.GlobalEnv)) {
    		get(dotname)  
    		} else  eval(parse(text=paste0(dotname, '<-NA')))  #.seeit
	},  .GlobalEnv)
}
