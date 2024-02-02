library(tidyverse)
library(tmap)
library(dplyr)

library(sjPlot)
library(sjmisc)
library(sjlabelled)


options(tigris_use_cache = TRUE)

#cbsa_xwalk <- get.cbsa_xwalk(reload = FALSE)
#saveRDS(cbsa_xwalk, file = "Data/cbsa_xwalk.rds")
cbsa_xwalk <- read.csv("C:/Users/levis/Downloads/cbsa_county_crosswalk.csv")

cbsa.data <- function(cbsa.code,short.name){
  
  #cbsa_xwalk <- get.cbsa_xwalk()
  
  counties.list <- as.list(cbsa_xwalk %>% dplyr::filter(cbsa_geoid == cbsa.code) %>% dplyr::select(countyfp))
  City.Name <- cbsa_xwalk[cbsa_xwalk$cbsa_geoid == cbsa.code,7][1]
  
  if(missing(short.name)) {
    short.name <- stringr::str_replace_all(
      stringr::word(City.Name, 1, -3), "[^[:alnum:]]", "")
    
  }
  
  counties.string <- paste0("('", paste(unlist(counties.list), collapse = "','"), "')") 
  
  city <- list("City.Name" = City.Name,
               "file" = short.name,
               "cbsa.code" = cbsa.code, 
               "counties.list" = counties.list, 
               "counties.string" = counties.string)
  
  return(city)
}

get_sm_geo <- function(city, geo_level = "tract"){
  
  #can choose tract, cbg, block
  
  focal_counties <- sort(city$counties.list$countyfp)
  lfc = length(focal_counties)
  c = focal_counties[1]
  
  geo <- tidycensus::get_decennial(geography = geo_level,
                                   county = substr(c,3,5),
                                   state = substr(c,1,2),
                                   variables = "P1_001N",
                                   year = 2020, 
                                   geometry = TRUE)
  
  if (lfc > 1){
    for (i in seq(2:lfc)){
      c = focal_counties[i]
      print(c)
      geo2 <- tidycensus::get_decennial(geography = geo_level,
                                        county = substr(c,3,5),
                                        state = substr(c,1,2),
                                        variables = "P1_001N",
                                        year = 2020, 
                                        geometry = TRUE)
      geo = bind_rows(geo,geo2)
    }
  }
  
  geo<- geo %>% rename(pop = value)
  return (geo)
}

read_levi <- function(content,building_scale,geo_scale,date_time,source_date="May_11"){
  if (content == "Temp"){
    filestub = paste0("D:/Out/Christa_",source_date,"/Temperature/Temp")
  } else
    if(content == "HI"){
      filestub = paste0("D:/Out/Christa_",source_date,"/Temperature/HI")
    } else {
      print("Content must be 'Temp' or 'HI' " )
    }
  
  if (date_time == "06"){
    dt = "07062010_0500"
    pf = "worst.morn"
  }
  if (date_time == "07"){
    dt = "07072010_2200"
    pf = "worst.night"
  }
  
  
  filename = paste(filestub,dt,building_scale, geo_scale, sep = "_")
  filename = paste0(filename,".csv")
  print(paste(filename, "exists:", file.exists(filename)))
  
  df <- readr::read_csv(filename)
  
  vn = paste(pf, content,building_scale, sep = ".")
  vn.std = paste0(vn,".STD")
  
  
  df <- df  %>%
    mutate(GEOID = as.character(GEOID10)) %>% 
    select(one_of(c("GEOID", "MEAN", "STD"))) %>% 
    rename( {{vn}} := MEAN,
            {{vn.std}} := STD)
  
  return(df)
}


DC_tracts.20 <- tidycensus::get_decennial(geography = "tract",
                                          county = 001,
                                          state = 11,
                                          variables = "P1_001N",
                                          year = 2020, 
                                          geometry = TRUE) %>% 
  rename(pop = value) %>% select(!one_of("NAME","variable"))


DC_tracts.10 <- tigris::tracts(county = 001,
                               state = 11,
                               year = 2010, 
                               cb = TRUE) %>%
  mutate(GEOID = paste0(STATE, COUNTY, TRACT))  %>% select(one_of("GEOID"))

#sf::st_write(DC_tracts.10, "output/DC_Tracts_2010.shp", append = FALSE)

DC.city  = cbsa.data("47900", "dc")

focal_counties <- DC.city$counties.list$countyfp


#get county geometries for focal area.  If this is too high resolution geometry, we could use a coarser approximation. 
DC_counties <- tidycensus::get_acs("county",
                                   variables ="B01001_001E",
                                   year = 2019,
                                   output = "tidy",
                                   geometry = TRUE) %>% 
  dplyr::select(-moe,-variable) %>%
  dplyr::rename(pop.county = estimate) %>% 
  filter(GEOID %in% focal_counties)



svi_DC <- readr::read_csv("C:/Users/levis/Downloads/DistrictofColumbia (1).csv") %>% 
  mutate(FIPS = as.character(FIPS)) %>%
  filter(STCNTY %in% focal_counties) %>% 
  dplyr::select(contains("RPL_") | contains("FIPS"))

svi_VA <- readr::read_csv("C:/Users/levis/Downloads/Virginia.csv") %>% 
  mutate(FIPS = as.character(FIPS)) %>%
  filter(STCNTY %in% focal_counties) %>% 
  dplyr::select(contains("RPL_") | contains("FIPS"))

svi_WV <- readr::read_csv("C:/Users/levis/Downloads/WestVirginia.csv") %>% 
  mutate(FIPS = as.character(FIPS)) %>%
  filter(STCNTY %in% focal_counties) %>% 
  dplyr::select(contains("RPL_") | contains("FIPS"))

svi_MD <- readr::read_csv("C:/Users/levis/Downloads/Maryland.csv") %>% 
  mutate(FIPS = as.character(FIPS)) %>%
  filter(STCNTY %in% focal_counties) %>% 
  dplyr::select(contains("RPL_") | contains("FIPS"))



svi_DC.msa.20 <- bind_rows(svi_DC,svi_VA) %>% bind_rows(svi_WV) %>% bind_rows(svi_MD)
rm(svi_VA,svi_WV,svi_MD)


svi_DC.msa.10 <- readr::read_csv("C:/Users/levis/Downloads/SVI_2010_US.csv") %>%
  dplyr::filter(STCOFIPS %in% focal_counties) %>%
  dplyr::select(one_of(c("FIPS","STCOFIPS","E_TOTPOP", "R_PL_THEME1", "R_PL_THEME2", "R_PL_THEME3", "R_PL_THEME4", "R_PL_THEMES"))) %>%
  dplyr::rename("RPL_THEME1" = "R_PL_THEME1", "RPL_THEME2" = "R_PL_THEME2", "RPL_THEME3" = "R_PL_THEME3", "RPL_THEME4" = "R_PL_THEME4", "RPL_THEME5" = "R_PL_THEMES", "pop" = "E_TOTPOP")

DC_tracts.10 <- left_join(DC_tracts.10, svi_DC.msa.10, by = c("GEOID" = "FIPS")) %>% 
  mutate(RPL_THEME5 = na_if(RPL_THEME5, -999),
         RPL_THEME4 = na_if(RPL_THEME4, -999),
         RPL_THEME3 = na_if(RPL_THEME3, -999),
         RPL_THEME2 = na_if(RPL_THEME2, -999),
         RPL_THEME1 = na_if(RPL_THEME1, -999))

DC_tracts.20<- left_join(DC_tracts.20, svi_DC.msa.20, by = c("GEOID" = "FIPS")) %>% 
  mutate(RPL_THEMES = na_if(RPL_THEMES, -999),
         RPL_THEME4 = na_if(RPL_THEME4, -999),
         RPL_THEME3 = na_if(RPL_THEME3, -999),
         RPL_THEME2 = na_if(RPL_THEME2, -999),
         RPL_THEME1 = na_if(RPL_THEME1, -999))



#tract SVI
tmap::tmap_mode("view") #sets an interactive map; change to "plot" for static
map.20 <- tmap::tm_shape(DC_tracts.20) + 
  tmap::tm_polygons("RPL_THEMES",lwd = 1, title = "CDC SVI", midpoint = NA, palette = "Purples", alpha = 0.5) + 
  tmap::tm_shape(DC_counties) + tm_borders() +
  tmap::tm_layout(title = "Washington DC SVI, 2020 SVI",legend.show=TRUE)

map.20


tmap::tmap_mode("plot")
map.10 <- tmap::tm_shape(DC_tracts.10) + 
  tmap::tm_polygons("RPL_THEME4",lwd = 1, title = "CDC SVI", midpoint = NA, palette = "Purples", alpha = 0.5) + 
  tmap::tm_shape(DC_counties) + tm_borders() +
  tmap::tm_layout(title = "Washington DC, 2010 SVI",legend.show=TRUE)

map.10



for (c in c("Temp", "HI")){
  for (bs in c("10m", "100m", "nobldg", "nudapt")){
    for (day in c("06", "07")){
      df.10 <- read_levi(c, bs, "Tracts", day, source_date = "Jan_18")
      DC_tracts.10 <- DC_tracts.10 %>% left_join(df.10)
      #df.20 <- read_levi(c, bs, "Tracts", day, source_date = "Jan_23")
      #DC_tracts.20 <- DC_tracts.20 %>% left_join(df.20)
    }
  }  
}



###########
## Map Series for all of Levi's data
############

map_breaks <- c(75,76,77,78,79,80,81,82,83,84,85)

map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("worst.morn.Temp.nobldg", "worst.morn.Temp.nudapt", "worst.morn.Temp.100m", "worst.morn.Temp.10m") ,
                    lwd = 0, 
                    midpoint = NA, palette = "-Spectral", breaks = map_breaks) + 
  tmap::tm_layout(title = c("No Bldg",  "NUDAPT", "100m", "10m"),legend.show=FALSE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_morn_Temp.pdf")

map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("worst.morn.HI.nobldg", "worst.morn.HI.nudapt", "worst.morn.HI.100m", "worst.morn.HI.10m") ,
                    lwd = 0, title = c("No Bldg",  "NUDAPT", "100m", "10m"), 
                    midpoint = NA, palette = "-Spectral", breaks = map_breaks) + 
  tmap::tm_layout(title = c("No Bldg",  "NUDAPT", "100m", "10m"),legend.show=FALSE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_morn_HI.pdf")


map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("worst.night.Temp.nobldg", "worst.night.Temp.nudapt", "worst.night.Temp.100m", "worst.night.Temp.10m") ,
                    lwd = 0, title = c("No Bldg",  "NUDAPT", "100m", "10m"), 
                    midpoint = NA, palette = "-Spectral", breaks = map_breaks) + 
  tmap::tm_layout(title = c("No Bldg",  "NUDAPT", "100m", "10m"),legend.show=FALSE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_night_Temp.pdf")


map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("worst.night.HI.nobldg", "worst.night.HI.nudapt", "worst.night.HI.100m", "worst.night.HI.10m") ,
                    lwd = 0, title = c("No Bldg",  "NUDAPT", "100m", "10m"), 
                    midpoint = NA, palette = "-Spectral", breaks = map_breaks) + 
  tmap::tm_layout(title = c("No Bldg",  "NUDAPT", "100m", "10m"),legend.show=FALSE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_night_HI.pdf")



map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("worst.morn.Temp.nobldg") ,
                    lwd = 0, title = "Temp/Heat Index",
                    midpoint = NA, palette = "-Spectral", breaks = map_breaks) + 
  tmap::tm_layout(legend.only=TRUE)
map

tmap::tmap_save(map, "output/DC_legend.pdf")


###########
## Map Series for SVI data
############


map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons(c("RPL_THEME1", "RPL_THEME2","RPL_THEME3","RPL_THEME4") ,
                    lwd = 0, title = c("Theme 1: SES", "Theme 2: Age/Lang", "Theme 3: Race","Theme 4: Housing"), 
                    palette = list("Greens","Oranges", "Purples", "Blues"), breaks = c(0,0.2,0.4,0.6,0.8,1)) + 
  tmap::tm_layout(legend.show=TRUE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_SVI_2010.pdf")


map <- tmap::tm_shape(DC_tracts.10 %>% filter(substr(GEOID,1,5)== "11001")) + 
  tmap::tm_polygons("RPL_THEME5", lwd = 0, title = "Summary", 
                    palette = "Greys", breaks = c(0,0.2,0.4,0.6,0.8,1)) + 
  tmap::tm_layout(legend.show=FALSE, frame = FALSE)
map

tmap::tmap_save(map, "output/DC_SVI_summary_2010.pdf")



#plot by:  temp/HI; scale: 10m, 100m, nudapt, nobldgs; SVI Theme 1:S; 

for (c in c("Temp", "HI")){
  for (bs in c("10m", "100m", "nobldg", "nudapt")){
    for (pf in c("worst.night", "worst.morn")){
      vn = paste(pf, c,bs, sep = ".")
      ggplot(DC_tracts.10,aes(x = RPL_THEME4, y = worst.night.Temp.nudapt))+geom_point()
      
    }
  }  
}



fig <- ggplot(DC_tracts.10,aes(x = RPL_THEME4, y = worst.night.Temp.nudapt))+geom_point()
fig

pf = "worst.night"
c = "HI"
bs = "10m"
vn = paste(pf, c,bs, sep = ".")

vn

ggplot(DC_tracts.10,aes_string(x = "RPL_THEME4", y = vn))+geom_point()


cols <- c("SES" = "mediumseagreen", "Age/Disability" = "salmon2", "Race/Lang" = "mediumpurple", "Housing" = "cadetblue3")

ggplot(DC_tracts.10,aes(y = worst.night.HI.10m))+
  geom_smooth(aes(y = worst.night.HI.10m, x = RPL_THEME1, color = "SES"), method = "lm")+
  geom_smooth(aes(y = worst.night.HI.10m, x = RPL_THEME2, color = "Age/Disability"), method = "lm")+
  geom_point(aes(x = RPL_THEME1, color = "SES"))+
  geom_point(aes(x = RPL_THEME2, color = "Age/Disability"))+
  theme_minimal()+labs(x = "Social Vulnerability Index", y = "Heat Index")+scale_color_manual(values = cols)

ggsave("output/SVI_T1_T2_2010.pdf", width = 8, height = 5, units = "in")


ggplot(DC_tracts.10,aes(y = worst.night.HI.10m))+
  geom_point(aes(x = RPL_THEME3, color = "Race/Lang"))+
  geom_point(aes(x = RPL_THEME4, color = "Housing"))+
  geom_smooth(aes(y = worst.night.HI.10m, x = RPL_THEME3, color = "Race/Lang"), method = "lm")+
  geom_smooth(aes(y = worst.night.HI.10m, x = RPL_THEME4, color = "Housing"), method = "lm")+
  theme_minimal()+labs(x = "Social Vulnerability Index", y = "Heat Index") +scale_color_manual(values = cols)

ggsave("output/SVI_T3_T4_2010.pdf", width = 8, height = 5, units = "in")

result = data_frame(metric = factor(), scale = factor(), date = factor(), RPL_THEME = factor(), 
                    intercept = numeric(), intercept.std = numeric(), slope = numeric(), slope.std = numeric())

for (c in c("Temp", "HI")){
  for (bs in c("10m", "100m", "nobldg", "nudapt")){
    for (pf in c("worst.night", "worst.morn")){
      for (rt in c("RPL_THEME1", "RPL_THEME2", "RPL_THEME3", "RPL_THEME4", "RPL_THEME5")){
        vn = paste(pf, c,bs, sep = ".")
        slm = summary(lm(formula = eval(as.name(vn)) ~ eval(as.name(rt)), weights = pop, data = DC_tracts.10))
        
        print(paste(vn, "vs", rt))
        print(summary(slm))
        #rbase = c(c,bs,pf,rt,slm$coefficients[1,1],slm$coefficients[1,2],slm$coefficients[2,1], slm$coefficients[2,2])
        
        rbase = data_frame(metric = c, scale = bs, date = pf, RPL_THEME = rt, 
                           intercept = slm$coefficients[1,1], intercept.std = slm$coefficients[1,2], slope = slm$coefficients[2,1], slope.std = slm$coefficients[2,2])
        
        result <- rbind(result,rbase)
        
      }
    }
  }  
}


result <- result %>% mutate(slope.lb = slope - 2*slope.std,
                            slope.ub = slope + 2*slope.std,)


#######
## This is the right plot for pairwise regressions.  I want a dot +- std figures by scale, and metric. 
#########

rpl_cols <- c("RPL_THEME1" = "mediumseagreen", "RPL_THEME2" = "salmon2", "RPL_THEME3" = "mediumpurple", "RPL_THEME4" = "cadetblue3", "RPL_THEME5" = "grey")


ggplot(result %>% filter(date == "worst.night" & metric == "Temp"), 
       aes(x = slope, y = scale, color = RPL_THEME))+geom_point() + 
  geom_errorbar(aes(xmin = slope.lb, xmax = slope.ub, y = scale), width = 0.2)+
  scale_color_manual(values = rpl_cols)+theme_minimal()+ labs(title = "Temperature")

ggsave("output/SVI_Weather_regression_summary_Temp_2010.pdf", width = 6, height = 4, units = "in")

ggplot(result %>% filter(date == "worst.night" & metric == "HI"), 
       aes(x = slope, y = scale, color = RPL_THEME))+geom_point() +
  geom_errorbar(aes(xmin = slope.lb, xmax = slope.ub, y = scale), width = 0.2)+
  scale_color_manual(values = rpl_cols)+theme_minimal()+ labs(title = "Heat Index")

ggsave("output/SVI_Weather_regression_summary_HI_2010.pdf", width = 6, height = 4, units = "in")
ggsave("output/SVI_Weather_regression_summary.pdf", width = 6, height = 4, units = "in")




######
## create regression tables
#########




slm.HI.10m = summary(lm(formula = worst.night.HI.10m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.HI.10m

slm.HI.100m = summary(lm(formula = worst.night.HI.100m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.HI.100m

slm.HI.nobldg = summary(lm(formula = worst.night.HI.nobldg ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.HI.nobldg

slm.HI.nudapt = summary(lm(formula = worst.night.HI.nudapt ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.HI.nudapt



slm.Temp.10m = summary(lm(formula = worst.night.Temp.10m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.Temp.10m

slm.Temp.100m = summary(lm(formula = worst.night.Temp.100m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.Temp.100m

slm.Temp.nobldg = summary(lm(formula = worst.night.Temp.nobldg ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.Temp.nobldg

slm.Temp.nudapt = summary(lm(formula = worst.night.Temp.nudapt ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
slm.Temp.nudapt

sjPlot::tab_model(slm.HI.10m,slm.HI.100m, slm.HI.nudapt, slm.HI.nobldg, show.ci = TRUE, show.se = TRUE, collapse.se = TRUE, p.style = "stars", 
                  file = "output/regression_HI_table.doc")

sjPlot::tab_model(slm.Temp.10m,slm.Temp.100m, slm.Temp.nudapt, slm.Temp.nobldg, show.ci = FALSE, show.se = TRUE, collapse.se = TRUE, p.style = "stars", 
                  file = "output/regression_Temp_table.doc")



slm.HI.10m = summary(lm(formula = worst.night.HI.10m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.HI.100m = summary(lm(formula = worst.night.HI.100m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.HI.nobldg = summary(lm(formula = worst.night.HI.nobldg ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.HI.nudapt = summary(lm(formula = worst.night.HI.nudapt ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))



slm.Temp.10m = summary(lm(formula = worst.night.Temp.10m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.Temp.100m = summary(lm(formula = worst.night.Temp.100m ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.Temp.nobldg = summary(lm(formula = worst.night.Temp.nobldg ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))
slm.Temp.nudapt = summary(lm(formula = worst.night.Temp.nudapt ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.20))


sjPlot::tab_model(slm.HI.10m,slm.HI.100m, slm.HI.nudapt, slm.HI.nobldg, show.ci = FALSE, show.se = TRUE, collapse.se = TRUE, p.style = "stars", 
                  file = "output/regression_HI_table_2020.doc")


sjPlot::tab_model(slm.Temp.10m,slm.Temp.100m, slm.Temp.nudapt, slm.Temp.nobldg, show.ci = FALSE, show.se = TRUE, collapse.se = TRUE, p.style = "stars", 
                  file = "output/regression_Temp_table_2020.doc")


sjPlot::tab_model(slm.HI.10m,slm.HI.100m, slm.HI.nudapt, slm.HI.nobldg)


###############
## redo for multi-variate 
##############


result = data_frame(metric = factor(), scale = factor(), date = factor(), RPL_THEME = factor(), 
                    slope = numeric(), slope.std = numeric())

for (c in c("Temp", "HI")){
  for (bs in c("10m", "100m", "nobldg", "nudapt")){
    for (pf in c("worst.night", "worst.morn")){
      {
        vn = paste(pf, c,bs, sep = ".")
        slm = summary(lm(formula = eval(as.name(vn)) ~ RPL_THEME1 +RPL_THEME2+RPL_THEME3+RPL_THEME4, weights = pop, data = DC_tracts.10))
        
        print(paste(vn))
        print(slm$coefficients)
        #rbase = c(c,bs,pf,rt,slm$coefficients[1,1],slm$coefficients[1,2],slm$coefficients[2,1], slm$coefficients[2,2])
        
        for (rt in c("(Intercept)","RPL_THEME1", "RPL_THEME2", "RPL_THEME3", "RPL_THEME4")){
          print(rt)
          rbase = data_frame(metric = c, scale = bs, date = pf, RPL_THEME = rt, 
                             slope = slm$coefficients[rt,'Estimate'], slope.std = slm$coefficients[rt,'Std. Error'])
          
          result <- rbind(result,rbase)
        }
      }
    }
  }  
}


result <- result %>% mutate(slope.lb = slope - 1.96*slope.std,
                            slope.ub = slope + 1.96*slope.std,)



scale_cols <- c("10m" = "midnightblue", "100m" = "royalblue3", "nudapt" = "skyblue3", "nobldg" = "slategray2")

ggplot(result %>% filter(date == "worst.night" & metric == "HI" & RPL_THEME != "(Intercept)"), 
       aes(x = slope, y = RPL_THEME, color = scale))+geom_point() + 
  geom_errorbar(aes(xmin = slope.lb, xmax = slope.ub, y = RPL_THEME), width = 0.2)+
  scale_color_manual(values = scale_cols, guide= guide_legend(title = "Building Input"))+
  theme_minimal()+ labs(title = "Heat Index", y= "", x = expression(beta))+
  scale_y_discrete(labels = c("RPL_THEME1" = "1: Socioeconomic Status", "RPL_THEME2" = "2: Household Characteristics", 
                              "RPL_THEME3" = "3: Race, Ethnicity, Language", "RPL_THEME4" = "4: Housing & Transport"),
                   limits = rev)

ggsave("output/SVI_Weather_regression_summary_HI_2010.pdf", width = 6, height = 4, units = "in")


ggplot(result %>% filter(date == "worst.night" & metric == "Temp" & RPL_THEME != "(Intercept)"), 
       aes(x = slope, y = RPL_THEME, color = scale))+geom_point() + 
  geom_errorbar(aes(xmin = slope.lb, xmax = slope.ub, y = RPL_THEME), width = 0.2)+
  scale_color_manual(values = scale_cols, guide= guide_legend(title = "Building Input"))+
  theme_minimal()+ labs(title = "Temperature", y= "", x = expression(beta))+
  scale_y_discrete(labels = c("RPL_THEME1" = "1: Socioeconomic Status", "RPL_THEME2" = "2: Household Characteristics", 
                              "RPL_THEME3" = "3: Race, Ethnicity, Language", "RPL_THEME4" = "4: Housing & Transport"),
                   limits = rev)

ggsave("output/SVI_Weather_regression_summary_Temp_2010.pdf", width = 6, height = 4, units = "in")



ggplot(result %>% filter(date == "worst.morn" & metric == "HI" & RPL_THEME != "(Intercept)"), 
       aes(x = slope, y = RPL_THEME, color = scale))+geom_point() + 
  geom_errorbar(aes(xmin = slope.lb, xmax = slope.ub, y = RPL_THEME), width = 0.2)+
  scale_color_manual(values = scale_cols, guide= guide_legend(title = "Building Input"))+theme_minimal()+ labs(title = "Heat Index", y= "")+
  scale_y_discrete(labels = c("RPL_THEME1" = "1) Socioeconomic Status", "RPL_THEME2" = "2) Household Characteristics", 
                              "RPL_THEME3" = "3) Race, Ethnicity, Language", "RPL_THEME4" = "4) Housing & Transport"),
                   limits = rev)

ggsave("output/SVI_Weather_regression_summary_HI_2010_morning.pdf", width = 6, height = 4, units = "in")

