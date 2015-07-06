## Plot histogram of size by volume or intensity using "expA" files from Malvern
## Read files must have been exported using method Adam
## Multiple lines in same graph, different colors
## Does not work well for more than a few temperatures. 

denTplot <- function(file, Trange=c(40,45,65), type="intensity") {
      setwd("F:/Research/data/Malvern sizer")
      df<-read.delim(file, header=FALSE)

      TL <- seq_along(rep(Trange,each=3))
      
      size <- as.numeric(df[2,1:300, drop=FALSE])
      
      if(type=="intensity") columns <- 303:602
      else columns <- 603:902
      
      percent <- df[which(df[,301] %in% Trange),columns]
      colnames(percent) <- size
      
      Tval <- df[which(df[,301] %in% Trange),301]
      
      temp <- paste(Trange, collapse= ",")
      
      pal <- rainbow(length(TL))
      
      for(j in TL) {
            while(j==1) {
                  par(xaxs="i", yaxs="r", lwd=2, bg="white")
                  plot(size, percent[j,], type="l", log="x",
                        xlim=c(5,5000), ylim=c(0,35), col =pal[j],
                        main = sprintf("Size distribution by %s at %s deg C", type, temp),
                        xlab ="Hydrodynamic diameter [nm]", 
                        ylab= sprintf("Percent by %s", type))
                        j <- j+1
                  }
            lines(size, percent[j,], col=pal[j])
            legend("top", title="Temperatures", legend=Tval, lwd= 2, ncol =2,
                   col = pal, box.lwd = .5, cex= .8)
      }
   
}
