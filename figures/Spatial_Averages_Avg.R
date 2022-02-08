library(ncdf4)
library(ggplot2)
library(weathermetrics)
library(humidity)
library(ggpubr)


setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spatialavs10m/av")

# This section opens up the WRF output files and stores T2, PBLH, Q2, PSFC, and Times as variables in R for each day and resolution

t.one <- nc_open("sp.wrfout_d03_2010-07-01_wdcav_10m.nc")
temp.t.one <- ncvar_get(t.one, "T2")
PBLH.t.one <- ncvar_get(t.one, "PBLH")
Qtwo.t.one <- ncvar_get(t.one, "Q2")
PSFC.t.one <- ncvar_get(t.one, "PSFC")
time.one <- ncvar_get(t.one, "Times")

t.two <- nc_open("sp.wrfout_d03_2010-07-02_wdcav_10m.nc")
temp.t.two <- ncvar_get(t.two, "T2")
PBLH.t.two <- ncvar_get(t.two, "PBLH")
Qtwo.t.two <- ncvar_get(t.two, "Q2")
PSFC.t.two <- ncvar_get(t.two, "PSFC")
time.two <- ncvar_get(t.two, "Times")

t.three <- nc_open("sp.wrfout_d03_2010-07-03_wdcav_10m.nc")
temp.t.three <- ncvar_get(t.three, "T2")
PBLH.t.three <- ncvar_get(t.three, "PBLH")
Qtwo.t.three <- ncvar_get(t.three, "Q2")
PSFC.t.three <- ncvar_get(t.three, "PSFC")
time.three <- ncvar_get(t.three, "Times")

t.four <- nc_open("sp.wrfout_d03_2010-07-04_wdcav_10m.nc")
temp.t.four <- ncvar_get(t.four, "T2")
PBLH.t.four <- ncvar_get(t.four, "PBLH")
Qtwo.t.four <- ncvar_get(t.four, "Q2")
PSFC.t.four <- ncvar_get(t.four, "PSFC")
time.four <- ncvar_get(t.four, "Times")

t.five <- nc_open("sp.wrfout_d03_2010-07-05_wdcav_10m.nc")
temp.t.five <- ncvar_get(t.five, "T2")
PBLH.t.five <- ncvar_get(t.five, "PBLH")
Qtwo.t.five <- ncvar_get(t.five, "Q2")
PSFC.t.five <- ncvar_get(t.five, "PSFC")
time.five <- ncvar_get(t.five, "Times")

t.six <- nc_open("sp.wrfout_d03_2010-07-06_wdcav_10m.nc")
temp.t.six <- ncvar_get(t.six, "T2")
PBLH.t.six <- ncvar_get(t.six, "PBLH")
Qtwo.t.six <- ncvar_get(t.six, "Q2")
PSFC.t.six <- ncvar_get(t.six, "PSFC")
time.six <- ncvar_get(t.six, "Times")

t.seven <- nc_open("sp.wrfout_d03_2010-07-07_wdcav_10m.nc")
temp.t.seven <- ncvar_get(t.seven, "T2")
PBLH.t.seven <- ncvar_get(t.seven, "PBLH")
Qtwo.t.seven <- ncvar_get(t.seven, "Q2")
PSFC.t.seven <- ncvar_get(t.seven, "PSFC")
time.seven <- ncvar_get(t.seven, "Times")

t.eight <- nc_open("sp.wrfout_d03_2010-07-08_wdcav_10m.nc")
temp.t.eight <- ncvar_get(t.eight, "T2")
PBLH.t.eight <- ncvar_get(t.eight, "PBLH")
Qtwo.t.eight <- ncvar_get(t.eight, "Q2")
PSFC.t.eight <- ncvar_get(t.eight, "PSFC")
time.eight <- ncvar_get(t.eight, "Times")

t.nine <- nc_open("sp.wrfout_d03_2010-07-09_wdcav_10m.nc")
temp.t.nine <- ncvar_get(t.nine, "T2")
PBLH.t.nine <- ncvar_get(t.nine, "PBLH")
Qtwo.t.nine <- ncvar_get(t.nine, "Q2")
PSFC.t.nine <- ncvar_get(t.nine, "PSFC")
time.nine <- ncvar_get(t.nine, "Times")

t.ten <- nc_open("sp.wrfout_d03_2010-07-10_wdcav_10m.nc")
temp.t.ten <- ncvar_get(t.ten, "T2")
PBLH.t.ten <- ncvar_get(t.ten, "PBLH")
Qtwo.t.ten <- ncvar_get(t.ten, "Q2")
PSFC.t.ten <- ncvar_get(t.ten, "PSFC")
time.ten <- ncvar_get(t.ten, "Times")

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spatialavs100m/av")

h.one <- nc_open("sp.wrfout_d03_2010-07-01_wdcav_100m.nc")
temp.h.one <- ncvar_get(h.one, "T2")
PBLH.h.one <- ncvar_get(h.one, "PBLH")
Qtwo.h.one <- ncvar_get(h.one, "Q2")
PSFC.h.one <- ncvar_get(h.one, "PSFC")

h.two <- nc_open("sp.wrfout_d03_2010-07-02_wdcav_100m.nc")
temp.h.two <- ncvar_get(h.two, "T2")
PBLH.h.two <- ncvar_get(h.two, "PBLH")
Qtwo.h.two <- ncvar_get(h.two, "Q2")
PSFC.h.two <- ncvar_get(h.two, "PSFC")

h.three <- nc_open("sp.wrfout_d03_2010-07-03_wdcav_100m.nc")
temp.h.three <- ncvar_get(h.three, "T2")
PBLH.h.three <- ncvar_get(h.three, "PBLH")
Qtwo.h.three <- ncvar_get(h.three, "Q2")
PSFC.h.three <- ncvar_get(h.three, "PSFC")

h.four <- nc_open("sp.wrfout_d03_2010-07-04_wdcav_100m.nc")
temp.h.four <- ncvar_get(h.four, "T2")
PBLH.h.four <- ncvar_get(h.four, "PBLH")
Qtwo.h.four <- ncvar_get(h.four, "Q2")
PSFC.h.four <- ncvar_get(h.four, "PSFC")

h.five <- nc_open("sp.wrfout_d03_2010-07-05_wdcav_100m.nc")
temp.h.five <- ncvar_get(h.five, "T2")
PBLH.h.five <- ncvar_get(h.five, "PBLH")
Qtwo.h.five <- ncvar_get(h.five, "Q2")
PSFC.h.five <- ncvar_get(h.five, "PSFC")

h.six <- nc_open("sp.wrfout_d03_2010-07-06_wdcav_100m.nc")
temp.h.six <- ncvar_get(h.six, "T2")
PBLH.h.six <- ncvar_get(h.six, "PBLH")
Qtwo.h.six <- ncvar_get(h.six, "Q2")
PSFC.h.six <- ncvar_get(h.six, "PSFC")

h.seven <- nc_open("sp.wrfout_d03_2010-07-07_wdcav_100m.nc")
temp.h.seven <- ncvar_get(h.seven, "T2")
PBLH.h.seven <- ncvar_get(h.seven, "PBLH")
Qtwo.h.seven <- ncvar_get(h.seven, "Q2")
PSFC.h.seven <- ncvar_get(h.seven, "PSFC")

h.eight <- nc_open("sp.wrfout_d03_2010-07-08_wdcav_100m.nc")
temp.h.eight <- ncvar_get(h.eight, "T2")
PBLH.h.eight <- ncvar_get(h.eight, "PBLH")
Qtwo.h.eight <- ncvar_get(h.eight, "Q2")
PSFC.h.eight <- ncvar_get(h.eight, "PSFC")

h.nine <- nc_open("sp.wrfout_d03_2010-07-09_wdcav_100m.nc")
temp.h.nine <- ncvar_get(h.nine, "T2")
PBLH.h.nine <- ncvar_get(h.nine, "PBLH")
Qtwo.h.nine <- ncvar_get(h.nine, "Q2")
PSFC.h.nine <- ncvar_get(h.nine, "PSFC")

h.ten <- nc_open("sp.wrfout_d03_2010-07-10_wdcav_100m.nc")
temp.h.ten <- ncvar_get(h.ten, "T2")
PBLH.h.ten <- ncvar_get(h.ten, "PBLH")
Qtwo.h.ten <- ncvar_get(h.ten, "Q2")
PSFC.h.ten <- ncvar_get(h.ten, "PSFC")

# This next section concatenates all the daily values into vectors for each variable, and then puts them into dataframes indexed by date

days <- c(1:10)
dates <- c(time.one, time.two, time.three, time.four, time.five, time.six, time.seven, time.eight, time.nine, time.ten)
dates <- as.POSIXct(dates, format ="%Y%m%dT%H%M", tz = "America/New_York")

temp.t <- c(temp.t.one, temp.t.two, temp.t.three, temp.t.four, temp.t.five, temp.t.six, temp.t.seven, temp.t.eight, temp.t.nine, temp.t.ten)
temp.h <- c(temp.h.one, temp.h.two, temp.h.three, temp.h.four, temp.h.five, temp.h.six, temp.h.seven, temp.h.eight, temp.h.nine, temp.h.ten)
dfT = data.frame(days,temp.t,temp.h)
temp.t.F <- kelvin.to.fahrenheit(temp.t)
temp.h.F <- kelvin.to.fahrenheit(temp.h)
dfT.F <- data.frame(days,temp.t.F,temp.h.F)

PBLH.t <- c(PBLH.t.one, PBLH.t.two, PBLH.t.three, PBLH.t.four, PBLH.t.five, PBLH.t.six, PBLH.t.seven, PBLH.t.eight, PBLH.t.nine, PBLH.t.ten)
PBLH.h <- c(PBLH.h.one, PBLH.h.two, PBLH.h.three, PBLH.h.four, PBLH.h.five, PBLH.h.six, PBLH.h.seven, PBLH.h.eight, PBLH.h.nine, PBLH.h.ten)
dfP = data.frame(days,PBLH.t,PBLH.h)

Qtwo.t <- c(Qtwo.t.one, Qtwo.t.two, Qtwo.t.three, Qtwo.t.four, Qtwo.t.five, Qtwo.t.six, Qtwo.t.seven, Qtwo.t.eight, Qtwo.t.nine, Qtwo.t.ten)
Qtwo.h <- c(Qtwo.h.one, Qtwo.h.two, Qtwo.h.three, Qtwo.h.four, Qtwo.h.five, Qtwo.h.six, Qtwo.h.seven, Qtwo.h.eight, Qtwo.h.nine, Qtwo.h.ten)
dfQ = data.frame(days,Qtwo.t,Qtwo.h)

PSFC.t <- c(PSFC.t.one, PSFC.t.two, PSFC.t.three, PSFC.t.four, PSFC.t.five, PSFC.t.six, PSFC.t.seven, PSFC.t.eight, PSFC.t.nine, PSFC.t.ten)
PSFC.h <- c(PSFC.h.one, PSFC.h.two, PSFC.h.three, PSFC.h.four, PSFC.h.five, PSFC.h.six, PSFC.h.seven, PSFC.h.eight, PSFC.h.nine, PSFC.h.ten)
dfPS = data.frame(days,PSFC.t,PSFC.h)

humid.t <- SH2RH(Qtwo.t,temp.t,PSFC.t,isK=TRUE)
humid.h <- SH2RH(Qtwo.h,temp.h,PSFC.h,isK=TRUE)
dfH <- data.frame(days,humid.t,humid.h)

# This final portion creates plots for PBLH, temperature, and humidity, with the last two being compared to historical values
# The .hist variables refer to DCA observations, and the Arboretum and Daymet values are calcualted in the Daymet_and_Arboretum.R script

colors <- c("10 Meter" = "darkred", "100 Meter" = "blue", "DCA" = "black", "National Arboretum" = "darkgreen", "Daymet" = "purple")
lines <- c("10 Meter" = 1,  "100 Meter" = 1, "DCA" = 2, "National Arboretum" = 3, "Daymet" = 4)

Pav <- ggplot(dfP, aes(x=days)) + geom_line(aes(y=PBLH.t), color="darkred", size = 1.5) + geom_line(aes(y=PBLH.h), color="blue", size = 1.5) + labs(title = "Average PBLH", x = "Days", y = "Atmospheric Boundary Layer Thickness (m)") + scale_x_continuous(breaks=seq(1,10, by = 1)) + theme_bw()

temp.hist <- c(73.3, 73.3, 73.3, 81.0, 86.5, 90.7, 91.7, 86.7, 82.4, 75.5)
humid.hist <- c(35.5, 38.4, 43.1, 49.3, 48.9, 46.7, 45.1, 56.8, 63.4, 82.1)
dfTh <- data.frame(days, temp.hist)
dfHh <- data.frame(days, humid.hist)
dfTt <- data.frame(days,temp.t.F,temp.h.F,temp.hist, narbor.av)
dfHt <- data.frame(days,humid.t,humid.h,humid.hist)
Ttav <- ggplot(dfTt, aes(x=days)) + geom_line(aes(y=temp.t.F), color="darkred", size=1.5) + geom_line(aes(y=temp.h.F), color="blue", size=1.5) + geom_line(aes(y=temp.hist), color="black", size=1, linetype="dashed") + geom_line(aes(y=narbor.av), color="darkgreen", size=1, linetype="dotted") + geom_line(aes(y=tav.F), linetype=4, color="purple", size=1) + labs(title = "Average Temperatures", x = "Days", y = "Temperature (F)") + scale_x_continuous(breaks=seq(1,10, by = 1)) + scale_y_continuous(breaks=seq(60,95, by = 5)) + theme_bw()
Htav <- ggplot(dfHt, aes(x=days)) + geom_line(aes(y=humid.t), color="darkred", size=1.5) + geom_line(aes(y=humid.h), color="blue", size=1.5) + geom_line(aes(y=humid.hist), color="black", size=1, linetype="dashed") + geom_line(aes(y=rh), color="purple", size=1, linetype=4)+ labs(title = "Average Relative Humidity", x = "Days", y = "Humidity (%)") + scale_x_continuous(breaks=seq(1,10, by = 1)) + scale_y_continuous(breaks=seq(35,90, by = 5)) + theme_bw()

windows()
ggarrange(Ttav,Htav)
