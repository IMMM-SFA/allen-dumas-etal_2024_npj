_your zenodo badge here_

# allen-dumas-etal_2023_urbansust

**Sensitivity of Mesoscale Modeling to the Resolution of Urban Morphological Feature Inputs: Implications for Characterizing Urban Sustainability**

Melissa R. Allen-Dumas<sup>1\*</sup>, Levi T. Sweet-Breu<sup>1,2</sup>, Christa M. Brelsford<sup>3</sup>, Linying Wang<sup>4</sup>, Joshua R. New<sup>5</sup>, Brett C. Bass<sup>5</sup>

<sup>1 </sup> Computational Sciences and Engineering Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

<sup>2 </sup> Department of Environmental Science, Baylor University, Waco, TX, 76798, USA.

<sup>3 </sup> Geospatial Science and Human Security Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

<sup>4 </sup> Arts and Sciences, Earth and Environment, Boston University, 685 Commonwealth Avenue, Boston, MA, 02215, USA.

<sup>5 </sup> Electrification and Energy Infrastructure Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN, 37831, USA.

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

For morphologies, inputs are only shapefiles.
- OpenDataDC (2021) Open Data DC. URL https://opendata.dc.gov/datasets

NARR (North American Reanalysis Dataset) - Input to WRF.
- Mesinger F, DiMego G, Kalnay E, et al (2006) North American Regional
Reanalysis. Bulletin of the American Meteorological Society 87(3):343–360

NUDAPT
- Ching J, Brown M, Burian S, et al (2009) National Urban Database and Access
Portal Tool. Bulletin of the American Meteorological Society 90(8):1157–
1168


### Output data

Morphologies from NATURF as inputs to WRF.  Swapped J. Ching inputs with NATURF inputs.

Allen-Dumas, M. (2024). WRF Output from 270m domain running simulation with no 3D morphology, NUDAPT 3D morphology, 100m resolution 3D morphology and 10m resolution 3D morphology (Version v3) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2283554

## Contributing modeling software
| Model | Version | Repository Link | DOI |
|-------|---------|-----------------|-----|
| NATURF | v0.0.0 | https://github.com/IMMM-SFA/naturf/tree/main | https://doi.org/10.11578/dc.20220803.4 |
| WRF | v4.1 | https://www2.mmm.ucar.edu/wrf/users/download/get_source.html | https://opensky.ucar.edu/islandora/object/opensky:2898 |

## Reproduce my experiment
NATURF v0.0.0 was used to calculate the urban parameters fed to WRF for this experiment. Documentation for NATURF can be found on [GitHub](https://github.com/IMMM-SFA/naturf/tree/main) or its [website](https://immm-sfa.github.io/naturf/).

## Reproduce my figures
Use the scripts found in the `figures` directory to reproduce the figures used in this publication.

| Script Name | Description |
| --- | --- |
| `bias.R` | Create figures for model bias |
| `pointcomparison.R` | Create figures for point observations at DCA and Arboretum |
| `PBLH.R` | Create spatially-averaged figures for PBLH values across domain |
| `summarystats.R` | Generate summary statistics, histograms, and Mann Whitney U Tests for time-averaged variables |
| `windroses.R` | Create figures wind data |
| `RH.R` | Create time-averaged humidity data |
| `HI.R` | Create files for heat index figures |
