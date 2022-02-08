import pandas as pd
from metpy import calc
from metpy.units import units

ten = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\Urban Climate\Reanalysis\NetCDF Files\dcauvhrly\uvten.csv")
u_t = units.Quantity(pd.Series.tolist(ten['dca.u.t']), "m/s")
v_t = units.Quantity(pd.Series.tolist(ten['dca.v.t']), "m/s")

hundred = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\Urban Climate\\Reanalysis\NetCDF Files\dcauvhrly\uvhundred.csv")
u_h = units.Quantity(pd.Series.tolist(hundred['dca.u.h']), "m/s")
v_h = units.Quantity(pd.Series.tolist(hundred['dca.v.h']), "m/s")
     
wd_t = calc.wind_direction(u_t, v_t)
wd_h = calc.wind_direction(u_h, v_h)

df_t = pd.DataFrame()
df_t['dca.u.t'] = ten['dca.u.t']
df_t['dca.v.t'] = ten['dca.v.t']
df_t['Wd.t'] = wd_t

df_h = pd.DataFrame()
df_h['dca.u.h'] = hundred['dca.u.h']
df_h['dca.v.h'] = hundred['dca.v.h']
df_h['Wd.h'] = wd_h
df_t.to_csv('tenwd.csv')
df_h.to_csv('hundredwd.csv')
