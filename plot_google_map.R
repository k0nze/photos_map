# Author: Konstantin Lübeck
# Plots a map (Google Maps) with points of locations retrieved from images

library(ggmap)
library(mapproj)

source("get_gps_locations.R")

path.to.exiftool <- "/usr/local/bin/exiftool"
path.to.images <- "images"

locations <- get.gps.locations(path.to.images = path.to.images, path.to.exiftool = path.to.exiftool)

map <- get_map(location = 'Europe', zoom = 4, maptype = c("satellite"))
plot <- ggmap(map) 

plot + 
geom_point(data=locations, 
           aes(x=longitude, y=latitude), 
           color="red", 
           size=1) +
theme(axis.text = element_blank(),
      axis.title = element_blank(),
      axis.ticks = element_blank())