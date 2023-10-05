_your zenodo badge here_

# allen-dumas-etal_2023_urbansust

**Sensitivity of Mesoscale Modeling to the Resolution of Urban Morphological Feature Inputs: Implications for Characterizing Urban Sustainability**

Melissa R. Allen-Dumas<sup>1\*</sup>, Levi T. Sweet-Breu<sup>1</sup>, Christa M. Brelsford<sup>2</sup>, Linying Wang<sup>3</sup>, Joshua R. New<sup>3</sup>, Brett C. Bass<sup>3</sup>

<sup>1 </sup> Computational Sciences and Engineering Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

<sup>2 </sup> Geospatial Science and Human Security Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

<sup>3 </sup> Arts and Sciences, Earth and Environment, Boston University, 685 Commonwealth Avenue, Boston, MA, 02215, USA.

<sup>4 </sup> Electrification and Energy Infrastructure Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

\* corresponding author:  allenmr (at) ornl.gov

## Abstract
As researchers seek to understand the urban-scale impacts of future climate change, the numerical weather prediction community is challenged with modeling multi-scale interactions among the atmosphere, human systems and the overall earth system within model simulations using physics-based mathematical representations of meteorological processes. High resolution representation of buildings in particular within these models have been used to provide turbulence-inducing impediments to air flow along with differences in diurnal shading of various structures within urban areas. For questions around neighborhood level urban sustainability under the most extreme climate change scenarios, especially for neighborhoods with compound vulnerabilities, more explicit representation of surface terrain in these models has become necessary. While a great body of work has examined the differences in error and uncertainty of simulations at various horizontal grid resolutions, no studies have been performed that compare the results of running the models at the same horizontal grid resolution but with different resolutions of embedded urban neighborhood morphology. We examine the differences in meteorological output from the Weather Research and Forecasting (WRF) model run at 270m horizontal resolution using 10m, 100m and 1 km resolution neighborhood morphological inputs and with no morphological inputs. We find that horizontal resolution differences in urban morphological inputs to numerical weather models result in model output differences, especially in the spatial variability of meteorological parameters. \We show that these results affect how we determine the spatial heterogeneity of human vulnerability to a heat wave across an urban area.

## Journal reference
TBD

## Code reference
In main branch:  https://github.com/IMMM-SFA/naturf/tree/main

Ingests shapefiles and turns them into inputs for WRF.
Generated both 10 and 100-meter morphologies.


## Data reference

### Input data
Reference for each minted data source for your input data.  For example:

For morphologies, inputs are only shapefiles.
- Get citations from authors

NARR (North American Reanalysis Dataset) - Input to WRF.
- Need citations


### Output data
Reference for each minted data source for your output data.  For example:

Morphologies from NATURF as inputs to WRF.  Swapped J. Ching inputs with NATURF inputs.

Allen-Dumas, M. (2023). WRF Output from 270m domain running simulation with no 3D morphology, NUDAPT 3D morphology, 100m resolution 3D morphology and 10m resolution 3D morphology (Version v2) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2001265

## Contributing modeling software
| Model | Version | Repository Link | DOI |
|-------|---------|-----------------|-----|
| NATURF | v0.0.0 | https://github.com/IMMM-SFA/naturf/tree/main | link to DOI dataset |
| WRF | v4.1 | https://www2.mmm.ucar.edu/wrf/users/download/get_source.html | link to DOI dataset |

## Reproduce my experiment
Fill in detailed info here or link to other documentation that is a thorough walkthrough of how to use what is in this repository to reproduce your experiment.


1. Install the software components required to conduct the experiement from [Contributing modeling software](#contributing-modeling-software)
2. Download and install the supporting input data required to conduct the experiement from [Input data](#input-data)
3. Run the following scripts in the `workflow` directory to re-create this experiment:

| Script Name | Description | How to Run |
| --- | --- | --- |
| `step_one.py` | Script to run the first part of my experiment | `python3 step_one.py -f /path/to/inputdata/file_one.csv` |
| `step_two.py` | Script to run the last part of my experiment | `python3 step_two.py -o /path/to/my/outputdir` |

4. Download and unzip the output data from my experiment [Output data](#output-data)
5. Run the following scripts in the `workflow` directory to compare my outputs to those from the publication

| Script Name | Description | How to Run |
| --- | --- | --- |
| `compare.py` | Script to compare my outputs to the original | `python3 compare.py --orig /path/to/original/data.csv --new /path/to/new/data.csv` |

## Reproduce my figures
Use the scripts found in the `figures` directory to reproduce the figures used in this publication.

| Script Name | Description |
| --- | --- |
| `Daymet_and_Arboretum.R` | Create variables for historical data |
| `Point_Data.R` | Create figures for point observations at DCA and Arboretum |
| `PBLH.R` | Create spatially-averaged figures for PBLH values across domain |
| `WDC_Nature_Stats.R` | Generate summary statistics, histograms, and Mann Whitney U Tests for time-averaged variables |
| `Spatial_Averages_Wind.R` | Create variables for historical wind data |
| `maxmin.py` | Create time-averaged humidity data |
| `wd.py` | Calculate spatially-averaged wind direction in conjunction with other scripts |
