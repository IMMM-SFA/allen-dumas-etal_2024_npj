library(weathermetrics)

setwd("F:/Out/")

hr125_10m <- read.csv("10MeterOut/wdc_HI_hr125_10m.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr125_10m$TempFahrenheit <- kelvin.to.fahrenheit(hr125_10m$TempKelvin)

hr125_10m$HI_1 <- -42.379 + 2.04901523*hr125_10m$TempFahrenheit + 10.14333127*hr125_10m$RH - .22475541*hr125_10m$TempFahrenheit*hr125_10m$RH -
  .00683783*hr125_10m$TempFahrenheit*hr125_10m$TempFahrenheit - .05481717*hr125_10m$RH*hr125_10m$RH +
  .00122874*hr125_10m$TempFahrenheit*hr125_10m$TempFahrenheit*hr125_10m$RH + .00085282*hr125_10m$TempFahrenheit*hr125_10m$RH*hr125_10m$RH -
  .00000199*hr125_10m$TempFahrenheit*hr125_10m$TempFahrenheit*hr125_10m$RH*hr125_10m$RH

min(hr125_10m$RH)

#hr125_10m$HI_2 <- ifelse((hr125_10m$RH < 13) & (80 < hr125_10m$TempFahrenheit) & (hr125_10m$TempFahrenheit < 112),
                        #hr125_10m$HI_2 - ((13-hr125_10m$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
                         #hr125_10m$HI_1)

hr125_10m$HI_2 <- ifelse((hr125_10m$RH > 85) & (80 < hr125_10m$TempFahrenheit) & (hr125_10m$TempFahrenheit < 87),
                         hr125_10m$HI_1 + ((hr125_10m$RH-85)/10) * ((87-hr125_10m$TempFahrenheit)/5),
                         hr125_10m$HI_1)

hr125_10m$HI_3 <- ifelse(hr125_10m$HI_2 < 80,
                         0.5 * (hr125_10m$TempFahrenheit + 61.0 + ((hr125_10m$TempFahrenheit-68.0)*1.2) + (hr125_10m$RH*0.094)),
                         hr125_10m$HI_2)

hr166_10m <- read.csv("10MeterOut/wdc_HI_hr166_10m.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr166_10m$TempFahrenheit <- kelvin.to.fahrenheit(hr166_10m$TempKelvin)

hr166_10m$HI_1 <- -42.379 + 2.04901523*hr166_10m$TempFahrenheit + 10.14333127*hr166_10m$RH - .22475541*hr166_10m$TempFahrenheit*hr166_10m$RH -
  .00683783*hr166_10m$TempFahrenheit*hr166_10m$TempFahrenheit - .05481717*hr166_10m$RH*hr166_10m$RH +
  .00122874*hr166_10m$TempFahrenheit*hr166_10m$TempFahrenheit*hr166_10m$RH + .00085282*hr166_10m$TempFahrenheit*hr166_10m$RH*hr166_10m$RH -
  .00000199*hr166_10m$TempFahrenheit*hr166_10m$TempFahrenheit*hr166_10m$RH*hr166_10m$RH

min(hr166_10m$RH)

#hr166_10m$HI_2 <- ifelse((hr166_10m$RH < 13) & (80 < hr166_10m$TempFahrenheit) & (hr166_10m$TempFahrenheit < 112),
#hr166_10m$HI_2 - ((13-hr166_10m$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr166_10m$HI_1)

hr166_10m$HI_2 <- ifelse((hr166_10m$RH > 85) & (80 < hr166_10m$TempFahrenheit) & (hr166_10m$TempFahrenheit < 87),
                         hr166_10m$HI_1 + ((hr166_10m$RH-85)/10) * ((87-hr166_10m$TempFahrenheit)/5),
                         hr166_10m$HI_1)

hr166_10m$HI_3 <- ifelse(hr166_10m$HI_2 < 80,
                         0.5 * (hr166_10m$TempFahrenheit + 61.0 + ((hr166_10m$TempFahrenheit-68.0)*1.2) + (hr166_10m$RH*0.094)),
                         hr166_10m$HI_2)


hr125_100m <- read.csv("100MeterOut/wdc_HI_hr125_100m.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr125_100m$TempFahrenheit <- kelvin.to.fahrenheit(hr125_100m$TempKelvin)

hr125_100m$HI_1 <- -42.379 + 2.04901523*hr125_100m$TempFahrenheit + 10.14333127*hr125_100m$RH - .22475541*hr125_100m$TempFahrenheit*hr125_100m$RH -
  .00683783*hr125_100m$TempFahrenheit*hr125_100m$TempFahrenheit - .05481717*hr125_100m$RH*hr125_100m$RH +
  .00122874*hr125_100m$TempFahrenheit*hr125_100m$TempFahrenheit*hr125_100m$RH + .00085282*hr125_100m$TempFahrenheit*hr125_100m$RH*hr125_100m$RH -
  .00000199*hr125_100m$TempFahrenheit*hr125_100m$TempFahrenheit*hr125_100m$RH*hr125_100m$RH

min(hr125_100m$RH)

#hr125_100m$HI_2 <- ifelse((hr125_100m$RH < 13) & (80 < hr125_100m$TempFahrenheit) & (hr125_100m$TempFahrenheit < 112),
#hr125_100m$HI_2 - ((13-hr125_100m$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr125_100m$HI_1)

hr125_100m$HI_2 <- ifelse((hr125_100m$RH > 85) & (80 < hr125_100m$TempFahrenheit) & (hr125_100m$TempFahrenheit < 87),
                         hr125_100m$HI_1 + ((hr125_100m$RH-85)/10) * ((87-hr125_100m$TempFahrenheit)/5),
                         hr125_100m$HI_1)

hr125_100m$HI_3 <- ifelse(hr125_100m$HI_2 < 80,
                         0.5 * (hr125_100m$TempFahrenheit + 61.0 + ((hr125_100m$TempFahrenheit-68.0)*1.2) + (hr125_100m$RH*0.094)),
                         hr125_100m$HI_2)

hr166_100m <- read.csv("100MeterOut/wdc_HI_hr166_100m.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr166_100m$TempFahrenheit <- kelvin.to.fahrenheit(hr166_100m$TempKelvin)

hr166_100m$HI_1 <- -42.379 + 2.04901523*hr166_100m$TempFahrenheit + 10.14333127*hr166_100m$RH - .22475541*hr166_100m$TempFahrenheit*hr166_100m$RH -
  .00683783*hr166_100m$TempFahrenheit*hr166_100m$TempFahrenheit - .05481717*hr166_100m$RH*hr166_100m$RH +
  .00122874*hr166_100m$TempFahrenheit*hr166_100m$TempFahrenheit*hr166_100m$RH + .00085282*hr166_100m$TempFahrenheit*hr166_100m$RH*hr166_100m$RH -
  .00000199*hr166_100m$TempFahrenheit*hr166_100m$TempFahrenheit*hr166_100m$RH*hr166_100m$RH

min(hr166_100m$RH)

#hr166_100m$HI_2 <- ifelse((hr166_100m$RH < 13) & (80 < hr166_100m$TempFahrenheit) & (hr166_100m$TempFahrenheit < 112),
#hr166_100m$HI_2 - ((13-hr166_100m$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr166_100m$HI_1)

hr166_100m$HI_2 <- ifelse((hr166_100m$RH > 85) & (80 < hr166_100m$TempFahrenheit) & (hr166_100m$TempFahrenheit < 87),
                         hr166_100m$HI_1 + ((hr166_100m$RH-85)/10) * ((87-hr166_100m$TempFahrenheit)/5),
                         hr166_100m$HI_1)

hr166_100m$HI_3 <- ifelse(hr166_100m$HI_2 < 80,
                         0.5 * (hr166_100m$TempFahrenheit + 61.0 + ((hr166_100m$TempFahrenheit-68.0)*1.2) + (hr166_100m$RH*0.094)),
                         hr166_100m$HI_2)

hr125_nudapt <- read.csv("NUDAPTOut/wdc_HI_hr125_nudapt.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr125_nudapt$TempFahrenheit <- kelvin.to.fahrenheit(hr125_nudapt$TempKelvin)

hr125_nudapt$HI_1 <- -42.379 + 2.04901523*hr125_nudapt$TempFahrenheit + 10.14333127*hr125_nudapt$RH - .22475541*hr125_nudapt$TempFahrenheit*hr125_nudapt$RH -
  .00683783*hr125_nudapt$TempFahrenheit*hr125_nudapt$TempFahrenheit - .05481717*hr125_nudapt$RH*hr125_nudapt$RH +
  .00122874*hr125_nudapt$TempFahrenheit*hr125_nudapt$TempFahrenheit*hr125_nudapt$RH + .00085282*hr125_nudapt$TempFahrenheit*hr125_nudapt$RH*hr125_nudapt$RH -
  .00000199*hr125_nudapt$TempFahrenheit*hr125_nudapt$TempFahrenheit*hr125_nudapt$RH*hr125_nudapt$RH

min(hr125_nudapt$RH)

#hr125_nudapt$HI_2 <- ifelse((hr125_nudapt$RH < 13) & (80 < hr125_nudapt$TempFahrenheit) & (hr125_nudapt$TempFahrenheit < 112),
#hr125_nudapt$HI_2 - ((13-hr125_nudapt$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr125_nudapt$HI_1)

hr125_nudapt$HI_2 <- ifelse((hr125_nudapt$RH > 85) & (80 < hr125_nudapt$TempFahrenheit) & (hr125_nudapt$TempFahrenheit < 87),
                         hr125_nudapt$HI_1 + ((hr125_nudapt$RH-85)/10) * ((87-hr125_nudapt$TempFahrenheit)/5),
                         hr125_nudapt$HI_1)

hr125_nudapt$HI_3 <- ifelse(hr125_nudapt$HI_2 < 80,
                         0.5 * (hr125_nudapt$TempFahrenheit + 61.0 + ((hr125_nudapt$TempFahrenheit-68.0)*1.2) + (hr125_nudapt$RH*0.094)),
                         hr125_nudapt$HI_2)

hr166_nudapt <- read.csv("NUDAPTOut/wdc_HI_hr166_nudapt.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr166_nudapt$TempFahrenheit <- kelvin.to.fahrenheit(hr166_nudapt$TempKelvin)

hr166_nudapt$HI_1 <- -42.379 + 2.04901523*hr166_nudapt$TempFahrenheit + 10.14333127*hr166_nudapt$RH - .22475541*hr166_nudapt$TempFahrenheit*hr166_nudapt$RH -
  .00683783*hr166_nudapt$TempFahrenheit*hr166_nudapt$TempFahrenheit - .05481717*hr166_nudapt$RH*hr166_nudapt$RH +
  .00122874*hr166_nudapt$TempFahrenheit*hr166_nudapt$TempFahrenheit*hr166_nudapt$RH + .00085282*hr166_nudapt$TempFahrenheit*hr166_nudapt$RH*hr166_nudapt$RH -
  .00000199*hr166_nudapt$TempFahrenheit*hr166_nudapt$TempFahrenheit*hr166_nudapt$RH*hr166_nudapt$RH

min(hr166_nudapt$RH)

#hr166_nudapt$HI_2 <- ifelse((hr166_nudapt$RH < 13) & (80 < hr166_nudapt$TempFahrenheit) & (hr166_nudapt$TempFahrenheit < 112),
#hr166_nudapt$HI_2 - ((13-hr166_nudapt$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr166_nudapt$HI_1)

hr166_nudapt$HI_2 <- ifelse((hr166_nudapt$RH > 85) & (80 < hr166_nudapt$TempFahrenheit) & (hr166_nudapt$TempFahrenheit < 87),
                         hr166_nudapt$HI_1 + ((hr166_nudapt$RH-85)/10) * ((87-hr166_nudapt$TempFahrenheit)/5),
                         hr166_nudapt$HI_1)

hr166_nudapt$HI_3 <- ifelse(hr166_nudapt$HI_2 < 80,
                         0.5 * (hr166_nudapt$TempFahrenheit + 61.0 + ((hr166_nudapt$TempFahrenheit-68.0)*1.2) + (hr166_nudapt$RH*0.094)),
                         hr166_nudapt$HI_2)

hr125_nobldg <- read.csv("NoBldgOut/wdc_HI_hr125_nobldg.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr125_nobldg$TempFahrenheit <- kelvin.to.fahrenheit(hr125_nobldg$TempKelvin)

hr125_nobldg$HI_1 <- -42.379 + 2.04901523*hr125_nobldg$TempFahrenheit + 10.14333127*hr125_nobldg$RH - .22475541*hr125_nobldg$TempFahrenheit*hr125_nobldg$RH -
  .00683783*hr125_nobldg$TempFahrenheit*hr125_nobldg$TempFahrenheit - .05481717*hr125_nobldg$RH*hr125_nobldg$RH +
  .00122874*hr125_nobldg$TempFahrenheit*hr125_nobldg$TempFahrenheit*hr125_nobldg$RH + .00085282*hr125_nobldg$TempFahrenheit*hr125_nobldg$RH*hr125_nobldg$RH -
  .00000199*hr125_nobldg$TempFahrenheit*hr125_nobldg$TempFahrenheit*hr125_nobldg$RH*hr125_nobldg$RH

min(hr125_nobldg$RH)

#hr125_nobldg$HI_2 <- ifelse((hr125_nobldg$RH < 13) & (80 < hr125_nobldg$TempFahrenheit) & (hr125_nobldg$TempFahrenheit < 112),
#hr125_nobldg$HI_2 - ((13-hr125_nobldg$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr125_nobldg$HI_1)

hr125_nobldg$HI_2 <- ifelse((hr125_nobldg$RH > 85) & (80 < hr125_nobldg$TempFahrenheit) & (hr125_nobldg$TempFahrenheit < 87),
                         hr125_nobldg$HI_1 + ((hr125_nobldg$RH-85)/10) * ((87-hr125_nobldg$TempFahrenheit)/5),
                         hr125_nobldg$HI_1)

hr125_nobldg$HI_3 <- ifelse(hr125_nobldg$HI_2 < 80,
                         0.5 * (hr125_nobldg$TempFahrenheit + 61.0 + ((hr125_nobldg$TempFahrenheit-68.0)*1.2) + (hr125_nobldg$RH*0.094)),
                         hr125_nobldg$HI_2)

hr166_nobldg <- read.csv("NoBldgOut/wdc_HI_hr166_nobldg.csv", header=FALSE, col.names=c("Cell","Lat","Lon","TempKelvin","RH","NA"))
hr166_nobldg$TempFahrenheit <- kelvin.to.fahrenheit(hr166_nobldg$TempKelvin)

hr166_nobldg$HI_1 <- -42.379 + 2.04901523*hr166_nobldg$TempFahrenheit + 10.14333127*hr166_nobldg$RH - .22475541*hr166_nobldg$TempFahrenheit*hr166_nobldg$RH -
  .00683783*hr166_nobldg$TempFahrenheit*hr166_nobldg$TempFahrenheit - .05481717*hr166_nobldg$RH*hr166_nobldg$RH +
  .00122874*hr166_nobldg$TempFahrenheit*hr166_nobldg$TempFahrenheit*hr166_nobldg$RH + .00085282*hr166_nobldg$TempFahrenheit*hr166_nobldg$RH*hr166_nobldg$RH -
  .00000199*hr166_nobldg$TempFahrenheit*hr166_nobldg$TempFahrenheit*hr166_nobldg$RH*hr166_nobldg$RH

min(hr166_nobldg$RH)

#hr166_nobldg$HI_2 <- ifelse((hr166_nobldg$RH < 13) & (80 < hr166_nobldg$TempFahrenheit) & (hr166_nobldg$TempFahrenheit < 112),
#hr166_nobldg$HI_2 - ((13-hr166_nobldg$RH)/4)*sqrt((17-abs(TempFahrenheit-95))/17),
#hr166_nobldg$HI_1)

hr166_nobldg$HI_2 <- ifelse((hr166_nobldg$RH > 85) & (80 < hr166_nobldg$TempFahrenheit) & (hr166_nobldg$TempFahrenheit < 87),
                         hr166_nobldg$HI_1 + ((hr166_nobldg$RH-85)/10) * ((87-hr166_nobldg$TempFahrenheit)/5),
                         hr166_nobldg$HI_1)

hr166_nobldg$HI_3 <- ifelse(hr166_nobldg$HI_2 < 80,
                         0.5 * (hr166_nobldg$TempFahrenheit + 61.0 + ((hr166_nobldg$TempFahrenheit-68.0)*1.2) + (hr166_nobldg$RH*0.094)),
                         hr166_nobldg$HI_2)

write.csv(hr125_10m, "wdc_HIcalc_hr125_10m.csv")
write.csv(hr125_100m, "wdc_HIcalc_hr125_100m.csv")
write.csv(hr125_nudapt, "wdc_HIcalc_hr125_nudapt.csv")
write.csv(hr125_nobldg, "wdc_HIcalc_hr125_nobldg.csv")

write.csv(hr166_10m, "wdc_HIcalc_hr166_10m.csv")
write.csv(hr166_100m, "wdc_HIcalc_hr166_100m.csv")
write.csv(hr166_nudapt, "wdc_HIcalc_hr166_nudapt.csv")
write.csv(hr166_nobldg, "wdc_HIcalc_hr166_nobldg.csv")
