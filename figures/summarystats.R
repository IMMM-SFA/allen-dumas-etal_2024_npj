library(ncdf4)
library(gridExtra)
library(grid)

get_stats <- function(dataset) {
  n <- length(dataset)
  minimum <- round(min(dataset), digits = 4)
  maximum <- round(max(dataset), digits = 4)
  med <- round(median(dataset), digits = 4)
  iqr <- round(IQR(dataset), digits = 4)
  avg <- round(mean(dataset), digits = 4)
  std <- round(sd(dataset), digits = 4)
  se <- std / sqrt(n)
  
  stats <- c(n, minimum, maximum, med, iqr, avg, std, round(se, digits = 4))
  
  return(stats)
}  


setwd("D:/StatsOut/")

max.ten <- nc_open("wdc_statsmx_2010-07-01-10_10m.nc")
max.hundred <- nc_open("wdc_statsmx_2010-07-01-10_100m.nc")
max.nudapt <- nc_open("wdc_statsmx_2010-07-01-10_nudapt.nc")
max.nobldg <- nc_open("wdc_statsmx_2010-07-01-10_nobldg.nc")

max.temp.ten <- ncvar_get(max.ten, "T2")
max.sh.ten <- ncvar_get(max.ten, "HFX")
max.lh.ten <- ncvar_get(max.ten, "LH")

max.temp.hundred <- ncvar_get(max.hundred, "T2")
max.sh.hundred <- ncvar_get(max.hundred, "HFX")
max.lh.hundred <- ncvar_get(max.hundred, "LH")

max.temp.nudapt <- ncvar_get(max.nudapt, "T2")
max.sh.nudapt <- ncvar_get(max.nudapt, "HFX")
max.lh.nudapt <- ncvar_get(max.nudapt, "LH")

max.temp.nobldg <- ncvar_get(max.nobldg, "T2")
max.sh.nobldg <- ncvar_get(max.nobldg, "HFX")
max.lh.nobldg <- ncvar_get(max.nobldg, "LH")

max.ten <- read.csv("wdc_statsmx_2010-07-01-10_10m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
max.hundred <- read.csv("wdc_statsmx_2010-07-01-10_100m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
max.nudapt <- read.csv("wdc_statsmx_2010-07-01-10_nudapt.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
max.nobldg <- read.csv("wdc_statsmx_2010-07-01-10_nobldg.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))

max.ws.ten <- max.ten$ws
max.ws.hundred <- max.hundred$ws
max.ws.nudapt <- max.nudapt$ws
max.ws.nobldg <- max.nobldg$ws

min.ten <- nc_open("wdc_statsmn_2010-07-01-10_10m.nc")
min.hundred <- nc_open("wdc_statsmn_2010-07-01-10_100m.nc")
min.nudapt <- nc_open("wdc_statsmn_2010-07-01-10_nudapt.nc")
min.nobldg <- nc_open("wdc_statsmn_2010-07-01-10_nobldg.nc")

min.temp.ten <- ncvar_get(min.ten, "T2")
min.sh.ten <- ncvar_get(min.ten, "HFX")
min.lh.ten <- ncvar_get(min.ten, "LH")

min.temp.hundred <- ncvar_get(min.hundred, "T2")
min.sh.hundred <- ncvar_get(min.hundred, "HFX")
min.lh.hundred <- ncvar_get(min.hundred, "LH")

min.temp.nudapt <- ncvar_get(min.nudapt, "T2")
min.sh.nudapt <- ncvar_get(min.nudapt, "HFX")
min.lh.nudapt <- ncvar_get(min.nudapt, "LH")

min.temp.nobldg <- ncvar_get(min.nobldg, "T2")
min.sh.nobldg <- ncvar_get(min.nobldg, "HFX")
min.lh.nobldg <- ncvar_get(min.nobldg, "LH")

min.ten <- read.csv("wdc_statsmn_2010-07-01-10_10m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
min.hundred <- read.csv("wdc_statsmn_2010-07-01-10_100m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
min.nudapt <- read.csv("wdc_statsmn_2010-07-01-10_nudapt.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
min.nobldg <- read.csv("wdc_statsmn_2010-07-01-10_nobldg.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))

min.ws.ten <- min.ten$ws
min.ws.hundred <- min.hundred$ws
min.ws.nudapt <- min.nudapt$ws
min.ws.nobldg <- min.nobldg$ws

av.ten <- nc_open("wdc_statsav_2010-07-01-10_10m.nc")
av.hundred <- nc_open("wdc_statsav_2010-07-01-10_100m.nc")
av.nudapt <- nc_open("wdc_statsav_2010-07-01-10_nudapt.nc")
av.nobldg <- nc_open("wdc_statsav_2010-07-01-10_nobldg.nc")

av.temp.ten <- ncvar_get(av.ten, "T2")
av.sh.ten <- ncvar_get(av.ten, "HFX")
av.lh.ten <- ncvar_get(av.ten, "LH")

av.temp.hundred <- ncvar_get(av.hundred, "T2")
av.sh.hundred <- ncvar_get(av.hundred, "HFX")
av.lh.hundred <- ncvar_get(av.hundred, "LH")

av.temp.nudapt <- ncvar_get(av.nudapt, "T2")
av.sh.nudapt <- ncvar_get(av.nudapt, "HFX")
av.lh.nudapt <- ncvar_get(av.nudapt, "LH")

av.temp.nobldg <- ncvar_get(av.nobldg, "T2")
av.sh.nobldg <- ncvar_get(av.nobldg, "HFX")
av.lh.nobldg <- ncvar_get(av.nobldg, "LH")

av.ten <- read.csv("wdc_statsav_2010-07-01-10_10m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
av.hundred <- read.csv("wdc_statsav_2010-07-01-10_100m.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
av.nudapt <- read.csv("wdc_statsav_2010-07-01-10_nudapt.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))
av.nobldg <- read.csv("wdc_statsav_2010-07-01-10_nobldg.csv", header=FALSE, col.names=c("cell", "Lat", "Lon", "RH", "wd", "ws", "NA"))

av.ws.ten <- av.ten$ws
av.ws.hundred <- av.hundred$ws
av.ws.nudapt <- av.nudapt$ws
av.ws.nobldg <- av.nobldg$ws


# RH

setwd("D:/RH/")

rh.ten <- read.csv("rh.sp.10m.csv", header=TRUE)
rh.hundred <- read.csv("rh.sp.100m.csv", header=TRUE)
rh.nudapt <- read.csv("rh.sp.nu.csv", header=TRUE)
rh.nobldg <- read.csv("rh.sp.no.csv", header=TRUE)
 
max.humid.ten <- rh.ten$max
max.humid.hundred <- rh.hundred$max
max.humid.nudapt <- rh.nudapt$max
max.humid.nobldg <- rh.nobldg$max

min.humid.ten <- rh.ten$min
min.humid.hundred <- rh.hundred$min
min.humid.nudapt <- rh.nudapt$min
min.humid.nobldg <- rh.nobldg$min

av.humid.ten <- rh.ten$av
av.humid.hundred <- rh.hundred$av
av.humid.nudapt <- rh.nudapt$av
av.humid.nobldg <- rh.nobldg$av

max.temp.wil.ht <- wilcox.test(max.temp.hundred, max.temp.ten)
av.temp.wil.ht <- wilcox.test(av.temp.hundred, av.temp.ten)
min.temp.wil.ht <- wilcox.test(min.temp.hundred, min.temp.ten)
av.humid.wil.ht <- wilcox.test(av.humid.hundred, av.humid.ten)
max.ws.wil.ht <- wilcox.test(max.ws.hundred, max.ws.ten)
av.ws.wil.ht <- wilcox.test(av.ws.hundred, av.ws.ten)
max.sh.wil.ht <- wilcox.test(max.sh.hundred, max.sh.ten)
av.sh.wil.ht <- wilcox.test(av.sh.hundred, av.sh.ten)
min.sh.wil.ht <- wilcox.test(min.sh.hundred, min.sh.ten)
max.lh.wil.ht <- wilcox.test(max.lh.hundred, max.lh.ten)
av.lh.wil.ht <- wilcox.test(av.lh.hundred, av.lh.ten)
min.lh.wil.ht <- wilcox.test(min.lh.hundred, min.lh.ten)
max.rh.wil.ht <- wilcox.test(max.humid.hundred, max.humid.ten)
av.rh.wil.ht <- wilcox.test(av.humid.hundred, av.humid.ten)
min.rh.wil.ht <- wilcox.test(min.humid.hundred, min.humid.ten)

max.temp.wil.hnu <- wilcox.test(max.temp.hundred, max.temp.nudapt)
av.temp.wil.hnu <- wilcox.test(av.temp.hundred, av.temp.nudapt)
min.temp.wil.hnu <- wilcox.test(min.temp.hundred, min.temp.nudapt)
av.humid.wil.hnu <- wilcox.test(av.humid.hundred, av.humid.nudapt)
max.ws.wil.hnu <- wilcox.test(max.ws.hundred, max.ws.nudapt)
av.ws.wil.hnu <- wilcox.test(av.ws.hundred, av.ws.nudapt)
max.sh.wil.hnu <- wilcox.test(max.sh.hundred, max.sh.nudapt)
av.sh.wil.hnu <- wilcox.test(av.sh.hundred, av.sh.nudapt)
min.sh.wil.hnu <- wilcox.test(min.sh.hundred, min.sh.nudapt)
max.lh.wil.hnu <- wilcox.test(max.lh.hundred, max.lh.nudapt)
av.lh.wil.hnu <- wilcox.test(av.lh.hundred, av.lh.nudapt)
min.lh.wil.hnu <- wilcox.test(min.lh.hundred, min.lh.nudapt)
max.rh.wil.hnu <- wilcox.test(max.humid.hundred, max.humid.nudapt)
av.rh.wil.hnu <- wilcox.test(av.humid.hundred, av.humid.nudapt)
min.rh.wil.hnu <- wilcox.test(min.humid.hundred, min.humid.nudapt)

max.temp.wil.hno <- wilcox.test(max.temp.hundred, max.temp.nobldg)
av.temp.wil.hno <- wilcox.test(av.temp.hundred, av.temp.nobldg)
min.temp.wil.hno <- wilcox.test(min.temp.hundred, min.temp.nobldg)
av.humid.wil.hno <- wilcox.test(av.humid.hundred, av.humid.nobldg)
max.ws.wil.hno <- wilcox.test(max.ws.hundred, max.ws.nobldg)
av.ws.wil.hno <- wilcox.test(av.ws.hundred, av.ws.nobldg)
max.sh.wil.hno <- wilcox.test(max.sh.hundred, max.sh.nobldg)
av.sh.wil.hno <- wilcox.test(av.sh.hundred, av.sh.nobldg)
min.sh.wil.hno <- wilcox.test(min.sh.hundred, min.sh.nobldg)
max.lh.wil.hno <- wilcox.test(max.lh.hundred, max.lh.nobldg)
av.lh.wil.hno <- wilcox.test(av.lh.hundred, av.lh.nobldg)
min.lh.wil.hno <- wilcox.test(min.lh.hundred, min.lh.nobldg)
max.rh.wil.hno <- wilcox.test(max.humid.hundred, max.humid.nobldg)
av.rh.wil.hno <- wilcox.test(av.humid.hundred, av.humid.nobldg)
min.rh.wil.hno <- wilcox.test(min.humid.hundred, min.humid.nobldg)

Group <- c("Max Temp", "Avg Temp", "Min Temp", "Max Rel Hum", "Avg Rel Hum", "Min Rel Hum", 
           "Wind Speed", "Max SH", "Avg SH", "Min SH", "Max LH", "Avg LH", "Min LH")

W <- c(max.temp.wil.ht$statistic, av.temp.wil.ht$statistic, min.temp.wil.ht$statistic, 
       max.rh.wil.ht$statistic, av.humid.wil.ht$statistic, min.rh.wil.ht$statistic, 
       max.ws.wil.ht$statistic, max.sh.wil.ht$statistic, av.sh.wil.ht$statistic,
       min.sh.wil.ht$statistic, max.lh.wil.ht$statistic, av.lh.wil.ht$statistic, 
       min.lh.wil.ht$statistic)

p <- c(max.temp.wil.ht$p.value, av.temp.wil.ht$p.value, min.temp.wil.ht$p.value, 
       max.rh.wil.ht$p.value, av.humid.wil.ht$p.value, min.rh.wil.ht$p.value,
       max.ws.wil.ht$p.value, max.sh.wil.ht$p.value, av.sh.wil.ht$p.value,
       min.sh.wil.ht$p.value, max.lh.wil.ht$p.value, av.lh.wil.ht$p.value, 
       min.lh.wil.ht$p.value)

p <- round(p, digits = 3)

df.wil.ht <- data.frame(W, p)
windows()
grid.table(df.wil.ht, rows = Group)

W <- c(max.temp.wil.hnu$statistic, av.temp.wil.hnu$statistic, min.temp.wil.hnu$statistic, 
       max.rh.wil.hnu$statistic, av.humid.wil.hnu$statistic, min.rh.wil.hnu$statistic, 
       max.ws.wil.hnu$statistic, max.sh.wil.hnu$statistic, av.sh.wil.hnu$statistic,
       min.sh.wil.hnu$statistic, max.lh.wil.hnu$statistic, av.lh.wil.hnu$statistic, 
       min.lh.wil.hnu$statistic)

p <- c(max.temp.wil.hnu$p.value, av.temp.wil.hnu$p.value, min.temp.wil.hnu$p.value, 
       max.rh.wil.hnu$p.value, av.humid.wil.hnu$p.value, min.rh.wil.hnu$p.value,
       max.ws.wil.hnu$p.value, max.sh.wil.hnu$p.value, av.sh.wil.hnu$p.value,
       min.sh.wil.hnu$p.value, max.lh.wil.hnu$p.value, av.lh.wil.hnu$p.value, 
       min.lh.wil.hnu$p.value)

p <- round(p, digits = 3)

df.wil.hnu <- data.frame(W, p)
windows()
grid.table(df.wil.hnu, rows = Group)

W <- c(max.temp.wil.hno$statistic, av.temp.wil.hno$statistic, min.temp.wil.hno$statistic, 
       max.rh.wil.hno$statistic, av.humid.wil.hno$statistic, min.rh.wil.hno$statistic, 
       max.ws.wil.hno$statistic, max.sh.wil.hno$statistic, av.sh.wil.hno$statistic,
       min.sh.wil.hno$statistic, max.lh.wil.hno$statistic, av.lh.wil.hno$statistic, 
       min.lh.wil.hno$statistic)

p <- c(max.temp.wil.hno$p.value, av.temp.wil.hno$p.value, min.temp.wil.hno$p.value, 
       max.rh.wil.hno$p.value, av.humid.wil.hno$p.value, min.rh.wil.hno$p.value,
       max.ws.wil.hno$p.value, max.sh.wil.hno$p.value, av.sh.wil.hno$p.value,
       min.sh.wil.hno$p.value, max.lh.wil.hno$p.value, av.lh.wil.hno$p.value, 
       min.lh.wil.hno$p.value)

p <- round(p, digits = 3)

df.wil.hno <- data.frame(W, p)
windows()
grid.table(df.wil.hno, rows = Group)



max.temp.stats.t <- get_stats(max.temp.ten)
df.tmax.t <- data.frame(t(max.temp.stats.t), row.names = "10m Max Temp (K)")
colnames(df.tmax.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.temp.stats.h <- get_stats(max.temp.hundred)
df.tmax.h <- data.frame(t(max.temp.stats.h), row.names = "100m Max Temp (K)")
colnames(df.tmax.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.temp.stats.nudapt <- get_stats(max.temp.nudapt)
df.tmax.nudapt <- data.frame(t(max.temp.stats.nudapt), row.names = "NUDAPT Max Temp (K)")
colnames(df.tmax.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.temp.stats.nobldg <- get_stats(max.temp.nobldg)
df.tmax.nobldg <- data.frame(t(max.temp.stats.nobldg), row.names = "No Buildings Max Temp (K)")
colnames(df.tmax.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.temp.stats.t <- get_stats(av.temp.ten)
df.tav.t <- data.frame(t(av.temp.stats.t), row.names = "10m Avg Temp (K)")
colnames(df.tav.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.temp.stats.h <- get_stats(av.temp.hundred)
df.tav.h <- data.frame(t(av.temp.stats.h), row.names = "100m Avg Temp (K)")
colnames(df.tav.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.temp.stats.nudapt <- get_stats(av.temp.nudapt)
df.tav.nudapt <- data.frame(t(av.temp.stats.nudapt), row.names = "NUDAPT Avg Temp (K)")
colnames(df.tav.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.temp.stats.nobldg <- get_stats(av.temp.nobldg)
df.tav.nobldg <- data.frame(t(av.temp.stats.nobldg), row.names = "No Buildings Avg Temp (K)")
colnames(df.tav.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.temp.stats.t <- get_stats(min.temp.ten)
df.tmin.t <- data.frame(t(min.temp.stats.t), row.names = "10m Min Temp (K)")
colnames(df.tmin.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.temp.stats.h <- get_stats(min.temp.hundred)
df.tmin.h <- data.frame(t(min.temp.stats.h), row.names = "100m Min Temp (K)")
colnames(df.tmin.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.temp.stats.nudapt <- get_stats(min.temp.nudapt)
df.tmin.nudapt <- data.frame(t(min.temp.stats.nudapt), row.names = "NUDAPT Min Temp (K)")
colnames(df.tmin.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.temp.stats.nobldg <- get_stats(min.temp.nobldg)
df.tmin.nobldg <- data.frame(t(min.temp.stats.nobldg), row.names = "No Buildings Min Temp (K)")
colnames(df.tmin.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.humid.stats.t <- get_stats(max.humid.ten)
df.humidmx.t <- data.frame(t(max.humid.stats.t), row.names = "10m Max Rel Hum (pct)")
colnames(df.humidmx.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.humid.stats.h <- get_stats(max.humid.hundred)
df.humidmx.h <- data.frame(t(max.humid.stats.h), row.names = "100m Max Rel Hum (pct)")
colnames(df.humidmx.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.humid.stats.nudapt <- get_stats(max.humid.nudapt)
df.humidmx.nudapt <- data.frame(t(max.humid.stats.nudapt), row.names = "NUDAPT Max Rel Hum (pct)")
colnames(df.humidmx.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.humid.stats.nobldg <- get_stats(max.humid.nobldg)
df.humidmx.nobldg <- data.frame(t(max.humid.stats.nobldg), row.names = "No Buildings Max Rel Hum (pct)")
colnames(df.humidmx.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.humid.stats.t <- get_stats(av.humid.ten)
df.humidav.t <- data.frame(t(av.humid.stats.t), row.names = "10m Avg Rel Hum (pct)")
colnames(df.humidav.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.humid.stats.h <- get_stats(av.humid.hundred)
df.humidav.h <- data.frame(t(av.humid.stats.h), row.names = "100m Avg Rel Hum (pct)")
colnames(df.humidav.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.humid.stats.nudapt <- get_stats(av.humid.nudapt)
df.humidav.nudapt <- data.frame(t(av.humid.stats.nudapt), row.names = "NUDAPT Avg Rel Hum (pct)")
colnames(df.humidav.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.humid.stats.nobldg <- get_stats(av.humid.nobldg)
df.humidav.nobldg <- data.frame(t(av.humid.stats.nobldg), row.names = "No Buildings Avg Rel Hum (pct)")
colnames(df.humidav.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.humid.stats.t <- get_stats(min.humid.ten)
df.humidmn.t <- data.frame(t(min.humid.stats.t), row.names = "10m Min Rel Hum (pct)")
colnames(df.humidmn.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.humid.stats.h <- get_stats(min.humid.hundred)
df.humidmn.h <- data.frame(t(min.humid.stats.h), row.names = "100m Min Rel Hum (pct)")
colnames(df.humidmn.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.humid.stats.nudapt <- get_stats(min.humid.nudapt)
df.humidmn.nudapt <- data.frame(t(min.humid.stats.nudapt), row.names = "NUDAPT Min Rel Hum (pct)")
colnames(df.humidmn.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.humid.stats.nobldg <- get_stats(min.humid.nobldg)
df.humidmn.nobldg <- data.frame(t(min.humid.stats.nobldg), row.names = "No Buildings Min Rel Hum (pct)")
colnames(df.humidmn.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.ws.stats.t <- get_stats(max.ws.ten)
df.wsmx.t <- data.frame(t(max.ws.stats.t), row.names = "10m Wind Speed (m/s)")
colnames(df.wsmx.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.ws.stats.h <- get_stats(max.ws.hundred)
df.wsmx.h <- data.frame(t(max.ws.stats.h), row.names = "100m Wind Speed (m/s)")
colnames(df.wsmx.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.ws.stats.nudapt <- get_stats(max.ws.nudapt)
df.wsmx.nudapt <- data.frame(t(max.ws.stats.nudapt), row.names = "NUDAPT Wind Speed (m/s)")
colnames(df.wsmx.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.ws.stats.nobldg <- get_stats(max.ws.nobldg)
df.wsmx.nobldg <- data.frame(t(max.ws.stats.nobldg), row.names = "No Buildings Wind Speed (m/s)")
colnames(df.wsmx.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.sh.stats.t <- get_stats(max.sh.ten)
df.shmx.t <- data.frame(t(max.sh.stats.t), row.names = "10m Max SH (Wm-2)")
colnames(df.shmx.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.sh.stats.h <- get_stats(max.sh.hundred)
df.shmx.h <- data.frame(t(max.sh.stats.h), row.names = "100m Max SH (Wm-2)")
colnames(df.shmx.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.sh.stats.nudapt <- get_stats(max.sh.nudapt)
df.shmx.nudapt <- data.frame(t(max.sh.stats.nudapt), row.names = "NUDAPT Max SH (Wm-2)")
colnames(df.shmx.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.sh.stats.nobldg <- get_stats(max.sh.nobldg)
df.shmx.nobldg <- data.frame(t(max.sh.stats.nobldg), row.names = "No Buildings Max SH (Wm-2)")
colnames(df.shmx.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.sh.stats.t <- get_stats(av.sh.ten)
df.shav.t <- data.frame(t(av.sh.stats.t), row.names = "10m Avg SH (Wm-2)")
colnames(df.shav.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.sh.stats.h <- get_stats(av.sh.hundred)
df.shav.h <- data.frame(t(av.sh.stats.h), row.names = "100m Avg SH (Wm-2)")
colnames(df.shav.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.sh.stats.nudapt <- get_stats(av.sh.nudapt)
df.shav.nudapt <- data.frame(t(av.sh.stats.nudapt), row.names = "NUDAPT Avg SH (Wm-2)")
colnames(df.shav.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.sh.stats.nobldg <- get_stats(av.sh.nobldg)
df.shav.nobldg <- data.frame(t(av.sh.stats.nobldg), row.names = "No Buildings Avg SH (Wm-2)")
colnames(df.shav.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.sh.stats.t <- get_stats(min.sh.ten)
df.shmn.t <- data.frame(t(min.sh.stats.t), row.names = "10m Min SH (Wm-2)")
colnames(df.shmn.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.sh.stats.h <- get_stats(min.sh.hundred)
df.shmn.h <- data.frame(t(min.sh.stats.h), row.names = "100m Min SH (Wm-2)")
colnames(df.shmn.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.sh.stats.nudapt <- get_stats(min.sh.nudapt)
df.shmn.nudapt <- data.frame(t(min.sh.stats.nudapt), row.names = "NUDAPT Min SH (Wm-2)")
colnames(df.shmn.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.sh.stats.nobldg <- get_stats(min.sh.nobldg)
df.shmn.nobldg <- data.frame(t(min.sh.stats.nobldg), row.names = "No Buildings Min SH (Wm-2)")
colnames(df.shmn.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.lh.stats.t <- get_stats(max.lh.ten)
df.lhmx.t <- data.frame(t(max.lh.stats.t), row.names = "10m Max LH (Wm-2)")
colnames(df.lhmx.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.lh.stats.h <- get_stats(max.lh.hundred)
df.lhmx.h <- data.frame(t(max.lh.stats.h), row.names = "100m Max LH (Wm-2)")
colnames(df.lhmx.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.lh.stats.nudapt <- get_stats(max.lh.nudapt)
df.lhmx.nudapt <- data.frame(t(max.lh.stats.nudapt), row.names = "NUDAPT Max LH (Wm-2)")
colnames(df.lhmx.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

max.lh.stats.nobldg <- get_stats(max.lh.nobldg)
df.lhmx.nobldg <- data.frame(t(max.lh.stats.nobldg), row.names = "No Buildings Max LH (Wm-2)")
colnames(df.lhmx.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.lh.stats.t <- get_stats(av.lh.ten)
df.lhav.t <- data.frame(t(av.lh.stats.t), row.names = "10m Avg LH (Wm-2)")
colnames(df.lhav.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.lh.stats.h <- get_stats(av.lh.hundred)
df.lhav.h <- data.frame(t(av.lh.stats.h), row.names = "100m Avg LH (Wm-2)")
colnames(df.lhav.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.lh.stats.nudapt <- get_stats(av.lh.nudapt)
df.lhav.nudapt <- data.frame(t(av.lh.stats.nudapt), row.names = "NUDAPT Avg LH (Wm-2)")
colnames(df.lhav.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

av.lh.stats.nobldg <- get_stats(av.lh.nobldg)
df.lhav.nobldg <- data.frame(t(av.lh.stats.nobldg), row.names = "No Buildings Avg LH (Wm-2)")
colnames(df.lhav.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.lh.stats.t <- get_stats(min.lh.ten)
df.lhmn.t <- data.frame(t(min.lh.stats.t), row.names = "10m Min LH (Wm-2)")
colnames(df.lhmn.t) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.lh.stats.h <- get_stats(min.lh.hundred)
df.lhmn.h <- data.frame(t(min.lh.stats.h), row.names = "100m Min LH (Wm-2)")
colnames(df.lhmn.h) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.lh.stats.nudapt <- get_stats(min.lh.nudapt)
df.lhmn.nudapt <- data.frame(t(min.lh.stats.nudapt), row.names = "NUDAPT Min LH (Wm-2)")
colnames(df.lhmn.nudapt) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

min.lh.stats.nobldg <- get_stats(min.lh.nobldg)
df.lhmn.nobldg <- data.frame(t(min.lh.stats.nobldg), row.names = "No Buildings Min LH (Wm-2)")
colnames(df.lhmn.nobldg) <- c("N", "Min", "Max", "Median", "IQR", "Mean", "SD", "SE")

windows()
grid.table(rbind(df.tmax.t, df.tmax.h, df.tav.t, df.tav.h, df.tmin.t, df.tmin.h, df.humidav.t,
                 df.humidav.h, df.wsmx.t, df.wsmx.h, df.shmx.t, df.shmx.h, df.shav.t, df.shav.h,
                 df.shmn.t, df.shmn.h, df.lhmx.t, df.lhmx.h, df.lhav.t, df.lhav.h, df.lhmn.t,
                 df.lhmn.h))
windows()
grid.table(rbind(df.tmax.nudapt, df.tmax.nobldg, df.tav.nudapt, df.tav.nobldg, df.tmin.nudapt, df.tmin.nobldg, df.humidav.nudapt,
                 df.humidav.nobldg, df.wsmx.nudapt, df.wsmx.nobldg, df.shmx.nudapt, df.shmx.nobldg, df.shav.nudapt, df.shav.nobldg,
                 df.shmn.nudapt, df.shmn.nobldg, df.lhmx.nudapt, df.lhmx.nobldg, df.lhav.nudapt, df.lhav.nobldg, df.lhmn.nudapt,
                 df.lhmn.nobldg))


