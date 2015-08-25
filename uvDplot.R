#Driver with double Y-axis plot for (Diameter, OD) vs. Temp
# doubleYScale plot of Diameter and Optical density vs. Temperature


uvDplot <- function() {
      library(latticeExtra)
      source('F:/Research/data/Malvern sizer/pk1.vol.R')
      source('F:/Research/data/UV spectro/uv.plot.R')
      source('F:/Research/data/Malvern sizer/pk.sizr.R')
      
      message("Pick an UV-OD file")
      uvFile <- file.choose()
      
      message("Pick a size file")
      Sfile <- file.choose()
      
      D <- pk.sizr(Sfile)
      
      ob1 <- xyplot(Diameter~Temperature, data = D,
                  main="Diameter and Absorbance vs. Temperature",
                  xlab = list("Temperature [deg C]", fontsize = 14),
                  ylab = list("Diameter [nm]", fontsize = 14, col="#0080ff"),
                  ylab.right = list("Absorbance", fontsize = 14),
                  scales = list(cex = 1.4, 
                                    y = list(cex = 1.4,
                                             log = 10, tick.number=3,
                                             at=c(10,100,1000), 
                                             labels=c(10,100,1000)),
                                    equispaced.log = FALSE),
                  cex=1.5, type = "p"
                  )
                  
      ob2 <- uv.plot(uvFile)
      
      doubleYScale(ob1, ob2, 
                   style1=1, style2=3, 
                   add.ylab2 = FALSE)
}

