

df <- read.delim("Size dependence summary 8-23-15.txt")
colnames(df) <- c("H40", "PBS", "temp", "dia")



df3 <- df[which(df$H40 == 30),]

xyplot(dia~PBS, data = df3, 
       
       main=list("Diameter vs. Concentration of Salt", fontsize = 14),
       xlab = list("Salt Concentration [mM PBS]", fontsize = 14),
       ylab = list("Diameter [nm]", fontsize = 14),
       scales = list(cex = 1.2, 
                     y = list(cex = 1.2,
                              log = 10, 
                              at=c(10,30,100,300,1000,3000), 
                              labels=c(10,30,100,300,1000,3000)
                     ),
                     equispaced.log = FALSE),
       cex=1, 
)




df2 <- df[which(df$PBS == 30 | df$PBS == 20),]

xyplot(dia~H40 | factor(PBS), data = df2, 
       #panel = function(x, y) {
             #panel.xyplot(x, y)
             #if (length(x) >= 2) panel.abline(lm(y ~ x)) lm(y~x),
             #panel.abline(fit)
       #}
       main=list("Diameter vs. Concentration of Linear \nat Two Salt Concentrations", 
                 fontsize = 14),
       xlab = list("Linear Concentration [uM H40]", fontsize = 14),
       ylab = list("Diameter [nm]", fontsize = 14),
       scales = list(cex = 1.2, 
                     y = list(cex = 1.2,
                              log = 10, 
                              at=c(10,30,100,300,1000,3000), 
                              labels=c(10,30,100,300,1000,3000)
                              ),
                     equispaced.log = FALSE),
       cex=1, 
       layout= c(2,1)
)


