# Figure Recreation Instructions

## Overview
The majority of figures were created using the output netCDF files from WRF. The data for each figure was aggegated from the netCDF files using nco on a Linux server, and the resulting files were used in ArcMap, Python, and R to create the visualizations. The initial output netCDF files from worht used a 15 minute timestep.

## Figure 3
For the daily-averaged temperature data:
* Extract the temperature and time variable from the total netCDF file at the National Arboretum and DCA (ncks -d south_north,67,67 -d west_east,74,74 -v T2,Times for Arboretum; ncks -d south_north,41,41 -d west_east,54,54 -v T2,Times for DCA) 
* Find the daily maximum, minimum, and average value for each cell (ncra (-y max/min) -d Time,0,23) and each day. The timesteps will change depending on which day and the timestep of the input file
* Concatenate the resulting files (ncrcat -o)
* Use Point_Dat.R and Daymet_and_Arboretum.R to make the line plots

For the daily-averaged humidity data:
* Extract the temperature, pressure, and specific humidity variables from the total netCDF file (ncks -v T2,PSFC,QVAPOR,Times,XLONG,XLAT) and each location using the above south_north and west_east dimensions
* Use epvars.water2015d03.csv.ncl to output a CSV file with the relative humidity for each grid cell
* In Excel, find the daily maximum, average, and minimum relative humidities.
* Use the Daymet_and_Aboretum.R script to find historic values for Arboretum, and the Point_Data.R script to make the line plots

## Figure 4
* Use ncks to extract the U10 and V10 variables from the total netCDF file at the DCA grid cell and ncra to average those variables over each hour
* Use ncrcat to contacenate the resulting files
* Use Point_Data.R and wd.py to make the wind roses for the modeled observations, and use Spatial_Averages_Wind.R for the historical observations

## Figure 5-7
* See instructions for table 1 to get the time-averaged netCDF files
* In Arc, use the Make NetCDF Table View tool (extracting T2, XLONG, and XLAT as columns, south_north and west_east as rows) and then the XY Event Layer tool to turn the table into a point layer
* Then use the IDW tool to get a raster for the domain. If the data is in Kelvin, convert it to Fahrenheit using Raster Calculator
* For figure 6, clip the raster to the Waterfront neighborhood
* Symbolize the plots according to their combined ranges

## Table 1
* Use ncks and ncra (-y max/min) to get time-averaged values for each grid cell and variable
* Use WDC_Nature_Stats.R to produce the table
