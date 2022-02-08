# This code collects historical data from the National Arboretum and Daymet and puts it into variables to be used in other scripts

library(weathermetrics)
library(ncdf4)
library(openair)
library(dplyr)
library(humidity)

setwd("C:/Users/levis/OneDrive/Desktop/Urban Climate/New Figures/spav")

narbor.data <- read.csv("ncei_2577827.csv")
narbor.max <- narbor.data$TMAX
narbor.min <- narbor.data$TMIN
narbor.av <- narbor.data$TOBS

setwd("C:/Users/levis/OneDrive/Desktop/SULI Terms/ORNL Spring/Waterfront Figures/NetCDF/SpatAv/Tmax")

tmax.total <- nc_open("spatavtmax2010-07-01_10.nc")
tmax.C <- ncvar_get(tmax.total, "tmax")

setwd("C:/Users/levis/OneDrive/Desktop/SULI Terms/ORNL Spring/Waterfront Figures/NetCDF/SpatAv/Tmin")

tmin.total <- nc_open("spatavtmin2010-07-01_10.nc")
tmin.C <- ncvar_get(tmin.total, "tmin")

setwd("C:/Users/levis/OneDrive/Desktop/SULI Terms/ORNL Spring/Waterfront Figures/NetCDF/SpatAv/VP")

vp.total <- nc_open("spatavvp2010-07-01_10.nc")
vp.total <- ncvar_get(vp.total, "vp")

tav.C <- (tmax.C + tmin.C) / 2

tmax.F <- celsius.to.fahrenheit(tmax.C)
tmin.F <- celsius.to.fahrenheit(tmin.C)
tav.F <- celsius.to.fahrenheit(tav.C)
tav.K <- celsius.to.kelvin(tav.C)
tmax.K <- celsius.to.kelvin(tmax.C)
tmin.K <- celsius.to.kelvin(tmin.C)

vp.hPa <- vp.total / 100
svp <- SVP.ClaCla(tav.K)
rh <- (vp.hPa/svp) * 100

svp.max <- SVP.ClaCla(tmax.K)
rh.max <- (vp.hPa/svp.max) * 100

svp.min <- SVP.ClaCla(tmin.K)
rh.min <- (vp.hPa/svp.min) * 100
