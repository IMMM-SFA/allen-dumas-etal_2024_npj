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


###############################################################################################
#                                                                                             #
# This section gathers all of the variables out of the NetCDF files.                          #                              #
#                                                                                             #
###############################################################################################

setwd("C:/Users/levis/OneDrive/Desktop/WDC_Nature/")

max.ten <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcmx_10m.nc")
max.hundred <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcmx_100m.nc")
max.nudapt <- nc_open("NetCDF_new/Stats_nudapt/wdc_mx_stats_2010-07-01-10_nudapt.nc")
max.nobldg <- nc_open("NetCDF_new/Stats_nobldg/wdc_mx_stats_2010-07-01-10_nobldg.nc")

max.temp.ten <- ncvar_get(max.ten, "T2")
max.sh.ten <- ncvar_get(max.ten, "HFX")
max.lh.ten <- ncvar_get(max.ten, "LH")
max.u.ten <- ncvar_get(max.ten, "U10")
max.v.ten <- ncvar_get(max.ten, "V10")

max.temp.hundred <- ncvar_get(max.hundred, "T2")
max.sh.hundred <- ncvar_get(max.hundred, "HFX")
max.lh.hundred <- ncvar_get(max.hundred, "LH")
max.u.hundred <- ncvar_get(max.hundred, "U10")
max.v.hundred <- ncvar_get(max.hundred, "V10")

max.temp.nudapt <- ncvar_get(max.nudapt, "T2")
max.sh.nudapt <- ncvar_get(max.nudapt, "HFX")
max.lh.nudapt <- ncvar_get(max.nudapt, "LH")
max.u.nudapt <- ncvar_get(max.nudapt, "U10")
max.v.nudapt <- ncvar_get(max.nudapt, "V10")

max.temp.nobldg <- ncvar_get(max.nobldg, "T2")
max.sh.nobldg <- ncvar_get(max.nobldg, "HFX")
max.lh.nobldg <- ncvar_get(max.nobldg, "LH")
max.u.nobldg <- ncvar_get(max.nobldg, "U10")
max.v.nobldg <- ncvar_get(max.nobldg, "V10")

max.humid.ten <- read.csv("NetCDF/rh_CSVs/DC/max_rh_10m_DC.csv")
max.humid.ten <- max.humid.ten$rh

max.humid.hundred <- read.csv("NetCDF/rh_CSVs/DC/max_rh_100m_DC.csv")
max.humid.hundred <- max.humid.hundred$rh

max.humid.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Time_Hourly_Humidity/max_rh_nudapt_DC.csv")
max.humid.nudapt <- max.humid.nudapt$rh

max.humid.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Time_Hourly_Humidity/max_rh_nobldg_DC.csv")
max.humid.nobldg <- max.humid.nobldg$rh

max.ws.ten <- sqrt(max.u.ten**2 + max.v.ten**2)
max.ws.hundred <- sqrt(max.u.hundred**2 + max.v.hundred**2)
max.ws.nudapt <- sqrt(max.u.nudapt**2 + max.v.nudapt**2)
max.ws.nobldg <- sqrt(max.u.nobldg**2 + max.v.nobldg**2)

min.ten <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcmn_10m.nc")
min.hundred <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcmn_100m.nc")
min.nudapt <- nc_open("NetCDF_new/Stats_nudapt/wdc_mn_stats_2010-07-01-10_nudapt.nc")
min.nobldg <- nc_open("NetCDF_new/Stats_nobldg/wdc_mn_stats_2010-07-01-10_nobldg.nc")

min.temp.ten <- ncvar_get(min.ten, "T2")
min.sh.ten <- ncvar_get(min.ten, "HFX")
min.lh.ten <- ncvar_get(min.ten, "LH")
min.u.ten <- ncvar_get(min.ten, "U10")
min.v.ten <- ncvar_get(min.ten, "V10")

min.temp.hundred <- ncvar_get(min.hundred, "T2")
min.sh.hundred <- ncvar_get(min.hundred, "HFX")
min.lh.hundred <- ncvar_get(min.hundred, "LH")
min.u.hundred <- ncvar_get(min.hundred, "U10")
min.v.hundred <- ncvar_get(min.hundred, "V10")

min.temp.nudapt <- ncvar_get(min.nudapt, "T2")
min.sh.nudapt <- ncvar_get(min.nudapt, "HFX")
min.lh.nudapt <- ncvar_get(min.nudapt, "LH")
min.u.nudapt <- ncvar_get(min.nudapt, "U10")
min.v.nudapt <- ncvar_get(min.nudapt, "V10")

min.temp.nobldg <- ncvar_get(min.nobldg, "T2")
min.sh.nobldg <- ncvar_get(min.nobldg, "HFX")
min.lh.nobldg <- ncvar_get(min.nobldg, "LH")
min.u.nobldg <- ncvar_get(min.nobldg, "U10")
min.v.nobldg <- ncvar_get(min.nobldg, "V10")

min.humid.ten <- read.csv("NetCDF/rh_CSVs/DC/min_rh_10m_DC.csv")
min.humid.ten <- min.humid.ten$rh

min.humid.hundred <- read.csv("NetCDF/rh_CSVs/DC/min_rh_100m_DC.csv")
min.humid.hundred <- min.humid.hundred$rh

min.humid.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Time_Hourly_Humidity/min_rh_nudapt_DC.csv")
min.humid.nudapt <- min.humid.nudapt$rh

min.humid.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Time_Hourly_Humidity/min_rh_nobldg_DC.csv")
min.humid.nobldg <- min.humid.nobldg$rh

av.ten <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcav_10m.nc")
av.hundred <- nc_open("NetCDF/timeavs22/d03_2010-07-01-10_wdcav_100m.nc")
av.nudapt <- nc_open("NetCDF_new/Stats_nudapt/wdc_av_stats_2010-07-01-10_nudapt.nc")
av.nobldg <- nc_open("NetCDF_new/Stats_nobldg/wdc_av_stats_2010-07-01-10_nobldg.nc")

av.temp.ten <- ncvar_get(av.ten, "T2")
av.sh.ten <- ncvar_get(av.ten, "HFX")
av.lh.ten <- ncvar_get(av.ten, "LH")
av.u.ten <- ncvar_get(av.ten, "U10")
av.v.ten <- ncvar_get(av.ten, "V10")

av.temp.hundred <- ncvar_get(av.hundred, "T2")
av.sh.hundred <- ncvar_get(av.hundred, "HFX")
av.lh.hundred <- ncvar_get(av.hundred, "LH")
av.u.hundred <- ncvar_get(av.hundred, "U10")
av.v.hundred <- ncvar_get(av.hundred, "V10")

av.temp.nudapt <- ncvar_get(av.nudapt, "T2")
av.sh.nudapt <- ncvar_get(av.nudapt, "HFX")
av.lh.nudapt <- ncvar_get(av.nudapt, "LH")
av.u.nudapt <- ncvar_get(av.nudapt, "U10")
av.v.nudapt <- ncvar_get(av.nudapt, "V10")

av.temp.nobldg <- ncvar_get(av.nobldg, "T2")
av.sh.nobldg <- ncvar_get(av.nobldg, "HFX")
av.lh.nobldg <- ncvar_get(av.nobldg, "LH")
av.u.nobldg <- ncvar_get(av.nobldg, "U10")
av.v.nobldg <- ncvar_get(av.nobldg, "V10")

av.humid.ten <- read.csv("NetCDF/rh_CSVs/DC/avg_rh_10m_DC.csv")
av.humid.ten <- av.humid.ten$rh

av.humid.hundred <- read.csv("NetCDF/rh_CSVs/DC/avg_rh_100m_DC.csv")
av.humid.hundred <- av.humid.hundred$rh

av.humid.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Time_Hourly_Humidity/avg_rh_nudapt_DC.csv")
av.humid.nudapt <- av.humid.nudapt$rh

av.humid.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Time_Hourly_Humidity/avg_rh_nobldg_DC.csv")
av.humid.nobldg <- av.humid.nobldg$rh



###############################################################################################
#                                                                                             #
# This section tests each variable for statistical significance and creates a table for the   #
# statistics.                                                                                 #                              
#                                                                                             #
###############################################################################################

max.temp.wil.th <- wilcox.test(max.temp.ten, max.temp.hundred)
av.temp.wil.th <- wilcox.test(av.temp.ten, av.temp.hundred)
min.temp.wil.th <- wilcox.test(min.temp.ten, min.temp.hundred)
av.humid.wil.th <- wilcox.test(av.humid.ten, av.humid.hundred)
max.ws.wil.th <- wilcox.test(max.ws.ten, max.ws.hundred)
max.sh.wil.th <- wilcox.test(max.sh.ten, max.sh.hundred)
av.sh.wil.th <- wilcox.test(av.sh.ten, av.sh.hundred)
min.sh.wil.th <- wilcox.test(min.sh.ten, min.sh.hundred)
max.lh.wil.th <- wilcox.test(max.lh.ten, max.lh.hundred)
av.lh.wil.th <- wilcox.test(av.lh.ten, av.lh.hundred)
min.lh.wil.th <- wilcox.test(min.lh.ten, min.lh.hundred)
max.rh.wil.th <- wilcox.test(max.humid.ten, max.humid.hundred)
av.rh.wil.th <- wilcox.test(av.humid.ten, av.humid.hundred)
min.rh.wil.th <- wilcox.test(min.humid.ten, min.humid.hundred)

max.temp.wil.tnu <- wilcox.test(max.temp.ten, max.temp.nudapt)
av.temp.wil.tnu <- wilcox.test(av.temp.ten, av.temp.nudapt)
min.temp.wil.tnu <- wilcox.test(min.temp.ten, min.temp.nudapt)
av.humid.wil.tnu <- wilcox.test(av.humid.ten, av.humid.nudapt)
max.ws.wil.tnu <- wilcox.test(max.ws.ten, max.ws.nudapt)
max.sh.wil.tnu <- wilcox.test(max.sh.ten, max.sh.nudapt)
av.sh.wil.tnu <- wilcox.test(av.sh.ten, av.sh.nudapt)
min.sh.wil.tnu <- wilcox.test(min.sh.ten, min.sh.nudapt)
max.lh.wil.tnu <- wilcox.test(max.lh.ten, max.lh.nudapt)
av.lh.wil.tnu <- wilcox.test(av.lh.ten, av.lh.nudapt)
min.lh.wil.tnu <- wilcox.test(min.lh.ten, min.lh.nudapt)
max.rh.wil.tnu <- wilcox.test(max.humid.ten, max.humid.nudapt)
av.rh.wil.tnu <- wilcox.test(av.humid.ten, av.humid.nudapt)
min.rh.wil.tnu <- wilcox.test(min.humid.ten, min.humid.nudapt)

max.temp.wil.tno <- wilcox.test(max.temp.ten, max.temp.nobldg)
av.temp.wil.tno <- wilcox.test(av.temp.ten, av.temp.nobldg)
min.temp.wil.tno <- wilcox.test(min.temp.ten, min.temp.nobldg)
av.humid.wil.tno <- wilcox.test(av.humid.ten, av.humid.nobldg)
max.ws.wil.tno <- wilcox.test(max.ws.ten, max.ws.nobldg)
max.sh.wil.tno <- wilcox.test(max.sh.ten, max.sh.nobldg)
av.sh.wil.tno <- wilcox.test(av.sh.ten, av.sh.nobldg)
min.sh.wil.tno <- wilcox.test(min.sh.ten, min.sh.nobldg)
max.lh.wil.tno <- wilcox.test(max.lh.ten, max.lh.nobldg)
av.lh.wil.tno <- wilcox.test(av.lh.ten, av.lh.nobldg)
min.lh.wil.tno <- wilcox.test(min.lh.ten, min.lh.nobldg)
max.rh.wil.tno <- wilcox.test(max.humid.ten, max.humid.nobldg)
av.rh.wil.tno <- wilcox.test(av.humid.ten, av.humid.nobldg)
min.rh.wil.tno <- wilcox.test(min.humid.ten, min.humid.nobldg)

max.temp.wil.hnu <- wilcox.test(max.temp.hundred, max.temp.nudapt)
av.temp.wil.hnu <- wilcox.test(av.temp.hundred, av.temp.nudapt)
min.temp.wil.hnu <- wilcox.test(min.temp.hundred, min.temp.nudapt)
av.humid.wil.hnu <- wilcox.test(av.humid.hundred, av.humid.nudapt)
max.ws.wil.hnu <- wilcox.test(max.ws.hundred, max.ws.nudapt)
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
max.sh.wil.hno <- wilcox.test(max.sh.hundred, max.sh.nobldg)
av.sh.wil.hno <- wilcox.test(av.sh.hundred, av.sh.nobldg)
min.sh.wil.hno <- wilcox.test(min.sh.hundred, min.sh.nobldg)
max.lh.wil.hno <- wilcox.test(max.lh.hundred, max.lh.nobldg)
av.lh.wil.hno <- wilcox.test(av.lh.hundred, av.lh.nobldg)
min.lh.wil.hno <- wilcox.test(min.lh.hundred, min.lh.nobldg)
max.rh.wil.hno <- wilcox.test(max.humid.hundred, max.humid.nobldg)
av.rh.wil.hno <- wilcox.test(av.humid.hundred, av.humid.nobldg)
min.rh.wil.hno <- wilcox.test(min.humid.hundred, min.humid.nobldg)

max.temp.wil.nuno <- wilcox.test(max.temp.nudapt, max.temp.nobldg)
av.temp.wil.nuno <- wilcox.test(av.temp.nudapt, av.temp.nobldg)
min.temp.wil.nuno <- wilcox.test(min.temp.nudapt, min.temp.nobldg)
av.humid.wil.nuno <- wilcox.test(av.humid.nudapt, av.humid.nobldg)
max.ws.wil.nuno <- wilcox.test(max.ws.nudapt, max.ws.nobldg)
max.sh.wil.nuno <- wilcox.test(max.sh.nudapt, max.sh.nobldg)
av.sh.wil.nuno <- wilcox.test(av.sh.nudapt, av.sh.nobldg)
min.sh.wil.nuno <- wilcox.test(min.sh.nudapt, min.sh.nobldg)
max.lh.wil.nuno <- wilcox.test(max.lh.nudapt, max.lh.nobldg)
av.lh.wil.nuno <- wilcox.test(av.lh.nudapt, av.lh.nobldg)
min.lh.wil.nuno <- wilcox.test(min.lh.nudapt, min.lh.nobldg)
max.rh.wil.nuno <- wilcox.test(max.humid.nudapt, max.humid.nobldg)
av.rh.wil.nuno <- wilcox.test(av.humid.nudapt, av.humid.nobldg)
min.rh.wil.nuno <- wilcox.test(min.humid.nudapt, min.humid.nobldg)

Group <- c("Max Temp", "Avg Temp", "Min Temp", "Max Rel Hum", "Avg Rel Hum", "Min Rel Hum", 
           "Wind Speed", "Max SH", "Avg SH", "Min SH", "Max LH", "Avg LH", "Min LH")

W <- c(max.temp.wil.th$statistic, av.temp.wil.th$statistic, min.temp.wil.th$statistic, 
       max.rh.wil.th$statistic, av.humid.wil.th$statistic, min.rh.wil.th$statistic, 
       max.ws.wil.th$statistic, max.sh.wil.th$statistic, av.sh.wil.th$statistic,
       min.sh.wil.th$statistic, max.lh.wil.th$statistic, av.lh.wil.th$statistic, 
       min.lh.wil.th$statistic)

p <- c(max.temp.wil.th$p.value, av.temp.wil.th$p.value, min.temp.wil.th$p.value, 
       max.rh.wil.th$p.value, av.humid.wil.th$p.value, min.rh.wil.th$p.value,
       max.ws.wil.th$p.value, max.sh.wil.th$p.value, av.sh.wil.th$p.value,
       min.sh.wil.th$p.value, max.lh.wil.th$p.value, av.lh.wil.th$p.value, 
       min.lh.wil.th$p.value)

p <- round(p, digits = 3)

df.wil.th <- data.frame(W, p)
windows()
grid.table(df.wil.th, rows = Group)

W <- c(max.temp.wil.tnu$statistic, av.temp.wil.tnu$statistic, min.temp.wil.tnu$statistic, 
       max.rh.wil.tnu$statistic, av.humid.wil.tnu$statistic, min.rh.wil.tnu$statistic, 
       max.ws.wil.tnu$statistic, max.sh.wil.tnu$statistic, av.sh.wil.tnu$statistic,
       min.sh.wil.tnu$statistic, max.lh.wil.tnu$statistic, av.lh.wil.tnu$statistic, 
       min.lh.wil.tnu$statistic)

p <- c(max.temp.wil.tnu$p.value, av.temp.wil.tnu$p.value, min.temp.wil.tnu$p.value, 
       max.rh.wil.tnu$p.value, av.humid.wil.tnu$p.value, min.rh.wil.tnu$p.value,
       max.ws.wil.tnu$p.value, max.sh.wil.tnu$p.value, av.sh.wil.tnu$p.value,
       min.sh.wil.tnu$p.value, max.lh.wil.tnu$p.value, av.lh.wil.tnu$p.value, 
       min.lh.wil.tnu$p.value)

p <- round(p, digits = 3)

df.wil.tnu <- data.frame(W, p)
windows()
grid.table(df.wil.tnu, rows = Group)

W <- c(max.temp.wil.tno$statistic, av.temp.wil.tno$statistic, min.temp.wil.tno$statistic, 
       max.rh.wil.tno$statistic, av.humid.wil.tno$statistic, min.rh.wil.tno$statistic, 
       max.ws.wil.tno$statistic, max.sh.wil.tno$statistic, av.sh.wil.tno$statistic,
       min.sh.wil.tno$statistic, max.lh.wil.tno$statistic, av.lh.wil.tno$statistic, 
       min.lh.wil.tno$statistic)

p <- c(max.temp.wil.tno$p.value, av.temp.wil.tno$p.value, min.temp.wil.tno$p.value, 
       max.rh.wil.tno$p.value, av.humid.wil.tno$p.value, min.rh.wil.tno$p.value,
       max.ws.wil.tno$p.value, max.sh.wil.tno$p.value, av.sh.wil.tno$p.value,
       min.sh.wil.tno$p.value, max.lh.wil.tno$p.value, av.lh.wil.tno$p.value, 
       min.lh.wil.tno$p.value)

p <- round(p, digits = 3)

df.wil.tno <- data.frame(W, p)
windows()
grid.table(df.wil.tno, rows = Group)

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

W <- c(max.temp.wil.nuno$statistic, av.temp.wil.nuno$statistic, min.temp.wil.nuno$statistic, 
       max.rh.wil.nuno$statistic, av.humid.wil.nuno$statistic, min.rh.wil.nuno$statistic, 
       max.ws.wil.nuno$statistic, max.sh.wil.nuno$statistic, av.sh.wil.nuno$statistic,
       min.sh.wil.nuno$statistic, max.lh.wil.nuno$statistic, av.lh.wil.nuno$statistic, 
       min.lh.wil.nuno$statistic)

p <- c(max.temp.wil.nuno$p.value, av.temp.wil.nuno$p.value, min.temp.wil.nuno$p.value, 
       max.rh.wil.nuno$p.value, av.humid.wil.nuno$p.value, min.rh.wil.nuno$p.value,
       max.ws.wil.nuno$p.value, max.sh.wil.nuno$p.value, av.sh.wil.nuno$p.value,
       min.sh.wil.nuno$p.value, max.lh.wil.nuno$p.value, av.lh.wil.nuno$p.value, 
       min.lh.wil.nuno$p.value)

p <- round(p, digits = 3)

df.wil.nuno <- data.frame(W, p)
windows()
grid.table(df.wil.nuno, rows = Group)
###############################################################################################
#                                                                                             #
# This section creates histograms for all of the variables.                                   #                              
#                                                                                             #
###############################################################################################

c1 <- rgb(228, 26, 28, max = 255, alpha = 80)
c2 <- rgb(55, 126, 184, max = 255, alpha = 80)
c3 <- rgb(77, 175, 74, max = 255, alpha = 80)
c4 <- rgb(152, 78, 163, max = 255, alpha = 80)

mtt <- hist(max.temp.ten)
mth <- hist(max.temp.hundred)
mtnu <- hist(max.temp.nudapt)
mtno <- hist(max.temp.nobldg)

plot(mtt, col=c1, main = "", xlab = "Temperature (K)")
plot(mth, col=c2, add = TRUE)
plot(mtnu, col=c3, add = TRUE)
plot(mtno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

att <- hist(av.temp.ten)
ath <- hist(av.temp.hundred)
atnu <- hist(av.temp.nudapt)
atno <- hist(av.temp.nobldg)

plot(att, col=c1, main = "", xlab = "Temperature (K)", ylim = c(0, 2000))
plot(ath, col=c2, add = TRUE)
plot(atnu, col=c3, add = TRUE)
plot(atno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

mitt <- hist(min.temp.ten)
mith <- hist(min.temp.hundred)
mitnu <- hist(min.temp.nudapt)
mitno <- hist(min.temp.nobldg)

plot(mitt, col=c1, main = "", xlab = "Temperature (K)")
plot(mith, col=c2, add = TRUE)
plot(mitnu, col=c3, add = TRUE)
plot(mitno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

mwt <- hist(max.ws.ten)
mwh <- hist(max.ws.hundred)
mwnu <- hist(max.ws.nudapt)
mwno <- hist(max.ws.nobldg)

plot(mwt, col=c1, main = "", xlab = "Wind Speed (m/s)", ylim = c(0, 3250))
plot(mwh, col=c2, add = TRUE)
plot(mwnu, col=c3, add = TRUE)
plot(mwno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

mht <- hist(max.humid.ten)
mhh <- hist(max.humid.hundred)
mhnu <- hist(max.humid.nudapt)
mhno <- hist(max.humid.nobldg)

plot(mht, col=c1, main = "", xlab = "Humidity (%)", ylim = c(0, 4000))
plot(mhh, col=c2, add = TRUE)
plot(mhnu, col=c3, add = TRUE)
plot(mhno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

aht <- hist(av.humid.ten)
ahh <- hist(av.humid.hundred)
ahnu <- hist(av.humid.nudapt)
ahno <- hist(av.humid.nobldg)

plot(aht, col=c1, main = "", xlab = "Humidity (%)", ylim = c(0, 3000))
plot(ahh, col=c2, add = TRUE)
plot(ahnu, col=c3, add = TRUE)
plot(ahno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

miht <- hist(min.humid.ten)
mihh <- hist(min.humid.hundred)
mihnu <- hist(min.humid.nudapt)
mihno <- hist(min.humid.nobldg)

plot(miht, col=c1, main = "", xlab = "Humidity (%)", ylim = c(0, 2000))
plot(mihh, col=c2, add = TRUE)
plot(mihnu, col=c3, add = TRUE)
plot(mihno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

label <- expression(Sensible ~ Heat ~ Flux ~ (Wm^"-2"))
mst <- hist(max.sh.ten)
msh <- hist(max.sh.hundred)
msnu <- hist(max.sh.nudapt)
msno <- hist(max.sh.nobldg)

plot(mst, col=c1, main = "", xlab = label, ylim = c(0, 2250))
plot(msh, col=c2, add = TRUE)
plot(msnu, col=c3, add = TRUE)
plot(msno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

ast <- hist(av.sh.ten)
ash <- hist(av.sh.hundred)
asnu <- hist(av.sh.nudapt)
asno <- hist(av.sh.nobldg)

plot(ast, col=c1, main = "", xlab = label, ylim = c(0, 1200))
plot(ash, col=c2, add = TRUE)
plot(asnu, col=c3, add = TRUE)
plot(asno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

mist <- hist(min.sh.ten)
mish <- hist(min.sh.hundred)
misnu <- hist(min.sh.nudapt)
misno <- hist(min.sh.nobldg)

plot(mist, col=c1, main = "", xlab = label, ylim = c(0,3000))
plot(mish, col=c2, add = TRUE)
plot(misnu, col=c3, add = TRUE)
plot(misno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

label <- expression(Latent ~ Heat ~ Flux ~ (Wm^"-2"))
mlt <- hist(max.lh.ten)
mlh <- hist(max.lh.hundred)
mlnu <- hist(max.lh.nudapt)
mlno <- hist(max.lh.nobldg)

plot(mlt, col=c1, main = "", xlab = label)
plot(mlh, col=c2, add = TRUE)
plot(mlnu, col=c3, add = TRUE)
plot(mlno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

alt <- hist(av.lh.ten)
alh <- hist(av.lh.hundred)
alnu <- hist(av.lh.nudapt)
alno <- hist(av.lh.nobldg)

plot(alt, col=c1, main = "", xlab = label)
plot(alh, col=c2, add = TRUE)
plot(alnu, col=c3, add = TRUE)
plot(alno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

milt <- hist(min.lh.ten)
milh <- hist(min.lh.hundred)
milnu <- hist(min.lh.nudapt)
milno <- hist(min.lh.nobldg)

plot(milt, col=c1, main = "Minimum Latent Heat Flux", xlab = label, ylim = c(0, 7000))
plot(milh, col=c2, add = TRUE)
plot(milnu, col=c3, add = TRUE)
plot(milno, col=c4, add = TRUE)
legend("topright", c("10 Meter", "100 Meter", "NUDAPT", "NoBldg"), fill = c(c1, c2, c3, c4))

###############################################################################################
#                                                                                             #
# This section calculates the summary statistics for each variable, translates them to a      #
# data frame, and then binds them all together into a table.                                  #
#                                                                                             #
###############################################################################################

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

################################################################################################




