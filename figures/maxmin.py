import pandas as pd
import os

direc = 'C:/Users/levis/OneDrive/Desktop/WDC_Nature/NetCDF_new/No_Buildings_NetCDF/Time_Hourly_Humidity'
infile = 'wdc_hrly_rh_2010-07-01-10_nobldg.csv'
outfile = 'rh_nobldg_daily_DC.csv'
step = 12000

data = pd.read_csv(os.path.join(direc, infile), names = ["Lat", "Long", "rh"], usecols = [1,2,3])

newdf = data.sort_values('Lat')
newdf = newdf.reset_index()

temp = newdf.groupby(newdf.index // step) 

df_max = temp.max()
df_min = temp.min()
df_avg = temp.mean()

df_max.to_csv(os.path.join(direc, "max_" + outfile))
df_min.to_csv(os.path.join(direc, "min_" + outfile))
df_avg.to_csv(os.path.join(direc, "avg_" + outfile))
