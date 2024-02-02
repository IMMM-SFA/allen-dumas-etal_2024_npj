library(ncdf4)
library(humidity)
library(ggplot2)
library(weathermetrics)
library(ggpubr)
library(dplyr)
library(openair)



# Simulated Data

setwd("D:/Out/")

arb.hi.10m <- read.csv("10MeterOut/arb_HI_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.100m <- read.csv("100MeterOut/arb_HI_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.nu <- read.csv("NUDAPTOut/arb_HI_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.no <- read.csv("NoBldgOut/arb_HI_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

dca.hi.10m <- read.csv("10MeterOut/dca_HI_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.100m <- read.csv("100MeterOut/dca_HI_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.nu <- read.csv("NUDAPTOut/dca_HI_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.no <- read.csv("NoBldgOut/dca_HI_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

arb.temp.10m.F <- kelvin.to.fahrenheit(arb.hi.10m$TempKelvin)
arb.temp.100m.F <- kelvin.to.fahrenheit(arb.hi.100m$TempKelvin)
arb.temp.nu.F <- kelvin.to.fahrenheit(arb.hi.nu$TempKelvin)
arb.temp.no.F <- kelvin.to.fahrenheit(arb.hi.no$TempKelvin)

dca.temp.10m.F <- kelvin.to.fahrenheit(dca.hi.10m$TempKelvin)
dca.temp.100m.F <- kelvin.to.fahrenheit(dca.hi.100m$TempKelvin)
dca.temp.nu.F <- kelvin.to.fahrenheit(dca.hi.nu$TempKelvin)
dca.temp.no.F <- kelvin.to.fahrenheit(dca.hi.no$TempKelvin)

arb.rh.10m.F <- arb.hi.10m$RH
arb.rh.100m.F <- arb.hi.100m$RH
arb.rh.nu.F <- arb.hi.nu$RH
arb.rh.no.F <- arb.hi.no$RH

dca.rh.10m.F <- dca.hi.10m$RH
dca.rh.100m.F <- dca.hi.100m$RH
dca.rh.nu.F <- dca.hi.nu$RH
dca.rh.no.F <- dca.hi.no$RH

# Daymet

setwd("C:/Users/levis/Desktop/Urban Climate/Reanalysis/NetCDF Files/dcadaymet")

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

setwd("C:/Users/levis/Desktop/Urban Climate/Reanalysis/NetCDF Files/arboretumdaymet")

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

daydca.tmax.F <- celsius.to.fahrenheit(daydca.tmax)
daydca.tmin.F <- celsius.to.fahrenheit(daydca.tmin)
daydca.tav.F <- celsius.to.fahrenheit(daydca.tav)

dayarb.tmax.F <- celsius.to.fahrenheit(dayarb.tmax)
dayarb.tmin.F <- celsius.to.fahrenheit(dayarb.tmin)
dayarb.tav.F <- celsius.to.fahrenheit(dayarb.tav)

# Observed Data

dca.tmax.obs <- c(80, 82, 86, 94, 98, 102, 101, 93, 93, 81)
dca.humidmax.obs <- c(55, 54, 65, 73, 73, 74, 65, 74, 79, 94)

dca.tmin.obs <- c(65, 64, 64, 68, 73, 79, 81, 81, 76, 73)
dca.humidmin.obs <- c(24, 23, 25, 27, 29, 20, 28, 44, 38, 58)

dca.tav.obs <- c(73.3, 73.3, 73.3, 81.0, 86.5, 90.7, 91.7, 86.7, 82.4, 75.5)
dca.humidav.obs <- c(35.5, 38.4, 43.1, 49.3, 48.9, 46.7, 45.1, 56.8, 63.4, 82.1)

setwd("C:/Users/levis/Desktop/Urban Climate/New Figures/spav")

narbor.data <- read.csv("ncei_2577827.csv")
narbor.max <- narbor.data$TMAX
narbor.min <- narbor.data$TMIN
narbor.av <- narbor.data$TOBS

dca.lm.10m <- lm(dca.tav.obs ~ dca.temp.10m.F)
dca.lm.100m <- lm(dca.tav.obs ~ dca.temp.100m.F)
dca.lm.nu <- lm(dca.tav.obs ~ dca.temp.nu.F)
dca.lm.no <- lm(dca.tav.obs ~ dca.temp.no.F)

arb.lm.10m <- lm(narbor.av ~ arb.temp.10m.F)
arb.lm.100m <- lm(narbor.av ~ arb.temp.100m.F)
arb.lm.nu <- lm(narbor.av ~ arb.temp.nu.F)
arb.lm.no <- lm(narbor.av ~ arb.temp.no.F)

slope <- mean(c(dca.lm.10m$coefficients[2], dca.lm.100m$coefficients[2],
                dca.lm.nu$coefficients[2], dca.lm.no$coefficients[2],
                arb.lm.10m$coefficients[2], arb.lm.100m$coefficients[2],
                arb.lm.nu$coefficients[2], arb.lm.no$coefficients[2]))
intercept <- mean(c(dca.lm.10m$coefficients[1], dca.lm.100m$coefficients[1],
                    dca.lm.nu$coefficients[1], dca.lm.no$coefficients[1],
                    arb.lm.10m$coefficients[1], arb.lm.100m$coefficients[1],
                    arb.lm.nu$coefficients[1], arb.lm.no$coefficients[1]))

# Bias correction: y = 1.27x - 21.02

# Plots

days <- c(1:10)

tav.df.dca <- data.frame(days, dca.temp.10m.F, dca.temp.100m.F, daydca.tav.F, dca.tav.obs, dca.temp.nu.F, dca.temp.no.F)
tav.df.arb <- data.frame(days, arb.temp.10m.F, arb.temp.100m.F, dayarb.tav.F, narbor.av, arb.temp.nu.F, arb.temp.no.F)

hav.df.dca <- data.frame(days, dca.rh.10m.F, dca.rh.100m.F, daydca.humidityav, dca.humidav.obs, dca.rh.nu.F, dca.rh.no.F)
hav.df.arb <- data.frame(days, arb.rh.10m.F, arb.rh.100m.F, dayarb.humidityav, arb.rh.nu.F, arb.rh.no.F)

Tav.dca <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.temp.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dca.temp.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=daydca.tav.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=dca.tav.obs, linetype="Obs", color="Obs"), linewidth=1) + 
  geom_line(aes(y=dca.temp.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=dca.temp.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Tav.arb <- ggplot(tav.df.arb, aes(x=days)) + 
  geom_line(aes(y=arb.temp.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=arb.temp.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dayarb.tav.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=narbor.av, linetype="Obs", color="Obs"), linewidth=1) +
  geom_line(aes(y=arb.temp.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=arb.temp.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,89, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Hav.dca <- ggplot(hav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.rh.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dca.rh.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=daydca.humidityav, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=dca.humidav.obs, linetype="Obs", color="Obs"), linewidth=1) + 
  geom_line(aes(y=dca.rh.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=dca.rh.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(35,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Hav.arb <- ggplot(hav.df.arb, aes(x=days)) + 
  geom_line(aes(y=arb.rh.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=arb.rh.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dayarb.humidityav, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=arb.rh.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=arb.rh.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Humidity (%)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(35,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))


# Bias correction

setwd("D:/MinMaxOut/")

arb.hi.mx.10m <- read.csv("arb_HI_mx_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mx.100m <- read.csv("arb_HI_mx_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mx.nu <- read.csv("arb_HI_mx_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mx.no <- read.csv("arb_HI_mx_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

dca.hi.mx.10m <- read.csv("dca_HI_mx_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mx.100m <- read.csv("dca_HI_mx_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mx.nu <- read.csv("dca_HI_mx_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mx.no <- read.csv("dca_HI_mx_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

arb.temp.mx.10m.F <- kelvin.to.fahrenheit(arb.hi.mx.10m$TempKelvin)
arb.temp.mx.100m.F <- kelvin.to.fahrenheit(arb.hi.mx.100m$TempKelvin)
arb.temp.mx.nu.F <- kelvin.to.fahrenheit(arb.hi.mx.nu$TempKelvin)
arb.temp.mx.no.F <- kelvin.to.fahrenheit(arb.hi.mx.no$TempKelvin)

dca.temp.mx.10m.F <- kelvin.to.fahrenheit(dca.hi.mx.10m$TempKelvin)
dca.temp.mx.100m.F <- kelvin.to.fahrenheit(dca.hi.mx.100m$TempKelvin)
dca.temp.mx.nu.F <- kelvin.to.fahrenheit(dca.hi.mx.nu$TempKelvin)
dca.temp.mx.no.F <- kelvin.to.fahrenheit(dca.hi.mx.no$TempKelvin)

arb.temp.mx.10m.F <- arb.temp.mx.10m.F * slope + intercept
arb.temp.mx.100m.F <- arb.temp.mx.100m.F * slope + intercept
arb.temp.mx.nu.F <- arb.temp.mx.nu.F * slope + intercept
arb.temp.mx.no.F <- arb.temp.mx.no.F * slope + intercept

dca.temp.mx.10m.F <- dca.temp.mx.10m.F * slope + intercept
dca.temp.mx.100m.F <- dca.temp.mx.100m.F * slope + intercept
dca.temp.mx.nu.F <- dca.temp.mx.nu.F * slope + intercept
dca.temp.mx.no.F <- dca.temp.mx.no.F * slope + intercept

arb.hi.mn.10m <- read.csv("arb_HI_mn_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mn.100m <- read.csv("arb_HI_mn_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mn.nu <- read.csv("arb_HI_mn_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
arb.hi.mn.no <- read.csv("arb_HI_mn_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

dca.hi.mn.10m <- read.csv("dca_HI_mn_daily_10m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mn.100m <- read.csv("dca_HI_mn_daily_100m.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mn.nu <- read.csv("dca_HI_mn_daily_nudapt.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))
dca.hi.mn.no <- read.csv("dca_HI_mn_daily_nobldg.csv", header=FALSE, col.names=c("Day","Lon","Lat","TempKelvin","RH", "NA"))

arb.temp.mn.10m.F <- kelvin.to.fahrenheit(arb.hi.mn.10m$TempKelvin)
arb.temp.mn.100m.F <- kelvin.to.fahrenheit(arb.hi.mn.100m$TempKelvin)
arb.temp.mn.nu.F <- kelvin.to.fahrenheit(arb.hi.mn.nu$TempKelvin)
arb.temp.mn.no.F <- kelvin.to.fahrenheit(arb.hi.mn.no$TempKelvin)

dca.temp.mn.10m.F <- kelvin.to.fahrenheit(dca.hi.mn.10m$TempKelvin)
dca.temp.mn.100m.F <- kelvin.to.fahrenheit(dca.hi.mn.100m$TempKelvin)
dca.temp.mn.nu.F <- kelvin.to.fahrenheit(dca.hi.mn.nu$TempKelvin)
dca.temp.mn.no.F <- kelvin.to.fahrenheit(dca.hi.mn.no$TempKelvin)

arb.temp.mn.10m.F <- arb.temp.mn.10m.F * slope + intercept
arb.temp.mn.100m.F <- arb.temp.mn.100m.F * slope + intercept
arb.temp.mn.nu.F <- arb.temp.mn.nu.F * slope + intercept
arb.temp.mn.no.F <- arb.temp.mn.no.F * slope + intercept

dca.temp.mn.10m.F <- dca.temp.mn.10m.F * slope + intercept
dca.temp.mn.100m.F <- dca.temp.mn.100m.F * slope + intercept
dca.temp.mn.nu.F <- dca.temp.mn.nu.F * slope + intercept
dca.temp.mn.no.F <- dca.temp.mn.no.F * slope + intercept

arb.temp.10m.F <- arb.temp.10m.F * slope + intercept
arb.temp.100m.F <- arb.temp.100m.F * slope + intercept
arb.temp.nu.F <- arb.temp.nu.F * slope + intercept
arb.temp.no.F <- arb.temp.no.F * slope + intercept

dca.temp.10m.F <- dca.temp.10m.F * slope + intercept
dca.temp.100m.F <- dca.temp.100m.F * slope + intercept
dca.temp.nu.F <- dca.temp.nu.F * slope + intercept
dca.temp.no.F <- dca.temp.no.F * slope + intercept

tmax.df.dca <- data.frame(days, dca.temp.mx.10m.F, dca.temp.mx.100m.F, daydca.tmax.F, dca.tmax.obs, dca.temp.mx.nu.F, dca.temp.mx.no.F)
tmax.df.arb <- data.frame(days, arb.temp.mx.10m.F, arb.temp.mx.100m.F, dayarb.tmax.F, narbor.max, arb.temp.mx.nu.F, arb.temp.mx.no.F)

tmin.df.dca <- data.frame(days, dca.temp.mn.10m.F, dca.temp.mn.100m.F, daydca.tmin.F, dca.tmin.obs, dca.temp.mn.nu.F, dca.temp.mn.no.F)
tmin.df.arb <- data.frame(days, arb.temp.mn.10m.F, arb.temp.mn.100m.F, dayarb.tmin.F, narbor.min, arb.temp.mn.nu.F, arb.temp.mn.no.F)

tav.df.dca <- data.frame(days, dca.temp.10m.F, dca.temp.100m.F, daydca.tav.F, dca.tav.obs, dca.temp.nu.F, dca.temp.no.F)
tav.df.arb <- data.frame(days, arb.temp.10m.F, arb.temp.100m.F, dayarb.tav.F, narbor.av, arb.temp.nu.F, arb.temp.no.F)

Tav.dca <- ggplot(tav.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.temp.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dca.temp.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=daydca.tav.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=dca.tav.obs, linetype="Obs", color="Obs"), linewidth=1) + 
  geom_line(aes(y=dca.temp.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=dca.temp.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Tav.arb <- ggplot(tav.df.arb, aes(x=days)) + 
  geom_line(aes(y=arb.temp.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=arb.temp.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dayarb.tav.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=narbor.av, linetype="Obs", color="Obs"), linewidth=1) +
  geom_line(aes(y=arb.temp.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=arb.temp.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(64,89, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))


Tmax.dca <- ggplot(tmax.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.temp.mx.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dca.temp.mx.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=daydca.tmax.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=dca.tmax.obs, linetype="Obs", color="Obs"), linewidth=1) + 
  geom_line(aes(y=dca.temp.mx.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=dca.temp.mx.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Tmax.arb <- ggplot(tmax.df.arb, aes(x=days)) + 
  geom_line(aes(y=arb.temp.mx.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=arb.temp.mx.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dayarb.tmax.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=narbor.max, linetype="Obs", color="Obs"), linewidth=1) +
  geom_line(aes(y=arb.temp.mx.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=arb.temp.mx.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(72,102, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Tmin.dca <- ggplot(tmin.df.dca, aes(x=days)) + 
  geom_line(aes(y=dca.temp.mn.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dca.temp.mn.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=daydca.tmin.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=dca.tmin.obs, linetype="Obs", color="Obs"), linewidth=1) + 
  geom_line(aes(y=dca.temp.mn.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=dca.temp.mn.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(53,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))

Tmin.arb <- ggplot(tmin.df.arb, aes(x=days)) + 
  geom_line(aes(y=arb.temp.mn.10m.F, color="10 Meter", linetype="10 Meter"), linewidth=1.5) + 
  geom_line(aes(y=arb.temp.mn.100m.F, color="100 Meter", linetype="100 Meter"), linewidth=1.5) + 
  geom_line(aes(y=dayarb.tmin.F, linetype="Daymet", color="Daymet"), linewidth=1) + 
  geom_line(aes(y=narbor.min, linetype="Obs", color="Obs"), linewidth=1) +
  geom_line(aes(y=arb.temp.mn.nu.F, linetype="NUDAPT", color="NUDAPT"), linewidth=1.5) +
  geom_line(aes(y=arb.temp.mn.no.F, linetype="No Buildings", color="No Buildings"), linewidth=1.5) +
  labs(x = "Days", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(1,10, by = 1)) + 
  scale_y_continuous(breaks=seq(53,90, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12), legend.title=element_text(size=12), legend.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray", "Obs" = "black", "Daymet" = "purple")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1, "Obs" = 2, "Daymet" = 4))
