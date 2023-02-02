library(weathermetrics)
library(ncdf4)
library(openair)
library(dplyr)


setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spuvhrly10m")

# This section opens up the WRF output files and stores U10, V10, and Times as variables in R for each day and resolution

t.one <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-01_wdccat_10m.nc")
Uten.t.one <- ncvar_get(t.one, "U10")
Vten.t.one <- ncvar_get(t.one, "V10")
time.one <- ncvar_get(t.one, "Times")

t.two <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-02_wdccat_10m.nc")
Uten.t.two <- ncvar_get(t.two, "U10")
Vten.t.two <- ncvar_get(t.two, "V10")
time.two <- ncvar_get(t.two, "Times")

t.three <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-03_wdccat_10m.nc")
Uten.t.three <- ncvar_get(t.three, "U10")
Vten.t.three <- ncvar_get(t.three, "V10")
time.three <- ncvar_get(t.three, "Times")

t.four <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-04_wdccat_10m.nc")
Uten.t.four <- ncvar_get(t.four, "U10")
Vten.t.four <- ncvar_get(t.four, "V10")
time.four <- ncvar_get(t.four, "Times")

t.five <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-05_wdccat_10m.nc")
Uten.t.five <- ncvar_get(t.five, "U10")
Vten.t.five <- ncvar_get(t.five, "V10")
time.five <- ncvar_get(t.five, "Times")

t.six <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-06_wdccat_10m.nc")
Uten.t.six <- ncvar_get(t.six, "U10")
Vten.t.six <- ncvar_get(t.six, "V10")
time.six <- ncvar_get(t.six, "Times")

t.seven <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-07_wdccat_10m.nc")
Uten.t.seven <- ncvar_get(t.seven, "U10")
Vten.t.seven <- ncvar_get(t.seven, "V10")
time.seven <- ncvar_get(t.seven, "Times")

t.eight <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-08_wdccat_10m.nc")
Uten.t.eight <- ncvar_get(t.eight, "U10")
Vten.t.eight <- ncvar_get(t.eight, "V10")
time.eight <- ncvar_get(t.eight, "Times")

t.nine <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-09_wdccat_10m.nc")
Uten.t.nine <- ncvar_get(t.nine, "U10")
Vten.t.nine <- ncvar_get(t.nine, "V10")
time.nine <- ncvar_get(t.nine, "Times")

t.t <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-10_wdccat_10m.nc")
Uten.t.ten <- ncvar_get(t.t, "U10")
Vten.t.ten <- ncvar_get(t.t, "V10")
time.ten <- ncvar_get(t.t, "Times")

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spuvhrly100m")

h.one <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-01_wdccat_100m.nc")
Uten.h.one <- ncvar_get(h.one, "U10")
Vten.h.one <- ncvar_get(h.one, "V10")
time.h.one <- ncvar_get(h.one, "Times")

h.two <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-02_wdccat_100m.nc")
Uten.h.two <- ncvar_get(h.two, "U10")
Vten.h.two <- ncvar_get(h.two, "V10")
time.h.two <- ncvar_get(h.two, "Times")

h.three <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-03_wdccat_100m.nc")
Uten.h.three <- ncvar_get(h.three, "U10")
Vten.h.three <- ncvar_get(h.three, "V10")
time.h.three <- ncvar_get(h.three, "Times")

h.four <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-04_wdccat_100m.nc")
Uten.h.four <- ncvar_get(h.four, "U10")
Vten.h.four <- ncvar_get(h.four, "V10")
time.h.four <- ncvar_get(h.four, "Times")

h.five <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-05_wdccat_100m.nc")
Uten.h.five <- ncvar_get(h.five, "U10")
Vten.h.five <- ncvar_get(h.five, "V10")
time.h.five <- ncvar_get(h.five, "Times")

h.six <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-06_wdccat_100m.nc")
Uten.h.six <- ncvar_get(h.six, "U10")
Vten.h.six <- ncvar_get(h.six, "V10")
time.h.six <- ncvar_get(h.six, "Times")

h.seven <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-07_wdccat_100m.nc")
Uten.h.seven <- ncvar_get(h.seven, "U10")
Vten.h.seven <- ncvar_get(h.seven, "V10")
time.h.seven <- ncvar_get(h.seven, "Times")

h.eight <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-08_wdccat_100m.nc")
Uten.h.eight <- ncvar_get(h.eight, "U10")
Vten.h.eight <- ncvar_get(h.eight, "V10")
time.h.eight <- ncvar_get(h.eight, "Times")

h.nine <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-09_wdccat_100m.nc")
Uten.h.nine <- ncvar_get(h.nine, "U10")
Vten.h.nine <- ncvar_get(h.nine, "V10")
time.h.nine <- ncvar_get(h.nine, "Times")

h.ten <- nc_open("sp.avhr.uv.wrfout_d03_2010-07-10_wdccat_100m.nc")
Uten.h.ten <- ncvar_get(h.ten, "U10")
Vten.h.ten <- ncvar_get(h.ten, "V10")
time.h.ten <- ncvar_get(h.ten, "Times")

# This next section concatenates the daily values into vector for each variable
Uten.t <- c(Uten.t.one, Uten.t.two, Uten.t.three, Uten.t.four, Uten.t.five, Uten.t.six, Uten.t.seven, Uten.t.eight, Uten.t.nine, Uten.t.ten)
Uten.h <- c(Uten.h.one, Uten.h.two, Uten.h.three, Uten.h.four, Uten.h.five, Uten.h.six, Uten.h.seven, Uten.h.eight, Uten.h.nine, Uten.h.ten)

Vten.t <- c(Vten.t.one, Vten.t.two, Vten.t.three, Vten.t.four, Vten.t.five, Vten.t.six, Vten.t.seven, Vten.t.eight, Vten.t.nine, Vten.t.ten)
Vten.h <- c(Vten.h.one, Vten.h.two, Vten.h.three, Vten.h.four, Vten.h.five, Vten.h.six, Vten.h.seven, Vten.h.eight, Vten.h.nine, Vten.h.ten)

# This section writes the variables to CSV files which are used in the wd.py script
# The CSVs produced by the Python script are read back into this section, and the data are put into wind roses along with DCA data

UV.t <- data.frame(Uten.t, Vten.t)
UV.h <- data.frame(Uten.h, Vten.h)

write.csv(UV.t, "C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spuvhrly10m/uvten.csv")
write.csv(UV.h, "C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/spuvhrly100m/uvhundred.csv")

ws.t <- sqrt((Uten.t*Uten.t)+(Vten.t*Vten.t))
ws.h <- sqrt((Uten.h*Uten.h)+(Vten.h*Vten.h))

df.t <- read.csv("C:/Users/levis/tenwd.csv")
wd.t <- df.t$Wd.t
df.h <- read.csv("C:/Users/levis/hundredwd.csv")
wd.h <- df.h$Wd.h

dates.t <- c(time.one, time.two, time.three, time.four, time.five, time.six, time.seven, time.eight, time.nine, time.ten)
dates.t <- as.POSIXct(dates.t, format ="%Y%m%dT%H%M", tz = "America/New_York")

dates.h <- c(time.h.one, time.h.two, time.h.three, time.h.four, time.h.five, time.h.six, time.h.seven, time.h.eight, time.h.nine, time.h.ten)
dates.h <- as.POSIXct(dates.h, format ="%Y%m%dT%H%M", tz = "America/New_York")
dates.h <- head(dates.h)

wind.t <- data.frame(dates.t,ws.t,wd.t)
wind.t <- rename(wind.t, date=dates.t, ws=ws.t,wd=wd.t)

wind.h <- data.frame(dates.h,ws.h,wd.h)
wind.h <- rename(wind.h, date=dates.h, ws=ws.h, wd=wd.h)

w.t <- pollutionRose(wind.t, pollutant = "ws", main="10 Meter", breaks = seq(0,8, by = 1))
w.h <- pollutionRose(wind.h, pollutant = "ws", main="100 Meter", breaks = seq(0,8, by = 1))

N <- 0;NNE <- 22.5; NE <- 45; ENE <- 45 + 22.5; E <- 90; ESE <- 90 + 22.5; SE <- 90+45; SSE <- 90+45+22.5; S <- 180; SSW <- 180 + 22.5; SW <- 180 + 45; WSW <- 180 + 45 + 22.5;W <- 270;WNW <- 270 + 22.5; NW <- 270 +45; NNW <- 270 + 45 + 22.5

wd.DCA.one <- c(NNW, NNW, NNW, N, N, N, NW, NNW, NNW, N, N, NW, NW, N, W, NW, NW, WNW, W, NW, NW, NNE, NNE, N)
wd.DCA.two <- c(NNW, NNW, N, NNW, NNW, NE, NNE, N, NNW, NE, NNE, NNE, N, NA, N, NNE, NA, NA, N, N, ESE, SE, SSE, SSE)
wd.DCA.three <- c(S, SW, SW, NA, SSW, SSW, SSW, S, SW, WSW, NA, S, SE, S, SSE, S, S, S, S, S, S, S, SSE, S)
wd.DCA.four <- c(S, SSW, SSW, S, SSW, SW, SW, SW, SSW, SSW, SSE, SSE, SSE, S, S, SSE, S, SSE, SSE, S, S, SSW, S, S)
wd.DCA.five <- c(S, SSW, SSW, SSW, SSW, SW, NA, NA, NA, NA, NNW, N, NA, NNW, NNW, N, NE, N, WSW, N, NNE, S, S, S)
wd.DCA.six <- c(S, NA, S, NA, NA, NA, NA, NA, S, NA, N, N, N, NA, NNE, NNE, N, N, NA, NNW, NW, ESE, S, SSW)
wd.DCA.seven <- c(S, NA, WSW, SSW, N, N, N, NW, N, NNW, NA, NNW, NNW, N, NNE, NA, NA, E, ENE, E, ENE, NA, ENE, NA)
wd.DCA.eight <- c(NE, SSE, NA, ESE, NE, ENE, ENE, E, E, ENE, NA, ESE, ESE, E, E, ESE, ESE, ESE, ESE, SE, ESE, ESE, ESE, ESE)
wd.DCA.nine <- c(SE, SE, SSE, SE, E, NA, NE, E, E, ESE, NE, NA, NNE, NE, NA, SE, SSE, SSE, SSE, SE, SSE, SSE, SSE, S)
wd.DCA.ten <- c(NW, NA, S, SSE, S, SSW, NA, NW, NNW, N, NW, N, N, NNW, NNW, N, N, N, NNE, NNE, NE, NE, NE, NNE)

wd.DCA.total <- c(wd.DCA.one, wd.DCA.two, wd.DCA.three, wd.DCA.four, wd.DCA.five, wd.DCA.six, wd.DCA.seven, wd.DCA.eight, wd.DCA.nine, wd.DCA.ten)

ws.DCA.one.mph <- c(6, 6, 8, 15, 13, 14, 13, 12, 13, 16, 17, 9, 7, 9, 13, 12, 13, 12, 10, 13, 9, 14, 10, 10)
ws.DCA.two.mph <- c(8, 8, 7, 7, 6, 7, 7, 6, 7, 15, 12, 9, 8, 0, 14, 7, 0, 0, 6, 3, 7, 8, 5, 5)
ws.DCA.three.mph <- c(5, 5, 5, 0, 5, 5, 3, 6, 7, 5, 5, 7, 6, 9, 7, 9, 8, 7, 9, 9, 10, 7, 6, 9)
ws.DCA.four.mph <- c(8, 6, 5, 3, 8, 5, 3, 3, 6, 5, 5, 7, 6, 7, 10, 8, 12, 9, 12, 12, 8, 6, 7, 5)
ws.DCA.five.mph <- c(6, 5, 6, 3, 3, 5, 0, 0, 0, 0, 8, 8, 5, 6, 10, 10, 6, 9, 6, 7, 3, 5, 3, 6)
ws.DCA.six.mph <- c(5, 0, 3, 0, 0, 0, 0, 0, 3, 0, 8, 7, 9, 7, 7, 9, 9, 7, 0, 10, 7, 5, 3, 6)
ws.DCA.seven.mph <- c(5, 0, 3, 6, 5, 7, 6, 5, 6, 7, 5, 6, 12, 10, 6, 0, 3, 7, 12, 6, 8, 0, 3, 0)
ws.DCA.eight.mph <- c(3, 3, 0, 5, 5, 7, 7, 3, 6, 3, 0, 9, 5, 7, 5, 5, 12, 14, 13, 14, 9, 7, 6, 12)
ws.DCA.nine.mph <- c(10, 10, 5, 5, 3, 0, 5, 7, 7, 7, 6, 3, 3, 5, 5, 3, 8, 12, 10, 9, 8, 10, 7, 8)
ws.DCA.ten.mph <- c(3, 0, 8, 6, 8, 3, 0, 6, 12, 7, 8, 9, 15, 17, 16, 15, 16, 13, 13, 16, 14, 10, 7, 8)

ws.DCA.total.mph <- c(ws.DCA.one.mph, ws.DCA.two.mph, ws.DCA.three.mph, ws.DCA.four.mph, ws.DCA.five.mph, ws.DCA.six.mph, ws.DCA.seven.mph, ws.DCA.eight.mph, ws.DCA.nine.mph, ws.DCA.ten.mph)
ws.DCA.total.ms <- convert_wind_speed(ws.DCA.total.mph, "mph", "mps")

DCA.dates <- c(dates.t)
DCA.dates <- as.POSIXct(DCA.dates, format ="%Y%m%dT%H%M", tz = "America/New_York")

wind.DCA <- data.frame(DCA.dates, ws.DCA.total.ms, wd.DCA.total)
wind.DCA <- rename(wind.DCA, date=DCA.dates, ws=ws.DCA.total.ms,wd=wd.DCA.total)
w.DCA <- pollutionRose(wind.DCA, pollutant = "ws", breaks = seq(0,8, by = 1))

windows()
print(w.t, split=c(1,1,2,2))
print(w.h, split=c(2,1,2,2), newpage=FALSE)
print(w.DCA, split=c(1,2,2,2), newpage=FALSE)
