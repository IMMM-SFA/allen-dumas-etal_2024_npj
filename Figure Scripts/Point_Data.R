library(ncdf4)
library(humidity)
library(ggplot2)
library(weathermetrics)
library(ggpubr)
library(dplyr)
library(openair)

days <- c(1:10)

# DCA 
setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcapt")

## Average
dca.av.t <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcav_10m.nc")
dca.av.h <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcav_100m.nc")

dca.tav.t <- ncvar_get(dca.av.t, "T2")
dca.qav.t <- ncvar_get(dca.av.t, "Q2")
dca.pressureav.t <- ncvar_get(dca.av.t, "PSFC")
dca.humidav.t <- SH2RH(dca.qav.t, dca.tav.t, dca.pressureav.t, isK=TRUE)

dca.tav.h <- ncvar_get(dca.av.h, "T2")
dca.qav.h <- ncvar_get(dca.av.h, "Q2")
dca.pressureav.h <- ncvar_get(dca.av.h, "PSFC")
dca.humidav.h <- SH2RH(dca.qav.h, dca.tav.h, dca.pressureav.h, isK=TRUE)

## Maximum
dca.mx.t <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcmx_10m.nc")
dca.mx.h <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcmx_100m.nc")

dca.tmax.t <- ncvar_get(dca.mx.t, "T2")
dca.qmax.t <- ncvar_get(dca.mx.t, "Q2")
dca.pressuremax.t <- ncvar_get(dca.mx.t, "PSFC")
dca.humidmax.t <- SH2RH(dca.qmax.t, dca.tmax.t, dca.pressuremax.t, isK=TRUE)

dca.tmax.h <- ncvar_get(dca.mx.h, "T2")
dca.qmax.h <- ncvar_get(dca.mx.h, "Q2")
dca.pressuremax.h <- ncvar_get(dca.mx.h, "PSFC")
dca.humidmax.h <- SH2RH(dca.qmax.h, dca.tmax.h, dca.pressuremax.h, isK=TRUE)

## Minimum
dca.mn.t <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcmn_10m.nc")
dca.mn.h <- nc_open("dca.wrfout_d03_2010-07-01-10cat_wdcmx_100m.nc")

dca.tmin.t <- ncvar_get(dca.mn.t, "T2")
dca.qmin.t <- ncvar_get(dca.mn.t, "Q2")
dca.pressuremin.t <- ncvar_get(dca.mn.t, "PSFC")
dca.humidmin.t <- SH2RH(dca.qmin.t, dca.tmin.t, dca.pressuremin.t, isK=TRUE)

dca.tmin.h <- ncvar_get(dca.mn.h, "T2")
dca.qmin.h <- ncvar_get(dca.mn.h, "Q2")
dca.pressuremin.h <- ncvar_get(dca.mn.h, "PSFC")
dca.humidmin.h <- SH2RH(dca.qmin.h, dca.tmin.h, dca.pressuremin.h, isK=TRUE)

# Arboretum
setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/arboretumpt")

## Average
arb.av.t <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcav_10m.nc")
arb.av.h <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcav_100m.nc")

arb.tav.t <- ncvar_get(arb.av.t, "T2")
arb.qav.t <- ncvar_get(arb.av.t, "Q2")
arb.pressureav.t <- ncvar_get(arb.av.t, "PSFC")
arb.humidav.t <- SH2RH(arb.qav.t, arb.tav.t, arb.pressureav.t, isK=TRUE)

arb.tav.h <- ncvar_get(arb.av.h, "T2")
arb.qav.h <- ncvar_get(arb.av.h, "Q2")
arb.pressureav.h <- ncvar_get(arb.av.h, "PSFC")
arb.humidav.h <- SH2RH(arb.qav.h, arb.tav.h, arb.pressureav.h, isK=TRUE)

## Maximum
arb.mx.t <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcmx_10m.nc")
arb.mx.h <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcmx_100m.nc")

arb.tmax.t <- ncvar_get(arb.mx.t, "T2")
arb.qmax.t <- ncvar_get(arb.mx.t, "Q2")
arb.pressuremax.t <- ncvar_get(arb.mx.t, "PSFC")
arb.humidmax.t <- SH2RH(arb.qmax.t, arb.tmax.t, arb.pressuremax.t, isK=TRUE)

arb.tmax.h <- ncvar_get(arb.mx.h, "T2")
arb.qmax.h <- ncvar_get(arb.mx.h, "Q2")
arb.pressuremax.h <- ncvar_get(arb.mx.h, "PSFC")
arb.humidmax.h <- SH2RH(arb.qmax.h, arb.tmax.h, arb.pressuremax.h, isK=TRUE)

## Minimum
arb.mn.t <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcmn_10m.nc")
arb.mn.h <- nc_open("arb.wrfout_d03_2010-07-01-10cat_wdcmx_100m.nc")

arb.tmin.t <- ncvar_get(arb.mn.t, "T2")
arb.qmin.t <- ncvar_get(arb.mn.t, "Q2")
arb.pressuremin.t <- ncvar_get(arb.mn.t, "PSFC")
arb.humidmin.t <- SH2RH(arb.qmin.t, arb.tmin.t, arb.pressuremin.t, isK=TRUE)

arb.tmin.h <- ncvar_get(arb.mn.h, "T2")
arb.qmin.h <- ncvar_get(arb.mn.h, "Q2")
arb.pressuremin.h <- ncvar_get(arb.mn.h, "PSFC")
arb.humidmin.h <- SH2RH(arb.qmin.h, arb.tmin.h, arb.pressuremin.h, isK=TRUE)

# Daymet

## Daymet DCA

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcadaymet")

daydca.tmax.total <- nc_open("dca.tmax2010-07-01_10.nc")
daydca.tmax <- ncvar_get(daydca.tmax.total, "tmax")
daydca.tmin.total <- nc_open("dca.tmin2010-07-01_10.nc")
daydca.tmin <- ncvar_get(daydca.tmin.total, "tmin")
daydca.tav <- (daydca.tmax + daydca.tmin)/2

daydca.vp.total <- nc_open("dca.vp2010-07-01_10.nc")
daydca.vp <- ncvar_get(daydca.vp.total, "vp")
daydca.svpmax <- (SVP.ClaCla(C2K(daydca.tmax))) * 100
daydca.humiditymax <- (daydca.vp / daydca.svpmax) * 100

daydca.svpmin <- (SVP.ClaCla(C2K(daydca.tmin))) * 100
daydca.humiditymin <- (daydca.vp / daydca.svpmin) * 100

daydca.svpav <- (SVP.ClaCla(C2K(daydca.tav))) * 100
daydca.humidityav <- (daydca.vp / daydca.svpav) * 100

## Daymet Arboretum

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/arboretumdaymet")

dayarb.tmax.total <- nc_open("arb.tmax2010-07-01_10.nc")
dayarb.tmax <- ncvar_get(dayarb.tmax.total, "tmax")
dayarb.tmin.total <- nc_open("arb.tmin2010-07-01_10.nc")
dayarb.tmin <- ncvar_get(dayarb.tmin.total, "tmin")
dayarb.tav <- (dayarb.tmax + dayarb.tmin)/2

dayarb.vp.total <- nc_open("arb.vp2010-07-01_10.nc")
dayarb.vp <- ncvar_get(dayarb.vp.total, "vp")
dayarb.svpmax <- (SVP.ClaCla(C2K(dayarb.tmax))) * 100
dayarb.humiditymax <- (dayarb.vp / dayarb.svpmax) * 100

dayarb.svpmin <- (SVP.ClaCla(C2K(dayarb.tmin))) * 100
dayarb.humiditymin <- (dayarb.vp / dayarb.svpmin) * 100

dayarb.svpav <- (SVP.ClaCla(C2K(dayarb.tav))) * 100
dayarb.humidityav <- (dayarb.vp / dayarb.svpav) * 100

# Plots

dca.tmax.t.F <- kelvin.to.fahrenheit(dca.tmax.t)
dca.tmax.h.F <- kelvin.to.fahrenheit(dca.tmax.h)

dca.tmin.t.F <- kelvin.to.fahrenheit(dca.tmin.t)
dca.tmin.h.F <- kelvin.to.fahrenheit(dca.tmin.h)

dca.tav.t.F <- kelvin.to.fahrenheit(dca.tav.t)
dca.tav.h.F <- kelvin.to.fahrenheit(dca.tav.h)

arb.tmax.t.F <- kelvin.to.fahrenheit(arb.tmax.t)
arb.tmax.h.F <- kelvin.to.fahrenheit(arb.tmax.h)

arb.tmin.t.F <- kelvin.to.fahrenheit(arb.tmin.t)
arb.tmin.h.F <- kelvin.to.fahrenheit(arb.tmin.h)

arb.tav.t.F <- kelvin.to.fahrenheit(arb.tav.t)
arb.tav.h.F <- kelvin.to.fahrenheit(arb.tav.h)

daydca.tmax.F <- celsius.to.fahrenheit(daydca.tmax)
daydca.tmin.F <- celsius.to.fahrenheit(daydca.tmin)
daydca.tav.F <- celsius.to.fahrenheit(daydca.tav)

dayarb.tmax.F <- celsius.to.fahrenheit(dayarb.tmax)
dayarb.tmin.F <- celsius.to.fahrenheit(dayarb.tmin)
dayarb.tav.F <- celsius.to.fahrenheit(dayarb.tav)

tmax.df.dca <- data.frame(days, dca.tmax.t.F, dca.tmax.h.F, daydca.tmax.F)
tmax.df.arb <- data.frame(days, arb.tmax.t.F, arb.tmax.h.F, dayarb.tmax.F)

tmin.df.dca <- data.frame(days, dca.tmin.t.F, dca.tmin.h.F, daydca.tmin.F)
tmin.df.arb <- data.frame(days, arb.tmin.t.F, arb.tmin.h.F, dayarb.tmin.F)

tav.df.dca <- data.frame(days, dca.tav.t.F, dca.tav.h.F, daydca.tav.F)
tav.df.arb <- data.frame(days, arb.tav.t.F, arb.tav.h.F, dayarb.tav.F)

hmax.df.dca <- data.frame(days, dca.humidmax.t, dca.humidmax.h, daydca.humiditymax)
hmax.df.arb <- data.frame(days, arb.humidmax.t, arb.humidmax.h, dayarb.humiditymax)

hmin.df.dca <- data.frame(days, dca.humidmin.t, dca.humidmin.h, daydca.humiditymin)
hmin.df.arb <- data.frame(days, arb.humidmin.t, arb.humidmin.h, dayarb.humiditymin)

hav.df.dca <- data.frame(days, dca.humidav.t, dca.humidav.h, daydca.humidityav)
hav.df.arb <- data.frame(days, arb.humidav.t, arb.humidav.h, dayarb.humidityav)
## Temp plots

Tmax.dca <- ggplot(tmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tmax.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tmax.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tmax.F), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Maximum Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw()

Tmax.arb <- ggplot(tmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tmax.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tmax.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tmax.F), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Maximum Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw()

Tmin.dca <- ggplot(tmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tmin.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tmin.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tmin.F), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Minimum Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(53,90, by=5)) + 
  theme_bw()

Tmin.arb <- ggplot(tmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tmin.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tmin.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tmin.F), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Minimum Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(56,102, by=5)) + 
  theme_bw()

Tav.dca <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tav.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tav.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tav.F), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Average Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,90, by=5)) + 
  theme_bw()

Tav.arb <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tav.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tav.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tav.F), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Average Temperatures", x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,102, by=5)) + 
  theme_bw()

## Humidity Plots

Hmax.dca <- ggplot(hmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.humidmax.t), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.humidmax.h), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humiditymax), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Maximum Humidity", x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(30,90, by=10)) + 
  theme_bw()

Hmax.arb <- ggplot(hmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.humidmax.t), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.humidmax.h), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humiditymax), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Maximum Humidity", x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(30,90, by=10)) + 
  theme_bw()

Hmin.dca <- ggplot(hmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.humidmin.t), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.humidmin.h), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humiditymin), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Minimum Humidity", x = "Days", y= "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(40,100, by=10)) + 
  theme_bw()

Hmin.arb <- ggplot(hmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.humidmin.t), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.humidmin.h), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humiditymin), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Minimum Humidity", x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(40,100, by=10)) + 
  theme_bw()

Hav.dca <- ggplot(hav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.humidav.t), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.humidav.h), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humidityav), linetype=2, color="black", size=1.5) + 
  labs(title = "DCA Average Humidity", x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(50,90, by=5)) + 
  theme_bw()

Hav.arb <- ggplot(hav.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.humidav.t), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.humidav.h), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humidityav), linetype=2, color="black", size=1.5) + 
  labs(title = "Arboretum Average Humidity", x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(40,90, by=5)) + 
  theme_bw()

### Example graph with legend

#ggplot(tmax.df.dca, aes(x=days)) +
  #geom_line(aes(y=dca.tmax.t.F, color = "10 Meter", linetype="10 Meter")) +
  #geom_line(aes(y=dca.tmax.h.F, color = "100 Meter", linetype="100 Meter")) +
  #geom_line(aes(y=daydca.tmax.F, color = "Daymet", linetype="Daymet")) +
  #scale_color_manual(name="Resolutions", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "Daymet" = "black")) +
  #scale_linetype_manual(name="Resolutions", values=c("10 Meter" = 1, "100 Meter" = 1, "Daymet" = 2))

### Plotting graphs

# ggarrange(Tmax.dca, Tmax.arb, Hmax.dca, Hmax.arb)
# ggarrange(Tmin.dca, Tmin.arb, Hmin.dca, Hmin.arb)
# ggarrange(Tav.dca, Tav.arb, Hav.dca, Hav.arb)

# Wind

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcauvhrly")

dca.winddata.t <- nc_open("dca.avhr.uv.wrfout_d03cat_2010-07-01-10_wdccat_10m.nc")
dca.u.t <- ncvar_get(dca.winddata.t, "U10")
dca.v.t <- ncvar_get(dca.winddata.t, "V10")
dca.time <- ncvar_get(dca.winddata.t, "Times")

dca.winddata.h <- nc_open("dca.avhr.uv.wrfout_d03cat_2010-07-01-10_wdccat_100m.nc")
dca.u.h <- ncvar_get(dca.winddata.h, "U10")
dca.v.h <- ncvar_get(dca.winddata.h, "V10")

dca.uv.t <- data.frame(dca.u.t, dca.v.t)
dca.uv.h <- data.frame(dca.u.h, dca.v.h)

write.csv(dca.uv.t, "C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcauvhrly/uvten.csv")
write.csv(dca.uv.h, "C:/Users/levis/OneDrive/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcauvhrly/uvhundred.csv")

df.t <- read.csv("C:/Users/levis/tenwd.csv")
wd.t <- df.t$Wd.t
df.h <- read.csv("C:/Users/levis/hundredwd.csv")
wd.h <- df.h$Wd.h

ws.t <- sqrt((dca.u.t*dca.u.t)+(dca.v.t*dca.v.t))
ws.h <- sqrt((dca.u.h*dca.u.h)+(dca.v.h*dca.v.h))

dates <- as.POSIXct(dca.time, format ="%Y%m%dT%H%M", tz = "America/New_York")

wind.t <- data.frame(dates,ws.t,wd.t)
wind.t <- rename(wind.t, date=dates, ws=ws.t,wd=wd.t)

wind.h <- data.frame(dates,ws.h,wd.h)
wind.h <- rename(wind.h, date=dates, ws=ws.h, wd=wd.h)

w.t <- pollutionRose(wind.t, pollutant = "ws", main="10 Meter", breaks = seq(0,8, by = 1))
w.h <- pollutionRose(wind.h, pollutant = "ws", main="100 Meter", breaks = seq(0,8, by = 1))

windows()
par(mfrow = c(1,2))
print(w.t, split=c(1,1))
print(w.h, split=c(2,1), newpage=FALSE)

