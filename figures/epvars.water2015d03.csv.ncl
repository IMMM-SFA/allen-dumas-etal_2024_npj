load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  diri   = "./"
  fili  = "wrfout_d03_2010-07-01-10cat_wdcav_100m.nc"
  f      = addfile(diri+fili, "r")

  Temp   = f->T2(:,:,:)
  Pres   = f->PSFC
  U      = f->U10
  V      = f->V10
  QVapor = f->QVAPOR(:,0,:,:)
 ; LWRad  = f->GLW
 ; SWRad  = f->SWDOWN
 ; SWNorm = f->SWNORM
 ; RadDir = f->SWDDIR
 ; RadDif = f->SWDDIF
 ; Snow   = f->SNOWH
 ; SnowDp = 100.*Snow
 ; Rainc  = f->RAINC
 ; Rainnc = f->RAINNC
 ; RainMon = Rainc+Rainnc
 ; elev = f->HGT
  time   = tostring(f->Times)
  lat    = f->XLAT(0,:,:)
  lon    = f->XLONG(0,:,:)

  WSpd = new(dimsizes(U),typeof(U),"No_FillValue")
  WDir = new(dimsizes(U),typeof(U),"No_FillValue")
  RH = new(dimsizes(QVapor),typeof(QVapor),"No_FillValue")
 ; TDp = new(dimsizes(QVapor),typeof(QVapor),"No_FillValue")
 ; RainDp = new(dimsizes(RainMon),typeof(RainMon),"No_FillValue")
 ; SnowDp = new(dimsizes(Snow),typeof(Snow),"No_FillValue")

  printVarSummary(WSpd)
 ; printVarSummary(WDir)
 ; printVarSummary(RH)
 ; printVarSummary(TDp)
 ; printVarSummary(RainDp)
 ; printVarSummary(SnowDp)

 ; r2d = 45.0/atan(1.0)
  WSpd = sqrt((U*U)+(V*V))
  WDir = atan2(U,V)*r2d+180
 ; ;SnowDp = 100*Snow
  RH = relhum(Temp,QVapor,Pres)
  RH = RH < 100
 ; TDp = Temp-((100-RH)/5)

  ;print(time(0:24))

  ;print(Temp(180:190,6:7,11))
  ;print(Pres(180:190,6:7,11))
  print("got to here (2)")
  ;print("oid,lat,lon,temp")

  ;rlat = (/38.8472/)
  ;rlon = (/-77.03454/)

  ;nm = getind_latlon2d(lat,lon,rlat,rlon)
  ;print(nm)

  ;do p=0,dimsizes(rlat)-1
  ;  n = nm(p,0)
  ;  m = nm(p,1)
  ;  print(lat(n,m)+" "+lon(n,m))
  ;end do

  print("got to here (2.5)")

  k=0
  fname = "wind_rh_d03_water2015_10m_2010-07-01-100.csv"
  npts = 1*120*100  ;numtimes*numlats*numlons
   data = new(npts, "string")
   npt = -1
  ; do k=0 ;k=0,962   ;time loop
    do j=0,119    ;lat loop 
      do i=0,99   ;lon loop 
        npt = npt+1

        data(npt) = sprinti("%6.0i",(npt+1))+","
        ;data(npt) = sprinti("%6.0i",((k/24)+1))+","
        ;data(npt) = data(npt) + time(k)+ ","
        data(npt) = data(npt) + sprintf("%10.6f ",lat(j,i))+","
        data(npt) = data(npt) + sprintf("%10.6f ",lon(j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",Temp(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",TDp(k,j,i))+","
        data(npt) = data(npt) + sprintf("%10.6f ",RH(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",Pres(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",RadDir(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",RadDif(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",LWRad(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",SWNorm(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",SWRad(k,j,i))+","
         data(npt) = data(npt) + sprintf("%10.6f ",WDir(k,j,i))+","
         data(npt) = data(npt) + sprintf("%10.6f ",WSpd(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",SnowDp(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",RainDp(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",U(k,j,i))+","
        ;data(npt) = data(npt) + sprintf("%10.6f ",V(k,j,i))+","      
       end do
     end do
   ; print("k=" +k)
   ; end do
   print("got to here (3)")
   asciiwrite(fname, data)
   print("find text file: " +fname)
