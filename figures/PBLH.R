library(ncdf4)
library(ggplot2)
library(ggpubr)

setwd("C:/Users/levis/OneDrive/Desktop/WDC_Nature")

days <- c(1:10)

PBLH.mx.t <- nc_open("NetCDF/sp_PBLH/sp.PBLH_mx_2010-07-01-10_10m.nc")
PBLH.mx.t <- ncvar_get(PBLH.mx.t, "PBLH")

PBLH.mx.h <- nc_open("NetCDF/sp_PBLH/sp.PBLH_mx_2010-07-01-10_100m.nc")
PBLH.mx.h <- ncvar_get(PBLH.mx.h, "PBLH")

PBLH.mx.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/PBLH_nudapt/sp.PBLH_mx_2010-07-01-10_nudapt.nc")
PBLH.mx.nudapt <- ncvar_get(PBLH.mx.nudapt, "PBLH")

PBLH.mx.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/PBLH_nobldg/sp.PBLH_mx_2010-07-01-10_nobldg.nc")
PBLH.mx.nobldg <- ncvar_get(PBLH.mx.nobldg, "PBLH")

PBLH.av.t <- nc_open("NetCDF/sp_PBLH/sp.PBLH_av_2010-07-01-10_10m.nc")
PBLH.av.t <- ncvar_get(PBLH.av.t, "PBLH")

PBLH.av.h <- nc_open("NetCDF/sp_PBLH/sp.PBLH_av_2010-07-01-10_100m.nc")
PBLH.av.h <- ncvar_get(PBLH.av.h, "PBLH")

PBLH.av.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/PBLH_nudapt/sp.PBLH_av_2010-07-01-10_nudapt.nc")
PBLH.av.nudapt <- ncvar_get(PBLH.av.nudapt, "PBLH")

PBLH.av.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/PBLH_nobldg/sp.PBLH_av_2010-07-01-10_nobldg.nc")
PBLH.av.nobldg <- ncvar_get(PBLH.av.nobldg, "PBLH")

PBLH.mn.t <- nc_open("NetCDF/sp_PBLH/sp.PBLH_mn_2010-07-01-10_10m.nc")
PBLH.mn.t <- ncvar_get(PBLH.mn.t, "PBLH")

PBLH.mn.h <- nc_open("NetCDF/sp_PBLH/sp.PBLH_mn_2010-07-01-10_100m.nc")
PBLH.mn.h <- ncvar_get(PBLH.mn.h, "PBLH")

PBLH.mn.nudapt <- nc_open("NetCDF_new/NUDAPT_NetCDF/PBLH_nudapt/sp.PBLH_mn_2010-07-01-10_nudapt.nc")
PBLH.mn.nudapt <- ncvar_get(PBLH.mn.nudapt, "PBLH")

PBLH.mn.nobldg <- nc_open("NetCDF_new/No_Buildings_NetCDF/PBLH_nobldg/sp.PBLH_mn_2010-07-01-10_nobldg.nc")
PBLH.mn.nobldg <- ncvar_get(PBLH.mn.nobldg, "PBLH")

df.mx <- data.frame(days, PBLH.mx.t, PBLH.mx.h, PBLH.mx.nudapt, PBLH.mx.nobldg)
df.av <- data.frame(days, PBLH.av.t, PBLH.av.h, PBLH.av.nudapt, PBLH.av.nobldg)
df.mn <- data.frame(days, PBLH.mn.t, PBLH.mn.h, PBLH.mn.nudapt, PBLH.mn.nobldg)

colors <- c("10 Meter" = "darkred", "100 Meter" = "blue", "NUDAPT" = "darkgreen", "No Buildings" = "gray")

Pmax <- ggplot(df.mx, aes(x=days)) +
  geom_line(aes(y=PBLH.mx.t), color="darkred", size = 1.5) +
  geom_line(aes(y=PBLH.mx.h), color="blue", size = 1.5) +
  geom_line(aes(y=PBLH.mx.nudapt), color="darkgreen", size = 1.5) +
  geom_line(aes(y=PBLH.mx.nobldg), color="gray", size = 1.5) +
  labs(x = "Days", y = "Atmospheric Boundary Layer Thickness (m)") +
  scale_x_continuous(breaks=seq(1,10, by = 1)) +
  theme_bw()

Pav <- ggplot(df.av, aes(x=days)) +
  geom_line(aes(y=PBLH.av.t), color="darkred", size = 1.5) +
  geom_line(aes(y=PBLH.av.h), color="blue", size = 1.5) +
  geom_line(aes(y=PBLH.av.nudapt), color="darkgreen", size = 1.5) +
  geom_line(aes(y=PBLH.av.nobldg), color="gray", size = 1.5) +
  labs(x = "Days", y = "Atmospheric Boundary Layer Thickness (m)") +
  scale_x_continuous(breaks=seq(1,10, by = 1)) +
  theme_bw()

Pmin <- ggplot(df.mn, aes(x=days)) +
  geom_line(aes(y=PBLH.mn.t), color="darkred", size = 1.5) +
  geom_line(aes(y=PBLH.mn.h), color="blue", size = 1.5) +
  geom_line(aes(y=PBLH.mn.nudapt), color="darkgreen", size = 1.5) +
  geom_line(aes(y=PBLH.mn.nobldg), color="gray", size = 1.5) +
  labs(x = "Days", y = "Atmospheric Boundary Layer Thickness (m)") +
  scale_x_continuous(breaks=seq(1,10, by = 1)) +
  theme_bw()

Plegend <- ggplot(df.mn, aes(x = days)) +
  geom_line(aes(y = PBLH.mn.t, color = "10 Meter"), size = 1.5) +
  geom_line(aes(y = PBLH.mn.h, color = "100 Meter"), size = 1.5) +
  geom_line(aes(y = PBLH.mn.nudapt, color = "NUDAPT"), size = 1.5) +
  geom_line(aes(y = PBLH.mn.nobldg, color = "No Buildings"), size = 1.5) +
  labs(title = "Minimum PBLH", x = "Days", y = "Atmospheric Boundary Layer Thickness (m)", color = "Legend") +
  scale_x_continuous(breaks=seq(1,10, by = 1)) +
  scale_color_manual(values = colors) +
  theme_bw()

windows()
ggarrange(Pmax, Pav, Pmin)

