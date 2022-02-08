import arcpy

arcpy.env.workspace = r"C:\Users\levis\OneDrive\Desktop\UrbClim_Figures\UrbClim_Figures.gdb"

in_netCDF_file = r"C:\Users\levis\OneDrive\Desktop\Urban Climate\Reanalysis\NetCDF Files\10daysavs10m\wrfout_d03_2010-07-01-10av_wdcav_10m.nc"
variable = ["XLAT","XLONG","T2"]
out_table_view = "tav_10m_table"
row_dimension = ["west_east","south_north"]
out_feature_class = "tav_10_point"
x_field = "XLONG"
y_field = "XLAT"
z_field = "T2"
out_IDW = "tav_10_C"
rec = r"C:\Users\levis\OneDrive\Desktop\SULI Terms\ORNL Summer\Examples\MattSeals_WDCmorphs\MattSeals_WDCmorphs\dc_buildings\building_shps\DC_Bldgs_Waterfront_2015\DC_Bldgs_Waterfront_2015_Heights.shp"
out_raster = "tav_10_C_Clip"
expression =  (out_raster + 273.15) * 9/5 + 32
final_raster = "tav_10_F"

arcpy.md.MakeNetCDFTableView(in_netCDF_file, variable, out_table_view, row_dimension)
arcpy.management.XYTableToPoint(out_table_view, out_feature_class, x_field, y_field, z_field)
"tav_10_C" = Idw(out_feature_class, z_field)
outIDW.save(out_IDW)
arcpy.management.Clip(out_IDW, rectangle, out_raster)

RasterCalculator((out_raster + 273.15) * 9/5 + 32, final_raster)