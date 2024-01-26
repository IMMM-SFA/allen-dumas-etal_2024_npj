library(openair)

setwd("C:/Users/levis/Desktop/WDC_Nature/")

dca.winddata.t <- nc_open("NetCDF/dca_avhr_uv/dca.avhr.uv_d03_2020-07-01-10_wdccat_10m.nc")
dca.time <- ncvar_get(dca.winddata.t, "Times")
dates <- as.POSIXct(dca.time, format ="%Y%m%dT%H%M", tz = "America/New_York")


setwd("D:/Out/")

wind.10m <- read.csv("10MeterOut/dca_wind_hrly_10m.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.100m <- read.csv("100MeterOut/dca_wind_hrly_100m.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.nu <- read.csv("NUDAPTOut/dca_wind_hrly_nudapt.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.no <- read.csv("NoBldgOut/dca_wind_hrly_nobldg.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))

ws.t <- wind.10m$ws
wd.t <- wind.10m$wd

ws.h <- wind.100m$ws
wd.h <- wind.100m$wd

ws.nudapt <- wind.nu$ws
wd.nudapt <- wind.nu$wd

ws.nobldg <- wind.no$ws
wd.nobldg <- wind.no$wd

wind.t <- data.frame(dates,ws.t,wd.t)
wind.t <- rename(wind.t, date=dates, ws=ws.t,wd=wd.t)

wind.h <- data.frame(dates,ws.h,wd.h)
wind.h <- rename(wind.h, date=dates, ws=ws.h, wd=wd.h)

wind.nudapt <- data.frame(dates,ws.nudapt,wd.nudapt)
wind.nudapt <- rename(wind.nudapt, date=dates, ws=ws.nudapt,wd=wd.nudapt)

wind.nobldg <- data.frame(dates,ws.nobldg,wd.nobldg)
wind.nobldg <- rename(wind.nobldg, date=dates, ws=ws.nobldg, wd=wd.nobldg)


w.t <- pollutionRose(wind.t, pollutant = "ws", key.footer = "wind speed (m/s)", breaks = seq(0,10, by = 1))
w.h <- pollutionRose(wind.h, pollutant = "ws", key.footer = "wind speed (m/s)", breaks = seq(0,10, by = 1))
w.nudapt <- pollutionRose(wind.nudapt, pollutant = "ws", key.footer = "wind speed (m/s)", breaks = seq(0,10, by = 1))
w.nobldg <- pollutionRose(wind.nobldg, pollutant = "ws", key.footer = "wind speed (m/s)", breaks = seq(0,10, by = 1))

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

DCA.dates <- c(dates)
DCA.dates <- as.POSIXct(dates, format ="%Y%m%dT%H%M", tz = "America/New_York")

wind.DCA <- data.frame(DCA.dates, ws.DCA.total.ms, wd.DCA.total)
wind.DCA <- rename(wind.DCA, date=DCA.dates, ws=ws.DCA.total.ms,wd=wd.DCA.total)
w.DCA <- pollutionRose(wind.DCA, pollutant = "ws", key.footer = "wind speed (m/s)",breaks = seq(0,10, by = 1))
