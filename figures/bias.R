library(weathermetrics)
library(ncdf4)
library(ggplot2)
library(Metrics)
library(Fgmutils)


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

ws.DCA.six.mph <- c(5, 0, 3, 0, 0, 0, 0, 0, 3, 0, 8, 7, 9, 7, 7, 9, 9, 7, 0, 10, 7, 5, 3, 6)
ws.DCA.seven.mph <- c(5, 0, 3, 6, 5, 7, 6, 5, 6, 7, 5, 6, 12, 10, 6, 0, 3, 7, 12, 6, 8, 0, 3, 0)

ws.DCA.july67.mph <- c(ws.DCA.six.mph, ws.DCA.seven.mph)
ws.DCA.july67.ms <- convert_wind_speed(ws.DCA.july67.mph, "mph", "mps")

setwd("D:/Out/")

wind.10m <- read.csv("10MeterOut/dca_wind_hrly_10m.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.100m <- read.csv("100MeterOut/dca_wind_hrly_100m.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.nu <- read.csv("NUDAPTOut/dca_wind_hrly_nudapt.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))
wind.no <- read.csv("NoBldgOut/dca_wind_hrly_nobldg.csv", header=FALSE, col.names=c("Hour", "Lat", "Lon", "wd", "ws", "NA"))

ws.t <- wind.10m$ws
ws.h <- wind.100m$ws
ws.nudapt <- wind.nu$ws
ws.nobldg <- wind.no$ws

ws.t.july67 <- ws.t[121:168]
ws.h.july67 <- ws.h[121:168]
ws.nudapt.july67 <- ws.nudapt[121:168]
ws.nobldg.july67 <- ws.nobldg[121:168]

ws.t.july67.bias <- ws.t.july67 - ws.DCA.july67.ms
ws.h.july67.bias <- ws.h.july67 - ws.DCA.july67.ms
ws.nudapt.july67.bias <- ws.nudapt.july67 - ws.DCA.july67.ms
ws.nobldg.july67.bias <- ws.nobldg.july67 - ws.DCA.july67.ms

hours <- c(1:48)

wind.48 <- data.frame(hours, ws.t.july67.bias, ws.h.july67.bias, ws.nudapt.july67.bias, ws.nudapt.july67.bias, ws.DCA.july67.ms)

ggplot(wind.48, aes(x=hours)) +
  geom_line(aes(y=ws.t.july67.bias, color = "10 Meter", linetype="10 Meter"), size=1.5) +
  geom_line(aes(y=ws.h.july67.bias, color = "100 Meter", linetype="100 Meter"), size=1.5) +
  geom_line(aes(y=ws.nudapt.july67.bias, color = "NUDAPT", linetype="NUDAPT"), size=1.5) +
  geom_line(aes(y=ws.nobldg.july67.bias, color = "No Buildings", linetype="No Buildings"), size=1.5) +
  #geom_line(aes(y=ws.DCA.july67.ms, color = "Obs", linetype="Obs"), size=1) +
  labs(x = "Hours", y = "Bias (m/s)") + 
  scale_x_continuous(breaks=seq(0,50, by = 6)) + 
  scale_y_continuous(breaks=seq(-5,5, by=1)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1))

# do stats with 240 hours  
mod.t <- lm(ws.DCA.total.ms ~ ws.t)
summary(mod.t)
sd(ws.t)
rmse(ws.DCA.total.ms, ws.t)
bias(ws.DCA.total.ms, ws.t)

mod.h <- lm(ws.DCA.total.ms ~ ws.h)
summary(mod.h)
sd(ws.h)
rmse(ws.DCA.total.ms, ws.h)
bias(ws.DCA.total.ms, ws.h)

mod.nudapt <- lm(ws.DCA.total.ms ~ ws.nudapt)
summary(mod.nudapt)
sd(ws.nudapt)
rmse(ws.DCA.total.ms, ws.nudapt)
bias(ws.DCA.total.ms, ws.nudapt)

mod.nobldg <- lm(ws.DCA.total.ms ~ ws.nobldg)
summary(mod.nobldg)
sd(ws.nobldg)
rmse(ws.DCA.total.ms, ws.nobldg)
bias(ws.DCA.total.ms, ws.nobldg)

setwd("D:/BiasOut")

dca.10m <- read.csv("dca_HI_hrly_10m.csv", header=FALSE, col.names=c("Hour","Lat","Lon","Temp","RH","NA"))
dca.10m.rh <- dca.10m$RH
dca.10m.temp.K <- dca.10m$Temp
dca.10m.temp.F <- kelvin.to.fahrenheit(dca.10m.temp.K)


dca.100m <- read.csv("dca_HI_hrly_100m.csv", header=FALSE, col.names=c("Hour","Lat","Lon","Temp","RH","NA"))
dca.100m.rh <- dca.100m$RH
dca.100m.temp.K <- dca.100m$Temp
dca.100m.temp.F <- kelvin.to.fahrenheit(dca.100m.temp.K)

dca.nu <- read.csv("dca_HI_hrly_nudapt.csv", header=FALSE, col.names=c("Hour","Lat","Lon","Temp","RH","NA"))
dca.nu.rh <- dca.nu$RH
dca.nu.temp.K <- dca.nu$Temp
dca.nu.temp.F <- kelvin.to.fahrenheit(dca.nu.temp.K)

dca.no <- read.csv("dca_HI_hrly_nobldg.csv", header=FALSE, col.names=c("Hour","Lat","Lon","Temp","RH","NA"))
dca.no.rh <- dca.no$RH
dca.no.temp.K <- dca.no$Temp
dca.no.temp.F <- kelvin.to.fahrenheit(dca.no.temp.K)

temp.obs.1 <- c(70, 70, 70, 70, 68, 67, 66, 65, 68, 70, 72, 74, 75, 77, 78, 79, 80, 80, 80, 79, 78, 75, 74, 73)
temp.obs.2 <- c(70, 68, 66, 65, 64, 66, 65, 66, 69, 73, 74, 75, 77, 78, 80, 81, 81, 81, 82, 81, 78, 75, 72, 71)
temp.obs.3 <- c(70, 69, 67, 67, 65, 65, 64, 66, 69, 73, 77, 81, 81, 83, 84, 86, 86, 86, 86, 85, 83, 79, 78, 76)
temp.obs.4 <- c(74, 72, 70, 70, 70, 68, 68, 68, 71, 75, 79, 83, 87, 89, 92, 93, 93, 94, 93, 92, 89, 86, 82, 82)
temp.obs.5 <- c(78, 77, 76, 77, 74, 73, 75, 74, 78, 83, 89, 93, 93, 95, 95, 98, 97, 98, 97, 96, 93, 89, 87, 85)
temp.obs.6 <- c(83, 83, 82, 81, 79, 80, 79, 80, 82, 85, 93, 97, 100, 99, 100, 101,102, 102, 101, 99, 97, 93, 89, 87)
temp.obs.7 <- c(86, 87, 86, 84, 83, 81, 82, 84,87, 89, 92, 95, 99, 99, 99, 99, 101, 100, 99, 97, 95, 92, 91, 91)
temp.obs.8 <- c(88, 87, 87, 85, 83, 82, 81, 81, 83, 85, 87, 89, 91, 93, 93, 93, 93, 92, 91, 88, 85, 84, 84, 83)
temp.obs.9 <- c(81, 80, 79, 78, 77, 77, 76, 77, 79, 82, 83, 86, 86, 89, 91, 93, 90, 92, 89, 87, 86, 85, 83, 82)
temp.obs.10 <- c(78, 79, 79, 79, 79, 77, 75, 75, 75, 73, 75, 75, 75, 75, 75, 77, 81, 81, 81, 79, 77, 76, 75, 75)

temp.obs.tot <- c(temp.obs.1, temp.obs.2, temp.obs.3, temp.obs.4, temp.obs.5, temp.obs.6, temp.obs.7, temp.obs.8, temp.obs.9, temp.obs.10)

rh.obs.1 <- c(51, 55, 55, 41, 42, 42, 43, 45, 42, 41, 37, 34, 31, 29, 27, 26, 25, 25, 24, 25, 25, 32, 33, 33)
rh.obs.2 <- c(39, 40, 47, 48, 52, 52, 50, 54, 49, 35, 37, 34, 32, 30, 27, 26, 25, 24, 23, 24, 35, 40, 43, 45)
rh.obs.3 <- c(49, 51, 54, 59, 65, 63, 63, 63, 53, 46, 42, 34, 31, 31, 27, 27, 25, 27, 27, 31, 36, 39, 48, 50)
rh.obs.4 <- c(57, 61, 68, 71, 68, 70, 70, 73, 66, 53, 50, 46, 37, 31, 30, 29, 32, 27, 30, 31, 36, 36, 56, 49)
rh.obs.5 <- c(64, 69, 69, 66, 73, 68, 62, 66, 62, 51, 40, 38, 34, 31, 32, 31, 32, 30, 29, 33, 38, 45, 51, 63)
rh.obs.6 <- c(60, 60, 66, 69, 74, 69, 74, 74, 67, 59, 44, 34, 27, 28, 29, 29, 23, 21, 20, 25, 24, 39, 52, 51)
rh.obs.7 <- c(62, 57, 57, 58, 58, 65, 60, 55, 51, 48, 45, 41, 33, 32, 28, 30, 29, 32, 35, 36, 40, 47, 48, 45)
rh.obs.8 <- c(53, 55, 55, 59, 67, 69, 72, 74, 69, 65, 59, 55, 50, 44, 44, 44, 45, 47, 47, 53, 57, 56, 58, 58)
rh.obs.9 <- c(62, 67, 69, 74, 76, 76, 79, 79, 74, 65, 63, 55, 53, 45, 42, 38, 46, 45, 48, 51, 51, 51, 60, 65)
rh.obs.10 <- c(76, 74, 74, 77, 77, 84, 84, 84, 84, 88, 84, 89, 87, 84, 79, 74, 61, 60, 58, 64, 71, 74, 73, 73)

rh.obs.tot <- c(rh.obs.1, rh.obs.2, rh.obs.3, rh.obs.4, rh.obs.5, rh.obs.6, rh.obs.7, rh.obs.8, rh.obs.9, rh.obs.10)


temp.10m.july67.F <- dca.10m.temp.F[121:168]
temp.100m.july67.F <- dca.100m.temp.F[121:168]
temp.nu.july67.F <- dca.nu.temp.F[121:168]
temp.no.july67.F <- dca.no.temp.F[121:168]

temp.obs.july67 <- temp.obs.tot[121:168]

temp.10m.july67.bias <- temp.10m.july67.F - temp.obs.july67
temp.100m.july67.bias <- temp.100m.july67.F - temp.obs.july67
temp.nu.july67.bias <- temp.nu.july67.F - temp.obs.july67
temp.no.july67.bias <-  temp.no.july67.F - temp.obs.july67

temp.48 <- data.frame(hours, temp.10m.july67.bias, temp.100m.july67.bias, temp.nu.july67.bias, temp.no.july67.bias, temp.obs.july67)

ggplot(temp.48, aes(x=hours)) +
  geom_line(aes(y=temp.10m.july67.bias, color = "10 Meter", linetype="10 Meter"), size=1.5) +
  geom_line(aes(y=temp.100m.july67.bias, color = "100 Meter", linetype="100 Meter"), size=1.5) +
  geom_line(aes(y=temp.nu.july67.bias, color = "NUDAPT", linetype="NUDAPT"), size=1.5) +
  geom_line(aes(y=temp.no.july67.bias, color = "No Buildings", linetype="No Buildings"), size=1.5) +
  labs(x = "Hours", y = "Bias (F)") + 
  scale_x_continuous(breaks=seq(0,50, by = 6)) + 
  scale_y_continuous(breaks=seq(-42,2, by=4)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1))

mod.t <- lm(temp.obs.tot ~ dca.10m.temp.F)
summary(mod.t)
sd(dca.10m.temp.F)
rmse(temp.obs.tot, dca.10m.temp.F)
bias(temp.obs.tot, dca.10m.temp.F)

mod.h <- lm(temp.obs.tot ~ dca.100m.temp.F)
summary(mod.h)
sd(dca.100m.temp.F)
rmse(temp.obs.tot, dca.100m.temp.F)
bias(temp.obs.tot, dca.100m.temp.F)

mod.nudapt <- lm(temp.obs.tot ~ dca.nu.temp.F)
summary(mod.nudapt)
sd(dca.nu.temp.F)
rmse(temp.obs.tot, dca.nu.temp.F)
bias(temp.obs.tot, dca.nu.temp.F)

mod.nobldg <- lm(temp.obs.tot ~ dca.no.temp.F)
summary(mod.nobldg)
sd(dca.no.temp.F)
rmse(temp.obs.tot, dca.no.temp.F)
bias(temp.obs.tot, dca.no.temp.F)

dca.10m.rh.july67 <- dca.10m.rh[121:168]
dca.100m.rh.july67 <- dca.100m.rh[121:168]
dca.nu.rh.july67 <- dca.nu.rh[121:168]
dca.no.rh.july67 <- dca.no.rh[121:168]
rh.obs.july67 <- rh.obs.tot[121:168]

dca.10m.rh.july67.bias <- dca.10m.rh.july67 - rh.obs.july67
dca.100m.rh.july67.bias <- dca.100m.rh.july67 - rh.obs.july67
dca.nu.rh.july67.bias <- dca.nu.rh.july67 - rh.obs.july67
dca.no.rh.july67.bias <- dca.no.rh.july67 - rh.obs.july67

rh.48 <- data.frame(hours, dca.10m.rh.july67.bias, dca.100m.rh.july67.bias, dca.nu.rh.july67.bias, dca.no.rh.july67.bias)

ggplot(rh.48, aes(x=hours)) +
  geom_line(aes(y=dca.10m.rh.july67.bias, color = "10 Meter", linetype="10 Meter"), size=1.5) +
  geom_line(aes(y=dca.100m.rh.july67.bias, color = "100 Meter", linetype="100 Meter"), size=1.5) +
  geom_line(aes(y=dca.nu.rh.july67.bias, color = "NUDAPT", linetype="NUDAPT"), size=1.5) +
  geom_line(aes(y=dca.no.rh.july67.bias, color = "No Buildings", linetype="No Buildings"), size=1.5) +
  labs(x = "Hours", y = "Bias (%)") + 
  scale_x_continuous(breaks=seq(0,50, by = 6)) + 
  scale_y_continuous(breaks=seq(-15,55, by=10)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray")) +
  scale_linetype_manual(name="Legend", values=c("10 Meter" = 1, "100 Meter" = 1, "NUDAPT" = 1, "No Buildings" = 1))

mod.t <- lm(rh.obs.tot ~ dca.10m.rh)
summary(mod.t)
sd(dca.10m.rh)
rmse(rh.obs.tot, dca.10m.rh)
bias(rh.obs.tot, dca.10m.rh)

mod.h <- lm(rh.obs.tot ~ dca.100m.rh)
summary(mod.h)
sd(dca.100m.rh)
rmse(rh.obs.tot, dca.100m.rh)
bias(rh.obs.tot, dca.100m.rh)

mod.nu <- lm(rh.obs.tot ~ dca.nu.rh)
summary(mod.nu)
sd(dca.nu.rh)
rmse(rh.obs.tot, dca.nu.rh)
bias(rh.obs.tot, dca.nu.rh)

mod.no <- lm(rh.obs.tot ~ dca.no.rh)
summary(mod.no)
sd(dca.no.rh)
rmse(rh.obs.tot, dca.no.rh)
bias(rh.obs.tot, dca.no.rh)


### Sensitivity

hours <- c(1:240)

dca.sense.43 <- nc_open("Revisions_v3//temp//dca_t2_hrly_nobldg43.nc")
temp.dca.sense.43.K <- ncvar_get(dca.sense.43, "T2")
temp.dca.sense.43.F <- kelvin.to.fahrenheit(temp.dca.sense.43.K)
temp.dca.sense.43.F <- append(temp.dca.sense.43.F, rep(NA, 2))

dca.sense.50 <- nc_open("Revisions_v3//temp//dca_t2_hrly_nobldg50.nc")
temp.dca.sense.50.K <- ncvar_get(dca.sense.50, "T2")
temp.dca.sense.50.F <- kelvin.to.fahrenheit(temp.dca.sense.50.K)
temp.dca.sense.50.F <- append(temp.dca.sense.50.F, rep(NA, 176))

temp.sense <- data.frame(hours, temp.dca.sense.43.F, temp.dca.sense.50.F, temp.obs.tot)

ggplot(temp.sense, aes(x=hours)) +
  geom_line(aes(y=temp.dca.sense.43.F, color = "43 Layers", linetype="43 Layers"), size=1.5) +
  geom_line(aes(y=temp.dca.sense.50.F, color = "50 Layers", linetype="50 Layers"), size=1.5) +
  geom_line(aes(y=temp.obs.tot, color = "Observed", linetype="Observed"), size=1.5) +
  labs(x = "Hours", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(0,240, by = 24)) + 
  scale_y_continuous(breaks=seq(50,100, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("43 Layers" = "darkred", "50 Layers" = "blue", "Observed" = "black")) +
  scale_linetype_manual(name="Legend", values=c("43 Layers" = 1, "50 Layers" = 1, "Observed" = 1))


temp.dca.sense.43.F.bias <- temp.dca.sense.43.F - temp.obs.tot
temp.dca.sense.50.F.bias <- temp.dca.sense.50.F - temp.obs.tot

temp.sense.bias <- data.frame(hours, temp.dca.sense.43.F.bias, temp.dca.sense.50.F.bias)

ggplot(temp.sense.bias, aes(x=hours)) +
  geom_line(aes(y=temp.dca.sense.43.F.bias, color = "43 Layers", linetype="43 Layers"), size=1.5) +
  geom_line(aes(y=temp.dca.sense.50.F.bias, color = "50 Layers", linetype="50 Layers"), size=1.5) +
  labs(x = "Hours", y = "Temperature (F)") + 
  scale_x_continuous(breaks=seq(0,240, by = 24)) + 
  scale_y_continuous(breaks=seq(-20,20, by=5)) + 
  theme_bw() +
  theme(axis.title=element_text(size=16), axis.text=element_text(size=12)) +
  scale_color_manual(name="Legend", values=c("43 Layers" = "darkred", "50 Layers" = "blue")) +
  scale_linetype_manual(name="Legend", values=c("43 Layers" = 1, "50 Layers" = 1))


