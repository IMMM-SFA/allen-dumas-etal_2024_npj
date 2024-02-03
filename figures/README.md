# Figure Recreation Instructions

## Overview
The majority of figures were created using the output netCDF files from WRF. The data for each figure was aggegated from the netCDF files using nco on a Linux server, and the resulting files were used in ArcMap, and R to create the visualizations. The initial output netCDF files from WRF used a 15 minute timestep.

## NetCDF File Preparation
The raw output files from WRF are in 15 minute intervals with files exisiting both before and after the study period. The times were shifted four hours to convert from Zulu time to Washington, D.C. time. For each simulation, the 960 files starting at 2010-07-01_04:00 and ending with 2010-07-11_03:45 were concatenated.

```
ls | ncrcat -o outfile.nc
```

The necessary variables and averages for each figure were pulled from each of these four "master" netCDF files.

### Variable Extraction
Use `ncks` to extract necessary variables for different figures. Extracted variables are below:

* "Times" - Timestep
* "XLONG" - Longitude
* "XLAT" - Latitude
* "T2" - Temperature (Kelvin)
* "QVAPOR" - Specific humidity
* "PSFC" - Surface pressure
* "U10" - U-component of wind at 10m height
* "V10" - V-component of wind at 10m height
* "HFX" - Sensible heat flux
* "LH" - Latent heat flux
* "PBLH" - Planetary boundary layer height

```
ncks -v variable_1,variable_2 inputfile.nc outputfile.nc
```

### Point Location Extraction
For figures focused on point comparisons at DCA and the National Arboretum (Fig 2, SI Figs A5, A7, SI Table A5), the grid cells for each location were extracted. 

```
ncks -d south_north,67,67 -d west_east,74,74 inputfile.nc outputfile_arboretum.nc
ncks -d south_north,41,41 -d west_east,54,54 inputfile.nc outputfile_dca.nc
```

### Time-Averaging
For figures that show the average, minimum, and/or maximum value per grid cell (Fig 3, Table 1, SI Figs A2-A3, SI Table A2), use the `ncra` function. 

```
ncra inputfile.nc outputfile_avg.nc 
ncra -y max inputfile.nc outputfile_max.nc 
ncra -y min inputfile.nc outputfile_min.nc 
```

### Spatial-Averaging
For figures that show the hourly or daily average, minimum, and/or maximum value across all grid cells (Figs 2, 4-5, Table 2, SI Figs A5-A8, SI Tables A4-A5), several different scripts can be used: epvars.water2015d03.csv.ncl and the various bash scripts. The bash scripts will use `ncra` to average across timesteps, producing hourly or daily files that can then be concatenated. The ncl script is used to calculate relative humidity and/or wind speed, and can be modified depending on how many grid cells or time steps are needed for a given figure. Note: For maximum and minimum relative humidity plots, either time- or spatially-averaged, the ncl script should be used to calculate relative humidity at 15 minute time steps to get more accurate results.

SI Fig A6 requires one additional step which is the use of `ncwa` to get one value for each day.

```
ncwa -O -a south_north,west_east inputfile.nc outputfile.nc
```

## Figure Creation
All line plots, tables, and wind roses were created using the R scripts included in this directory. `bias.R` is used for SI Fig A7 and SI Table A5. `HI_socio.R` uses the files found in the "socio_data" directory to create Fig 4-5, Table 2, SI Figs A7-A8, and SI Table A4.  `HI.R` is used for figures 4-5, Table 2, SI Figs A7-A8, and SI Table A4. `PBLH.R` is used for SI Fig A6. `pointcomparison.R` is used for Fig 2. `RH.R` is used to create average, maximum, and minimum relative humidity values by grid cell. `summarystats.R` is used for Table 1 and SI Table A2. `windroses.R` is used for SI Fig A5. 

The spatial figures (Fig 3, SI Figs A2-A4) were created in ArcGis Pro. CSVs and netCDF files from the netCDF file preparation were converted to point layers, and then the IDW tool was used to create rasters. Raster calculator was used to convert from Kelvin to Fahrenheit if necessary, and symbologies were created and shared between each set of figures.

| Figure/Table | NetCDF Preparation | Script|
| --- | --- | --- |
| Figure 2 | Point location extraction & spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `dailyextract.sh`, `pointcomparison.R` |
| 3 | Time-averaging | ArcGIS |
| 4 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `HI_socio.R`, `HI.R` |
| 5 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `HI_socio.R`, `HI.R` |
| Table 1 | Time-averaging | `epvars.water2015d03.csv.ncl`, `summarystats.R` | 
| 2 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `HI_socio.R`, `HI.R`|
| SI Figure A2 | Time-averaging | ArcGIS |
|  A3 | Time-averaging | ArcGIS |
|  A4 | Time-averaging | `epvars.water2015d03.csv.ncl`, ArcGIS |
|  A5 | Point location extraction & spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `windroses.R` |
|  A6 | Spatial-averaging | `PBLH_15.sh`, `PBLH.R` |
|  A7 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `bias.R` |
|  A8 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `HI_socio.R`, `HI.R` |
| SI Table A2 | Time-averaging | `epvars.water2015d03.csv.ncl`, `summarystats.R` |
| A4 | Spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `HI_socio.R`, `HI.R`|
| A5 | Point location extraction & spatial-averaging | `epvars.water2015d03.csv.ncl`, `hourlyextract.sh`, `bias.R`|
