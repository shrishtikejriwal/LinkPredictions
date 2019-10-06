library(igraph)

#read the dataset into the variable 'raw data' 
rawdata <- read.csv("Citation.txt" , header=FALSE) 

#converting rawdata into graph objects 
rawgraph <- graph.data.frame(rawdata, directed=FALSE) 

#eliminating multiple edges 
simplify(rawgraph, remove.multiple=TRUE) 

#Plot the graph [plot(..)] but tkplot gives you more options 
tkplot(rawgraph)

#finding the number of common neighbors 
cn <- cocitation(rawgraph) 

#finding the edge having max no. of common neighbors 
maxop <- which(cn==max(cn), arr.ind=TRUE) 

#writing the o/p into a file 'output.txt' 
sink("output.txt") 
for( i in 1:dim(maxop)[1]) { 
  cat(maxop[i,1],",",maxop[i,2])
  cat("\n")
 }
 sink()
 
 #reading the o/p csv file 
 opdata <- read.csv("output.txt", header=FALSE)
 
 #converting opdata into o/p graph object 
 opgraph <- graph.data.frame(opdata,directed=FALSE) 
 
 #plotting output using tkplot 
 tkplot(opgraph)
 
 #Citation.txt contains the dataset. 
  
