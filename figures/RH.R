library(dplyr)

setwd("F:/RH/")

rh.10m <- read.csv("wdc_15min_HI_2010-07-01-10_10m.csv", header=FALSE, col.names=c("ID", "Lat", "Lon", "TempKelvin", "RH", "NA"))
rh.100m <- read.csv("wdc_15min_HI_2010-07-01-10_100m.csv", header=FALSE, col.names=c("ID", "time", "Lat", "Lon", "TempKelvin", "RH", "NA"))
rh.nu <- read.csv("wdc_15min_HI_2010-07-01-10_nudapt.csv", header=FALSE, col.names=c("ID", "time", "Lat", "Lon", "TempKelvin", "RH", "NA"))
rh.no <- read.csv("wdc_15min_HI_2010-07-01-10_nobldg.csv", header=FALSE, col.names=c("ID", "time", "Lat", "Lon", "TempKelvin", "RH", "NA"))


rh.sp.10m <- rh.10m %>% group_by(Lat, Lon) %>% summarise(max = max(RH), min = min(RH), av = mean(RH))
rh.sp.100m <- rh.100m %>% group_by(Lat, Lon) %>% summarise(max = max(RH), min = min(RH), av = mean(RH))
rh.sp.nu <- rh.nu %>% group_by(Lat, Lon) %>% summarise(max = max(RH), min = min(RH), av = mean(RH))
rh.sp.no <- rh.no %>% group_by(Lat, Lon) %>% summarise(max = max(RH), min = min(RH), av = mean(RH))

write.csv(rh.sp.10m, "rh.sp.10m.csv")
write.csv(rh.sp.100m, "rh.sp.100m.csv")
write.csv(rh.sp.nu, "rh.sp.nu.csv")
write.csv(rh.sp.no, "rh.sp.no.csv")
