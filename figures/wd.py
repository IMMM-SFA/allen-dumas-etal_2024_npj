import pandas as pd
from metpy import calc
from metpy.units import units

ten = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\NetCDF\dca_avhr_uv\uvten.csv")
u_t = units.Quantity(pd.Series.tolist(ten['dca.u.t']), "m/s")
v_t = units.Quantity(pd.Series.tolist(ten['dca.v.t']), "m/s")

hundred = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\NetCDF\dca_avhr_uv\uvhundred.csv")
u_h = units.Quantity(pd.Series.tolist(hundred['dca.u.h']), "m/s")
v_h = units.Quantity(pd.Series.tolist(hundred['dca.v.h']), "m/s")

nudapt = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\uvnudapt.csv")
u_nudapt = units.Quantity(pd.Series.tolist(nudapt['dca.u.nudapt']), "m/s")
v_nudapt = units.Quantity(pd.Series.tolist(nudapt['dca.v.nudapt']), "m/s")
     
nobldg = pd.read_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\uvnobldg.csv")
u_nobldg = units.Quantity(pd.Series.tolist(nobldg['dca.u.nobldg']), "m/s")
v_nobldg = units.Quantity(pd.Series.tolist(nobldg['dca.v.nobldg']), "m/s")

wd_t = calc.wind_direction(u_t, v_t)
wd_h = calc.wind_direction(u_h, v_h)
wd_nudapt = calc.wind_direction(u_nudapt, v_nudapt)
wd_nobldg = calc.wind_direction(u_nobldg, v_nobldg)

df_t = pd.DataFrame()
df_t['dca.u.t'] = ten['dca.u.t']
df_t['dca.v.t'] = ten['dca.v.t']
df_t['Wd.t'] = wd_t

df_h = pd.DataFrame()
df_h['dca.u.h'] = hundred['dca.u.h']
df_h['dca.v.h'] = hundred['dca.v.h']
df_h['Wd.h'] = wd_h

df_nudapt = pd.DataFrame()
df_nudapt['dca.u.nudapt'] = nudapt['dca.u.nudapt']
df_nudapt['dca.v.nudapt'] = nudapt['dca.v.nudapt']
df_nudapt['Wd.nudapt'] = wd_nudapt

df_nobldg = pd.DataFrame()
df_nobldg['dca.u.nobldg'] = nobldg['dca.u.nobldg']
df_nobldg['dca.v.nobldg'] = nobldg['dca.v.nobldg']
df_nobldg['Wd.nobldg'] = wd_nobldg

df_nudapt.to_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\NetCDF_new\NUDAPT_NetCDF\Time_Wind_DCA\nudaptwd.csv")
df_nobldg.to_csv(r"C:\Users\levis\OneDrive\Desktop\WDC_Nature\NetCDF_new\No_Buildings_NetCDF\Time_Wind_DCA\nobldgwd.csv")
