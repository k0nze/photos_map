# Author: Konstantin (Konze) Lübeck
# Plots a map (Plotly) with points of locations retrieved from images

library(plotly)

source("get_gps_locations.R")

path.to.exiftool <- "/usr/local/bin/exiftool"
path.to.images <- "images"

locations <- get.gps.locations(path.to.images = path.to.images, path.to.exiftool = path.to.exiftool)

m <- list(
    size = 5,
    color = "red"
)

g <- list(
    scope = 'europe',
    showland = TRUE,
    landcolor = toRGB("gray90"),
    subunitcolor = toRGB("gray70"),
    countrycolor = toRGB("gray70"),
    countrywidth = 0.5,
    subunitwidth = 0.5
)

plot_ly(locations, 
        lat = latitude, 
        lon = longitude, 
        type = 'scattergeo',
        marker = m) %>%
layout(geo = g)
