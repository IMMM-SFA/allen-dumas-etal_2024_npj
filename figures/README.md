# Figure Recreation Instructions

## Overview
The majority of figures were created using the output netCDF files from WRF. The data for each figure was aggegated from the netCDF files using nco on a Linux server, and the resulting files were used in ArcMap, Python, and R to create the visualizations.


## Figure 3
For the daily-averaged temperature data:
* Extract the temperature and time variable from the total netCDF file (ncks -v T2,Times)
* Find the daily maximum, minimum, and average value for each cell (ncra (-y max/min) -d Time,0,23) and each day. The timesteps will change depending on which day and the timestep of the input file.
* Concatenate the resulting files (ncrcat -o)
* Use Point_Dat.R and Daymet_and_Arboretum.R to make the line plots

For the daily-averaged humidity data:
