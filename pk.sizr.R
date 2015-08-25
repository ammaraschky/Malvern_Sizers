# Passes pk1.vol to an aggregate fn to make a list of median sizes at each Temp

pk.sizr <- function(Sfile) {

      lz <- pk1.vol(Sfile)
      
      df <- cbind(lz[[1]],lz[[2]])
      
      out <- aggregate(df[,2], by = list(df[,1]), FUN="median")
      colnames(out) <- c("Temperature", "Diameter")
      out
}

      
