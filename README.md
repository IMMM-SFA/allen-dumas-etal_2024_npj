_your zenodo badge here_

# allen-dumas-etal_2021_urbsust

**Sensitivity of Mesoscale Modelling to the Resolution of Urban Morphological Feature Inputs**

Melissa R. Allen-Dumas<sup>1\*</sup>, Levi T. Sweet-Breu<sup>1</sup>, Christa M. Brelsford<sup>2</sup>, Joshua R. New<sup>3</sup>, Brett C. Bass<sup>3</sup>

<sup>1 </sup> Computational Sciences and Engineering Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN. 37831

<sup>2 </sup> Geospatial Science and Human Security Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN 37831

<sup>3 </sup> Electrification and Energy Infrastructure Division, Oak Ridge National Laboratory, OneBethel Valley Road, Oak Ridge, TN 37831

\* corresponding author:  allenmr (at) ornl.gov

## Abstract
As the numerical weather prediction community seeks deeper understanding of multi-scale interactions among the atmosphere, human systems and the overall earth system, more explicit representation of surface terrain in these models has become necessary. While a great body of work has examined the differences in error and uncertainty of simulations at various horizontal grid resolutions, no studies have been performed that compare the results of running the models at the same horizontal grid resolution but with different resolutions of embedded urban neighborhood morphology. We examine the differences in meteorological output from the Weather Research and Forecasting (WRF) model run at 270m horizontal resolution using 10m resolution neighborhood morphological inputs and 100m resolution inputs. We find that that horizontal resolution differences in urban morphological inputs to numerical weather models result in model output differences, especially in the spatial variability of micrometeorological parameters.

## Journal reference
TBD

## Code reference
In NATURF2 branch:  https://code.ornl.gov/mrp/im3_ornl

Ingests shapefiles and turns them into inputs for WRF.
Generated both 10 and 100-meter morphologies.


## Data reference

### Input data
Reference for each minted data source for your input data.  For example:

For morphologies, inputs are only shapefiles.
- Get citations from authors

NAR (North American Reanalysis Dataset) - Input to WRF.
- Need citations


### Output data
Reference for each minted data source for your output data.  For example:

Morphologies from NATURF as inputs to WRF.  Swapped J. Ching inputs with NATURF inputs.

Human, I.M. (2021). My output dataset name [Data set]. DataHub. https://doi.org/some-doi-number

## Contributing modeling software
| Model | Version | Repository Link | DOI |
|-------|---------|-----------------|-----|
| NATURF | version | link to code repository | link to DOI dataset |
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
| `Spatial_Averages_Avg.R` | Create spatially-averaged figures for average values across domain |
| `Spatial_Averages_Max.R` | Create spatially-averaged figures for maximum values across domain |
| `Spatial_Averages_Min.R` | Create spatially-averaged figures for minimum values across domain |
| `Spatial_Averages_Wind.R` | Create spatially-averaged figures for wind roses across domain |
| `Time_Averages.py` | List of tools used to create time-averaged figures |
| `wd.py` | Calculate spatially-averaged wind direction in conjunction with other scripts |
