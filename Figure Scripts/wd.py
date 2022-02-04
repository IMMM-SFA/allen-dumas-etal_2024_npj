import pandas as pd
from math import atan, pi
from metpy import calc
from metpy.units import units

ten = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\Urban Climate\Reanalysis\NetCDF Files\spuvhrly10m\uvten.csv")
u_t = units.Quantity(pd.Series.tolist(ten['Uten.t']), "m/s")
v_t = units.Quantity(pd.Series.tolist(ten['Vten.t']), "m/s")

hundred = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\Urban Climate\\Reanalysis\NetCDF Files\spuvhrly100m\uvhundred.csv")
u_h = units.Quantity(pd.Series.tolist(hundred['Uten.h']), "m/s")
v_h = units.Quantity(pd.Series.tolist(hundred['Vten.h']), "m/s")
'''
def windDir(u,v):
    for value in u:
        for num in v:
            if v > 0:
                (180 / pi) * atan(u/v) + 180
            elif u < 0 and v < 0:
                (180 / pi) * atan(u/v) + 0
            elif u > 0 and v < 0:
                (180 / pi) * atan(u/v) + 360

wd_t = windDir(u_t, v_t)  
'''      
wd_t = calc.wind_direction(u_t, v_t)
wd_h = calc.wind_direction(u_h, v_h)

df_t = pd.DataFrame()
df_t['Uten.t'] = ten['Uten.t']
df_t['Vten.t'] = ten['Vten.t']
df_t['Wd.t'] = wd_t

df_h = pd.DataFrame()
df_h['Uten.h'] = hundred['Uten.h']
df_h['Vten.h'] = hundred['Vten.h']
df_h['Wd.h'] = wd_h
df_t.to_csv('tenwd.csv')
df_h.to_csv('hundredwd.csv')
