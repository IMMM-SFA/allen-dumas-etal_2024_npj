library(ncdf4)
library(humidity)
library(ggplot2)
library(weathermetrics)
library(ggpubr)
library(dplyr)
library(openair)

days <- c(1:10)

setwd("C:/Users/levis/OneDrive/Desktop/WDC_Nature/")

dca.rh.ten <- read.csv("NetCDF/rh_CSVS/DCA/dca_rh_mxmnav_10m.csv")
dca.rh.hundred <- read.csv("NetCDF/rh_CSVS/DCA/dca_rh_mxmnav_100m.csv")
dca.rh.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Spatial_Hourly_Humidity/dca_rh_mxmnav_nudapt.csv")
dca.rh.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Spatial_RH_nobldg/dca_rh_mxmnav_nobldg.csv")

arb.rh.ten <- read.csv("NetCDF/rh_CSVS/Arboretum/arb_rh_mxmnav_10m.csv")
arb.rh.hundred <- read.csv("NetCDF/rh_CSVS/Arboretum/arb_rh_mxmnav_100m.csv")
arb.rh.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Spatial_Hourly_Humidity/arb_rh_mxmnav_nudapt.csv")
arb.rh.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Spatial_RH_nobldg/arb_rh_mxmnav_nobldg.csv")


# DCA 

## Average
dca.av.t <- nc_open("NetCDF/dailyavtemp/dca.t_av_2010-07-01-10_10m.nc")
dca.av.h <- nc_open("NetCDF/dailyavtemp/dca.t_av_2010-07-01-10_100m.nc")

dca.tav.t <- ncvar_get(dca.av.t, "T2")
dca.tav.h <- ncvar_get(dca.av.h, "T2")

dca.av.humid.ten <- dca.rh.ten$Avg
dca.av.humid.ten <- dca.av.humid.ten[!is.na(dca.av.humid.ten)]
dca.av.humid.hundred <- dca.rh.hundred$Avg
dca.av.humid.hundred <- dca.av.humid.hundred[!is.na(dca.av.humid.hundred)]

dca.av.humid.nudapt <- dca.rh.nudapt$Av
dca.av.humid.nudapt <- dca.av.humid.nudapt[!is.na(dca.av.humid.nudapt)]
dca.av.humid.nobldg <- dca.rh.nobldg$Av
dca.av.humid.nobldg <- dca.av.humid.nobldg[!is.na(dca.av.humid.nobldg)]

dca.tav.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_DCA/dca_T2_av_2010-07-01-10_nudapt.nc")
dca.tav.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_DCA/dca_T2_av_2010-07-01-10_nobldg.nc")

dca.tav.nudapt <- ncvar_get(dca.tav.nudapt, "T2")
dca.tav.nobldg <- ncvar_get(dca.tav.nobldg, "T2")

## Maximum
dca.mx.t <- nc_open("NetCDF/dailyavtemp/dca.t_mx_2010-07-01-10_10m.nc")
dca.mx.h <- nc_open("NetCDF/dailyavtemp/dca.t_mx_2010-07-01-10_100m.nc")

dca.tmax.t <- ncvar_get(dca.mx.t, "T2")
dca.tmax.h <- ncvar_get(dca.mx.h, "T2")

dca.max.humid.ten <- dca.rh.ten$Max
dca.max.humid.ten <- dca.max.humid.ten[!is.na(dca.max.humid.ten)]
dca.max.humid.hundred <- dca.rh.hundred$Max
dca.max.humid.hundred <- dca.max.humid.hundred[!is.na(dca.max.humid.hundred)]

dca.max.humid.nudapt <- dca.rh.nudapt$Max
dca.max.humid.nudapt <- dca.max.humid.nudapt[!is.na(dca.max.humid.nudapt)]
dca.max.humid.nobldg <- dca.rh.nobldg$Max
dca.max.humid.nobldg <- dca.max.humid.nobldg[!is.na(dca.max.humid.nobldg)]

dca.tmax.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_DCA/dca_T2_mx_2010-07-01-10_nudapt.nc")
dca.tmax.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_DCA/dca_T2_mx_2010-07-01-10_nobldg.nc")

dca.tmax.nudapt <- ncvar_get(dca.tmax.nudapt, "T2")
dca.tmax.nobldg <- ncvar_get(dca.tmax.nobldg, "T2")

## Minimum
dca.mn.t <- nc_open("NetCDF/dailyavtemp/dca.t_mn_2010-07-01-10_10m.nc")
dca.mn.h <- nc_open("NetCDF/dailyavtemp/dca.t_mn_2010-07-01-10_100m.nc")

dca.tmin.t <- ncvar_get(dca.mn.t, "T2")
dca.tmin.h <- ncvar_get(dca.mn.h, "T2")

dca.min.humid.ten <- dca.rh.ten$Min
dca.min.humid.ten <- dca.min.humid.ten[!is.na(dca.min.humid.ten)]
dca.min.humid.hundred <- dca.rh.hundred$Min
dca.min.humid.hundred <- dca.min.humid.hundred[!is.na(dca.min.humid.hundred)]

dca.min.humid.nudapt <- dca.rh.nudapt$Min
dca.min.humid.nudapt <- dca.min.humid.nudapt[!is.na(dca.min.humid.nudapt)]
dca.min.humid.nobldg <- dca.rh.nobldg$Min
dca.min.humid.nobldg <- dca.min.humid.nobldg[!is.na(dca.min.humid.nobldg)]

dca.tmin.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_DCA/dca_T2_mn_2010-07-01-10_nudapt.nc")
dca.tmin.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_DCA/dca_T2_mn_2010-07-01-10_nobldg.nc")

dca.tmin.nudapt <- ncvar_get(dca.tmin.nudapt, "T2")
dca.tmin.nobldg <- ncvar_get(dca.tmin.nobldg, "T2")

# Arboretum

## Average
arb.av.t <- nc_open("NetCDF/dailyavtemp/arb.t_av_2010-07-01-10_10m.nc")
arb.av.h <- nc_open("NetCDF/dailyavtemp/arb.t_av_2010-07-01-10_100m.nc")

arb.tav.t <- ncvar_get(arb.av.t, "T2")
arb.tav.h <- ncvar_get(arb.av.h, "T2")

arb.av.humid.ten <- arb.rh.ten$Avg
arb.av.humid.ten <- arb.av.humid.ten[!is.na(arb.av.humid.ten)]
arb.av.humid.hundred <- arb.rh.hundred$Avg
arb.av.humid.hundred <- arb.av.humid.hundred[!is.na(arb.av.humid.hundred)]

arb.av.humid.nudapt <- arb.rh.nudapt$Av
arb.av.humid.nudapt <- arb.av.humid.nudapt[!is.na(arb.av.humid.nudapt)]
arb.av.humid.nobldg <- arb.rh.nobldg$Av
arb.av.humid.nobldg <- arb.av.humid.nobldg[!is.na(arb.av.humid.nobldg)]

arb.tav.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_Arb/arb_T2_av_2010-07-01-10_nudapt.nc")
arb.tav.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_Arb/arb_T2_av_2010-07-01-10_nobldg.nc")

arb.tav.nudapt <- ncvar_get(arb.tav.nudapt, "T2")
arb.tav.nobldg <- ncvar_get(arb.tav.nobldg, "T2")

## Maximum
arb.mx.t <- nc_open("NetCDF/dailyavtemp/arb.t_mx_2010-07-01-10_10m.nc")
arb.mx.h <- nc_open("NetCDF/dailyavtemp/arb.t_mx_2010-07-01-10_100m.nc")

arb.tmax.t <- ncvar_get(arb.mx.t, "T2")
arb.tmax.h <- ncvar_get(arb.mx.h, "T2")

arb.max.humid.ten <- arb.rh.ten$Max
arb.max.humid.ten <- arb.max.humid.ten[!is.na(arb.max.humid.ten)]
arb.max.humid.hundred <- arb.rh.hundred$Max
arb.max.humid.hundred <- arb.max.humid.hundred[!is.na(arb.max.humid.hundred)]

arb.max.humid.nudapt <- arb.rh.nudapt$Max
arb.max.humid.nudapt <- arb.max.humid.nudapt[!is.na(arb.max.humid.nudapt)]
arb.max.humid.nobldg <- arb.rh.nobldg$Max
arb.max.humid.nobldg <- arb.max.humid.nobldg[!is.na(arb.max.humid.nobldg)]

arb.tmax.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_Arb/arb_T2_mx_2010-07-01-10_nudapt.nc")
arb.tmax.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_Arb/arb_T2_mx_2010-07-01-10_nobldg.nc")

arb.tmax.nudapt <- ncvar_get(arb.tmax.nudapt, "T2")
arb.tmax.nobldg <- ncvar_get(arb.tmax.nobldg, "T2")

## Minimum
arb.mn.t <- nc_open("NetCDF/dailyavtemp/arb.t_mn_2010-07-01-10_10m.nc")
arb.mn.h <- nc_open("NetCDF/dailyavtemp/arb.t_mn_2010-07-01-10_100m.nc")

arb.tmin.t <- ncvar_get(arb.mn.t, "T2")
arb.tmin.h <- ncvar_get(arb.mn.h, "T2")

arb.min.humid.ten <- arb.rh.ten$Min
arb.min.humid.ten <- arb.min.humid.ten[!is.na(arb.min.humid.ten)]
arb.min.humid.hundred <- arb.rh.hundred$Min
arb.min.humid.hundred <- arb.min.humid.hundred[!is.na(arb.min.humid.hundred)]

arb.min.humid.nudapt <- arb.rh.nudapt$Min
arb.min.humid.nudapt <- arb.min.humid.nudapt[!is.na(arb.min.humid.nudapt)]
arb.min.humid.nobldg <- arb.rh.nobldg$Min
arb.min.humid.nobldg <- arb.min.humid.nobldg[!is.na(arb.min.humid.nobldg)]

arb.tmin.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Spatial_T2_nudapt/Spatial_T2_Arb/arb_T2_mn_2010-07-01-10_nudapt.nc")
arb.tmin.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Spatial_T2_nobldg/Spatial_T2_Arb/arb_T2_mn_2010-07-01-10_nobldg.nc")

arb.tmin.nudapt <- ncvar_get(arb.tmin.nudapt, "T2")
arb.tmin.nobldg <- ncvar_get(arb.tmin.nobldg, "T2")

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

slope <- 1.557125
intercept <- -30.76975

dca.tmax.t.F <- kelvin.to.fahrenheit(dca.tmax.t)
#dca.tmax.t.F <- dca.tmax.t.F * slope + intercept
dca.tmax.h.F <- kelvin.to.fahrenheit(dca.tmax.h)
#dca.tmax.h.F <- dca.tmax.h.F * slope + intercept
dca.tmax.nudapt.F <- kelvin.to.fahrenheit(dca.tmax.nudapt)
#dca.tmax.nudapt.F <- dca.tmax.nudapt.F * slope + intercept
dca.tmax.nobldg.F <- kelvin.to.fahrenheit(dca.tmax.nobldg)
#dca.tmax.nobldg.F <- dca.tmax.nobldg.F * slope + intercept

dca.tmin.t.F <- kelvin.to.fahrenheit(dca.tmin.t)
#dca.tmin.t.F <- dca.tmin.t.F * slope + intercept
dca.tmin.h.F <- kelvin.to.fahrenheit(dca.tmin.h)
#dca.tmin.h.F <- dca.tmin.h.F * slope + intercept
dca.tmin.nudapt.F <- kelvin.to.fahrenheit(dca.tmin.nudapt)
#dca.tmin.nudapt.F <- dca.tmin.nudapt.F * slope + intercept
dca.tmin.nobldg.F <- kelvin.to.fahrenheit(dca.tmin.nobldg)
#dca.tmin.nobldg.F <- dca.tmin.nobldg.F * slope + intercept

dca.tav.t.F <- kelvin.to.fahrenheit(dca.tav.t)
#dca.tav.t.F <- dca.tav.t.F * slope + intercept
dca.tav.h.F <- kelvin.to.fahrenheit(dca.tav.h)
#dca.tav.h.F <- dca.tav.h.F * slope + intercept
dca.tav.nudapt.F <- kelvin.to.fahrenheit(dca.tav.nudapt)
#dca.tav.nudapt.F <- dca.tav.nudapt.F * slope + intercept
dca.tav.nobldg.F <- kelvin.to.fahrenheit(dca.tav.nobldg)
#dca.tav.nobldg.F <- dca.tav.nobldg.F * slope + intercept

arb.tmax.t.F <- kelvin.to.fahrenheit(arb.tmax.t)
#arb.tmax.t.F <- arb.tmax.t.F * slope + intercept
arb.tmax.h.F <- kelvin.to.fahrenheit(arb.tmax.h)
#arb.tmax.h.F <- arb.tmax.h.F * slope + intercept
arb.tmax.nudapt.F <- kelvin.to.fahrenheit(arb.tmax.nudapt)
#arb.tmax.nudapt.F <- arb.tmax.nudapt.F * slope + intercept
arb.tmax.nobldg.F <- kelvin.to.fahrenheit(arb.tmax.nobldg)
#arb.tmax.nobldg.F <- arb.tmax.nobldg.F * slope + intercept

arb.tmin.t.F <- kelvin.to.fahrenheit(arb.tmin.t)
#arb.tmin.t.F <- arb.tmin.t.F * slope + intercept
arb.tmin.h.F <- kelvin.to.fahrenheit(arb.tmin.h)
#arb.tmin.h.F <- arb.tmin.h.F * slope + intercept
arb.tmin.nudapt.F <- kelvin.to.fahrenheit(arb.tmin.nudapt)
#arb.tmin.nudapt.F <- arb.tmin.nudapt.F * slope + intercept
arb.tmin.nobldg.F <- kelvin.to.fahrenheit(arb.tmin.nobldg)
#arb.tmin.nobldg.F <- arb.tmin.nobldg.F * slope + intercept

arb.tav.t.F <- kelvin.to.fahrenheit(arb.tav.t)
#arb.tav.t.F <- arb.tav.t.F * slope + intercept
arb.tav.h.F <- kelvin.to.fahrenheit(arb.tav.h)
#arb.tav.h.F <- arb.tav.h.F * slope + intercept
arb.tav.nudapt.F <- kelvin.to.fahrenheit(arb.tav.nudapt)
#arb.tav.nudapt.F <- arb.tav.nudapt.F * slope + intercept
arb.tav.nobldg.F <- kelvin.to.fahrenheit(arb.tav.nobldg)
#arb.tav.nobldg.F <- arb.tav.nobldg.F * slope + intercept

daydca.tmax.F <- celsius.to.fahrenheit(daydca.tmax)
daydca.tmin.F <- celsius.to.fahrenheit(daydca.tmin)
daydca.tav.F <- celsius.to.fahrenheit(daydca.tav)

dayarb.tmax.F <- celsius.to.fahrenheit(dayarb.tmax)
dayarb.tmin.F <- celsius.to.fahrenheit(dayarb.tmin)
dayarb.tav.F <- celsius.to.fahrenheit(dayarb.tav)

dca.tmax.hist <- c(80, 82, 86, 94, 98, 102, 101, 93, 93, 81)
dca.humidmax.hist <- c(55, 54, 65, 73, 73, 74, 65, 74, 79, 94)

dca.tmin.hist <- c(65, 64, 64, 68, 73, 79, 81, 81, 76, 73)
dca.humidmin.hist <- c(24, 23, 25, 27, 29, 20, 28, 44, 38, 58)

dca.tav.hist <- c(73.3, 73.3, 73.3, 81.0, 86.5, 90.7, 91.7, 86.7, 82.4, 75.5)
dca.humidav.hist <- c(35.5, 38.4, 43.1, 49.3, 48.9, 46.7, 45.1, 56.8, 63.4, 82.1)


lm(dca.tav.hist ~ dca.tav.nudapt.F)
lm(dca.tav.hist ~ dca.tav.nobldg.F)
lm(narbor.av ~ arb.tav.nudapt.F)
lm(narbor.av ~ arb.tav.nobldg.F)

tmax.df.dca <- data.frame(days, dca.tmax.t.F, dca.tmax.h.F, daydca.tmax.F, dca.tmax.hist, dca.tmax.nudapt.F, dca.tmax.nobldg.F)
tmax.df.arb <- data.frame(days, arb.tmax.t.F, arb.tmax.h.F, dayarb.tmax.F, narbor.max, arb.tmax.nudapt.F, arb.tmax.nobldg.F)

tmin.df.dca <- data.frame(days, dca.tmin.t.F, dca.tmin.h.F, daydca.tmin.F, dca.tmin.hist, dca.tmin.nudapt.F, dca.tmin.nobldg.F)
tmin.df.arb <- data.frame(days, arb.tmin.t.F, arb.tmin.h.F, dayarb.tmin.F, narbor.min, arb.tmin.nudapt.F, arb.tmin.nobldg.F)

tav.df.dca <- data.frame(days, dca.tav.t.F, dca.tav.h.F, daydca.tav.F, dca.tav.hist, dca.tav.nudapt.F, dca.tav.nobldg.F)
tav.df.arb <- data.frame(days, arb.tav.t.F, arb.tav.h.F, dayarb.tav.F, narbor.av, arb.tav.nudapt.F, arb.tav.nobldg.F)

hmax.df.dca <- data.frame(days, dca.max.humid.ten, dca.max.humid.hundred, daydca.humiditymax, dca.humidmax.hist, dca.max.humid.nudapt, dca.max.humid.nobldg)
hmax.df.arb <- data.frame(days, arb.max.humid.ten, arb.max.humid.hundred, dayarb.humiditymax, arb.max.humid.nudapt, arb.max.humid.nobldg)

hmin.df.dca <- data.frame(days, dca.min.humid.ten, dca.min.humid.hundred, daydca.humiditymin, dca.humidmin.hist, dca.min.humid.nudapt, dca.min.humid.nobldg)
hmin.df.arb <- data.frame(days, arb.min.humid.ten, arb.min.humid.hundred, dayarb.humiditymin, arb.min.humid.nudapt, arb.min.humid.nobldg)

hav.df.dca <- data.frame(days, dca.av.humid.ten, dca.av.humid.hundred, daydca.humidityav, dca.humidav.hist, dca.av.humid.nudapt, dca.av.humid.nobldg)
hav.df.arb <- data.frame(days, arb.av.humid.ten, arb.av.humid.hundred, dayarb.humidityav, arb.av.humid.nudapt, arb.av.humid.nobldg)
## Temp plots

Tmax.dca <- ggplot(tmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tmax.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tmax.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tmax.F), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=dca.tmax.hist), linetype=2, color="black", size=1) + 
  geom_line(aes(y=dca.tmax.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.tmax.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))
  

Tmax.arb <- ggplot(tmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tmax.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tmax.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tmax.F), linetype=4, color="purple", size=1) +
  geom_line(aes(y=narbor.max), linetype=3, color="darkgreen", size=1) +
  geom_line(aes(y=arb.tmax.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.tmax.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Tmin.dca <- ggplot(tmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tmin.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tmin.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tmin.F), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=dca.tmin.hist), linetype=2, color="black", size=1) + 
  geom_line(aes(y=dca.tmin.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.tmin.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(53,90, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Tmin.arb <- ggplot(tmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tmin.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tmin.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tmin.F), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=narbor.min), linetype=3, color="darkgreen", size=1) +
  geom_line(aes(y=arb.tmin.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.tmin.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(56,102, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Tav.dca <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.tav.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.tav.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.tav.F), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=dca.tav.hist), linetype=2, color="black", size=1) + 
  geom_line(aes(y=dca.tav.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.tav.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,90, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Tav.arb <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.tav.t.F), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.tav.h.F), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.tav.F), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=narbor.av), linetype=3, color="darkgreen", size=1) +
  geom_line(aes(y=arb.tav.nudapt.F), linetype=1, color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.tav.nobldg.F), linetype=1, color="gray", size=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,89, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

## Humidity Plots

Hmax.dca <- ggplot(hmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.max.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.max.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humiditymax), linetype=4, color="purple", size=1) +
  geom_line(aes(y=dca.humidmax.hist), linetype=2, color="black", size=1) + 
  geom_line(aes(y=dca.max.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.max.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(30,90, by=10)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Hmax.arb <- ggplot(hmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.max.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.max.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humiditymax), linetype=4, color="purple", size=1) + 
  geom_line(aes(y=arb.max.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.max.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(30,90, by=10)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Hmin.dca <- ggplot(hmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.min.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.min.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humiditymin), linetype=4, color="purple", size=1) +
  geom_line(aes(y=dca.humidmin.hist), linetype=2, color="black", size=1) +
  geom_line(aes(y=dca.min.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.min.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y= "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(20,100, by=10)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Hmin.arb <- ggplot(hmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.min.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.min.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humiditymin), linetype=4, color="purple", size=1) +
  geom_line(aes(y=arb.min.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.min.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(40,100, by=10)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Hav.dca <- ggplot(hav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.av.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=dca.av.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=daydca.humidityav), linetype=4, color="purple", size=1) +
  geom_line(aes(y=dca.humidav.hist), linetype=2, color="black", size=1) + 
  geom_line(aes(y=dca.av.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=dca.av.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(35,90, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

Hav.arb <- ggplot(hav.df.dca, aes(x=days)) + 
  geom_line(aes(y=arb.av.humid.ten), color="darkred", size=1.5) + 
  geom_line(aes(y=arb.av.humid.hundred), color="blue", size=1.5) + 
  geom_line(aes(y=dayarb.humidityav), linetype=4, color="purple", size=1) +
  geom_line(aes(y=arb.av.humid.nudapt), color="darkgreen", size=1.5) +
  geom_line(aes(y=arb.av.humid.nobldg), color="gray", size=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(40,90, by=5)) + 
  theme_bw() +
  theme(plot.caption=element_text(hjust=0, size=14, face="bold"))

### Example graph with legend

legend.plot <- data.frame(dca.tmax.t.F, dca.tmax.h.F, dca.tmax.nudapt.F, dca.tmax.nobldg.F, dca.tmax.hist, narbor.max, daydca.tmax.F)
ggplot(legend.plot, aes(x=days)) +
  geom_line(aes(y=dca.tmax.t.F, color = "10 Meter", linetype="10 Meter"), size=1.5) +
  geom_line(aes(y=dca.tmax.h.F, color = "100 Meter", linetype="100 Meter"), size=1.5) +
  geom_line(aes(y=dca.tmax.nudapt.F, color = "NUDAPT", linetype="NUDAPT"), size=1.5) +
  geom_line(aes(y=dca.tmax.nobldg.F, color = "No Buildings", linetype="No Buildings"), size=1.5) +
  geom_line(aes(y=dca.tmax.hist, color = "DCA", linetype="DCA"), size=1) +
  geom_line(aes(y=narbor.max, color="Arboretum", linetype="Arboretum"), size=1) +
  geom_line(aes(y=daydca.tmax.F, color = "Daymet", linetype="Daymet"), size=1) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "DCA" = "black", "Arboretum" = "darkgreen", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "DCA" = 2, "Arboretum" = 3, "Daymet" = 4))

### Plotting graphs

# ggarrange(Tmax.dca, Tmax.arb, Hmax.dca, Hmax.arb)
# ggarrange(Tmin.dca, Tmin.arb, Hmin.dca, Hmin.arb)
# ggarrange(Tav.dca, Tav.arb, Hav.dca, Hav.arb)

# Wind

setwd("C:/Users/levis/OneDrive/Desktop/WDC_Nature/")

dca.winddata.t <- nc_open("NetCDF/dca_avhr_uv/dca.avhr.uv_d03_2020-07-01-10_wdccat_10m.nc")
dca.u.t <- ncvar_get(dca.winddata.t, "U10")
dca.v.t <- ncvar_get(dca.winddata.t, "V10")
dca.time <- ncvar_get(dca.winddata.t, "Times")

dca.winddata.h <- nc_open("NetCDF/dca_avhr_uv/dca.avhr.uv_d03_2020-07-01-10_wdccat_100m.nc")
dca.u.h <- ncvar_get(dca.winddata.h, "U10")
dca.v.h <- ncvar_get(dca.winddata.h, "V10")

dca.winddata.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/Time_Wind_DCA/dca_hrly_uv_2010-07-01-10_nudapt.nc")
dca.u.nudapt <- ncvar_get(dca.winddata.nudapt, "U10")
dca.v.nudapt <- ncvar_get(dca.winddata.nudapt, "V10")

dca.winddata.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/Time_Wind_DCA/dca_hrly_uv_2010-07-01-10_nobldg.nc")
dca.u.nobldg <- ncvar_get(dca.winddata.nobldg, "U10")
dca.v.nobldg <- ncvar_get(dca.winddata.nobldg, "V10")

dca.uv.t <- data.frame(dca.u.t, dca.v.t)
dca.uv.h <- data.frame(dca.u.h, dca.v.h)
dca.uv.nudapt <- data.frame(dca.u.nudapt, dca.v.nudapt)
dca.uv.nobldg <- data.frame(dca.u.nobldg, dca.v.nobldg)

write.csv(dca.uv.t, "uvten.csv")
write.csv(dca.uv.h, "uvhundred.csv")
write.csv(dca.uv.nudapt, "uvnudapt.csv")
write.csv(dca.uv.nobldg, "uvnobldg.csv")

df.t <- read.csv("NetCDF/dca_avhr_uv/tenwd.csv")
wd.t <- df.t$Wd.t
df.h <- read.csv("NetCDF/dca_avhr_uv/hundredwd.csv")
wd.h <- df.h$Wd.h
df.nudapt <- read.csv("NetCDF_new/NUDAPT_NetCDF/Time_Wind_DCA/nudaptwd.csv")
wd.nudapt <- df.nudapt$Wd.nudapt
df.nobldg <- read.csv("NetCDF_new/No_Buildings_NetCDF/Time_Wind_DCA/nobldgwd.csv")
wd.nobldg <- df.nobldg$Wd.nobldg

ws.t <- sqrt((dca.u.t*dca.u.t)+(dca.v.t*dca.v.t))
ws.h <- sqrt((dca.u.h*dca.u.h)+(dca.v.h*dca.v.h))
ws.nudapt <- sqrt((dca.u.nudapt*dca.u.nudapt)+(dca.v.nudapt*dca.v.nudapt))
ws.nobldg <- sqrt((dca.u.nobldg*dca.u.nobldg)+(dca.v.nobldg*dca.v.nobldg))

dates <- as.POSIXct(dca.time, format ="%Y%m%dT%H%M", tz = "America/New_York")

wind.t <- data.frame(dates,ws.t,wd.t)
wind.t <- rename(wind.t, date=dates, ws=ws.t,wd=wd.t)

wind.h <- data.frame(dates,ws.h,wd.h)
wind.h <- rename(wind.h, date=dates, ws=ws.h, wd=wd.h)

wind.nudapt <- data.frame(dates,ws.nudapt,wd.nudapt)
wind.nudapt <- rename(wind.nudapt, date=dates, ws=ws.nudapt,wd=wd.nudapt)

wind.nobldg <- data.frame(dates,ws.nobldg,wd.nobldg)
wind.nobldg <- rename(wind.nobldg, date=dates, ws=ws.nobldg, wd=wd.nobldg)

w.t <- pollutionRose(wind.t, pollutant = "ws", breaks = seq(0,8, by = 1))
w.h <- pollutionRose(wind.h, pollutant = "ws", breaks = seq(0,8, by = 1))
w.nudapt <- pollutionRose(wind.nudapt, pollutant = "ws", breaks = seq(0,8, by = 1))
w.nobldg <- pollutionRose(wind.nobldg, pollutant = "ws", breaks = seq(0,8, by = 1))

windows()
par(mfrow = c(1,2))
print(w.t, split=c(1,1))
print(w.h, split=c(2,1), newpage=FALSE)

