setwd("~/Dropbox/Datalogi/DM207/assignments/ass1/I-O-Efficient-Project/R/")
library(ggplot2)
library(dplyr)

WRITE_TO_REPORT <- T

nlogn <- function(x){
   x*log(x)   
}

## PART 1 PLOT
part1 <- read.table("alg_output/part1_output",sep = ",",header = TRUE)
part1$nlogn_time <- part1$time/nlogn(part1$n)
plot_part1 <- ggplot(data = part1,aes(x=n,y=nlogn_time,color = alg))+
   geom_line()+
   ylab("time/n log n") +
   scale_x_log10()+
   scale_y_log10()+
   ggtitle("PART 1")
if(WRITE_TO_REPORT){
   pdf(file = "../../report/images/part1.pdf",width = 12.44)
   print(plot_part1)
   dev.off()
}else{
   plot_part1   
}

## PART 2 PLOT
part2 <- read.table("alg_output/part2_output",sep = ",",header = T)
part2$nlogn_time <- part2$time/nlogn(part2$n)
plot_part2 <- ggplot(data = part2,aes(x=n,y=nlogn_time,color = alg))+
   geom_line()+
   ylab("time/n log n") +
   scale_x_log10()+
   scale_y_log10()+
   ggtitle("PART 2")
if(WRITE_TO_REPORT){
   pdf(file = "../../report/images/part2.pdf",width = 12.44)
   print(plot_part2)
   dev.off()
}else{
   plot_part2   
}

## PART 3 PLOT
part3 <- read.table("alg_output/part3_output",sep = ",",header = T)
part3$mtime <- part3$time/part3$m
plot_part3 <- ggplot(data = part3,aes(x=m,y=mtime,color = alg))+
   geom_line()+
   scale_x_log10()+
   #scale_y_log10()+
   ylab("time/m") +
   ggtitle("PART 3")
if(WRITE_TO_REPORT){
   pdf(file = "../../report/images/part3.pdf",width = 12.44)
   print(plot_part3)
   dev.off()
}else{
   plot_part3   
}

## PART 4 PLOT