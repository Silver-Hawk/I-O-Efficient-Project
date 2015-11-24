setwd("~/Dropbox/Datalogi/DM207/assignments/ass1/I-O-Efficient-Project/R/")
library(ggplot2)
library(dplyr)

WRITE_TO_REPORT <- T
FONTSIZE <- 24

nlogn <- function(x){
   x*log(x)   
}
size <- 4
osize <- 16

options("scipen")
## PART 1 PLOT
part1 <- read.table("alg_output/part1_output",sep = ",",header = TRUE)
part1$nlogn_time <- part1$time/nlogn(part1$n)
plot_part1 <- ggplot(data = part1,aes(x=n,y=nlogn_time,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   geom_vline(xintercept = 32000/size,linetype="longdash", alpha = 0.5) +  
   geom_vline(xintercept = 256000/size,linetype="longdash", alpha = 0.5) +  
   geom_vline(xintercept = 4096000/size,linetype="longdash", alpha = 0.5) +  
   ylab("time/n log n") +
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   scale_x_log10()+
   #scale_y_log10()+
   ggtitle("PART 1")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part1.pdf",width = 12.44)
   print(plot_part1)
   dev.off()
}else{
   plot_part1   
}

## PART 2 PLOT QUICK INT VS QUCK INTEGER

part2 <- read.table("alg_output/part2_output",sep = ",",header = T)
part2$nlogn_time <- part2$time/nlogn(part2$n)

q_int <- part1[which(part1$alg == "quick"),]
q_int$alg <- "quick_int"

q_integer <- part2[which(part2$alg == "quick"),]
q_integer$alg <- "quick_integer"

part2_quick <- rbind(q_int,q_integer)

linealpha <- 0.75

plot_part2 <- ggplot(data = part2_quick,aes(x=n,y=nlogn_time,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   geom_vline(xintercept = 32000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 256000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 4096000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 1024000000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 32000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 256000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 4096000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 1024000000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   ylab("time/n log n") +
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   scale_x_log10()+
   #scale_y_log10()+
   ggtitle("PART 2")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part2_quick.pdf",width = 12.44)
   print(plot_part2)
   dev.off()
}else{
   plot_part2   
}
# HEAP INT VS INTEGER
h_int <- part1[which(part1$alg == "heap"),]
h_int$alg <- "heap_int"

h_integer <- part2[which(part2$alg == "heap"),]
h_integer$alg <- "heap_integer"

part2_heap <- rbind(h_int,h_integer)

linealpha <- 0.75

part2$nlogn_time <- part2$time/nlogn(part2$n)
plot_part2 <- ggplot(data = part2_heap,aes(x=n,y=nlogn_time,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   geom_vline(xintercept = 32000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 256000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 4096000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 1024000000/size,linetype="longdash",colour="#FF9999",alpha = linealpha) +  
   geom_vline(xintercept = 32000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 256000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 4096000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   geom_vline(xintercept = 1024000000/osize,linetype="longdash",colour = "#56B4E9",alpha = linealpha) +  
   ylab("time/n log n") +
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   scale_x_log10()+
   #scale_y_log10()+
   ggtitle("PART 2")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part2_heap.pdf",width = 12.44)
   print(plot_part2)
   dev.off()
}else{
   plot_part2   
}



## PART 3 PLOT
part3 <- read.table("alg_output/part3_output",sep = ",",header = T)
m <- 1000000000
part3$mtime <- part3$time/m
plot_part3 <- ggplot(data = part3,aes(x=n,y=mtime,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   geom_vline(xintercept = 32000/size,linetype="longdash") +  
   geom_vline(xintercept = 256000/size,linetype="longdash") +  
   geom_vline(xintercept = 4096000/size,linetype="longdash") +  
   geom_vline(xintercept = 1024000000/size,linetype="longdash") +  
   scale_x_log10()+
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   #scale_y_log10()+
   ylab("time/m") +
   ggtitle("PART 3")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part3.pdf",width = 12.44)
   print(plot_part3)
   dev.off()
}else{
   plot_part3   
}

## PART 4 PLOT
part4 <- read.table("alg_output/ny_part4",sep = ",",header = T)
m <- 2^30
part4$time_m <- part4$time/m
plot_part4 <- ggplot(data = part4,aes(x=d,y=time_m))+
   geom_line(alpha = 0.5)+
   geom_point()+
   ylab("time") +
  # scale_y_log10() + 
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   ggtitle("PART 4")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part4.pdf",width = 12.44)
   print(plot_part4)
   dev.off()
}else{
   plot_part4   
}

## PART 5

## PART 1 PLOT
part1 <- read.table("alg_output/part5/part5_1",sep = ",",header = TRUE)
part1$nlogn_time <- part1$time/nlogn(part1$n)
plot_part1 <- ggplot(data = part1,aes(x=n,y=nlogn_time,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   geom_vline(xintercept = 32000/size,linetype="longdash") +  
   geom_vline(xintercept = 256000/size,linetype="longdash") +  
   geom_vline(xintercept = 4096000/size,linetype="longdash") +  
   geom_vline(xintercept = 1024000000/size,linetype="longdash") +  
   ylab("time/n log n") +
   scale_x_log10()+
   #scale_y_log10()+
   ggtitle("PART 5 - 1")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part5_1.pdf",width = 12.44)
   print(plot_part1)
   dev.off()
}else{
   plot_part1   
}

## PART 2 PLOT
part2 <- read.table("alg_output/part5/part5_2",sep = ",",header = T)
part2$nlogn_time <- part2$time/nlogn(part2$n)
plot_part2 <- ggplot(data = part2,aes(x=n,y=nlogn_time,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   geom_vline(xintercept = 32000/osize,linetype="longdash") +  
   geom_vline(xintercept = 256000/osize,linetype="longdash") +  
   geom_vline(xintercept = 4096000/osize,linetype="longdash") +  
   geom_vline(xintercept = 1024000000/osize,linetype="longdash") +  
   ylab("time/n log n") +
   scale_x_log10()+
   #scale_y_log10()+
   ggtitle("PART 5 - 2")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part5_2.pdf",width = 12.44)
   print(plot_part2)
   dev.off()
}else{
   plot_part2   
}

## PART 3 PLOT
part3 <- read.table("alg_output/part5/part5_3",sep = ",",header = T)
m <- 1000000000
part3$mtime <- part3$time/m
plot_part3 <- ggplot(data = part3,aes(x=n,y=mtime,color = alg))+
   geom_line(alpha = 0.5)+
   geom_point()+
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   geom_vline(xintercept = 32000/size,linetype="longdash") +  
   geom_vline(xintercept = 256000/size,linetype="longdash") +  
   geom_vline(xintercept = 4096000/size,linetype="longdash") +  
   geom_vline(xintercept = 1024000000/size,linetype="longdash") +  
   scale_x_log10()+
   #scale_y_log10()+
   ylab("time/m") +
   ggtitle("PART 5 - 3")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part5_3.pdf",width = 12.44)
   print(plot_part3)
   dev.off()
}else{
   plot_part3   
}

## PART 4 PLOT
part4 <- read.table("alg_output/part5/part5_4",sep = ",",header = T)
m <- 2^30
part4$time_m <- part4$time/m
plot_part4 <- ggplot(data = part4,aes(x=d,y=time))+
   geom_line(alpha = 0.5)+
   geom_point()+
   theme(text = element_text(size=FONTSIZE),
        axis.text.x = element_text( vjust=1)) +
   #scale_x_log10()+
   #scale_y_log10()+
   ylab("time") +
   ggtitle("PART 5 - 4")
if(WRITE_TO_REPORT){
   pdf(file = "../report/images/part5_4.pdf",width = 12.44)
   print(plot_part4)
   dev.off()
}else{
   plot_part4   
}