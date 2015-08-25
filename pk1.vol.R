# finds the size of the greatest % by volume for expA Malvern files 

pk1.vol <- function(Sfile){
      
      df<-read.delim(Sfile, header=FALSE)

      # subset size > 2 nm
      size <- as.numeric(df[2,117:300])
      
      columns <- 719:902 
      
      #subset rows with complete cases, i.e. no lines with all 0s
      vol <- df[1:nrow(df),columns]
      rows <- !rowSums(vol[, -1] == c(0,0.0)) == (ncol(vol)-1) 
      cvol <- vol[rows,]
      temp <- as.numeric(df[rows,301])
      
      #find the position of the peak by taking the max of each column
      pos <- max.col(cvol, ties.method = "last")
      
      #then assign the peak sizes by that position
      pk1 <- size[pos]
      list(temp,pk1)
}