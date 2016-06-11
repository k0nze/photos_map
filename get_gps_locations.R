# Author: Konstantin Lübeck

get.gps.locations <- function(path.to.images, path.to.exiftool) {

    # gets the GPS locations (longitude, latitude) for all images in path.to.images directory
    #
    # Args:
    #   path.to.images: path to a directory with images
    #   path.to.exiftool: path to the exiftool (command line)
    #
    # Returns:
    #   data.frame with the longitude and latitude
        
    image.files <- list.files(path=path.to.images)
    
    
    longitude <- vector()
    latitude <- vector()
    
    for(i in 1:length(image.files)) {
        string <- as.character(system(intern = TRUE ,command = paste(sep="", path.to.exiftool," -gpslatitude -gpslongitude -T -c \"%.6f\" ", path.to.images, "/", image.files[i], ' | tr "\t" " "')))
        splitted.string <- strsplit(string, split=" ")
       
        # check if image contains GPS data 
        if(splitted.string[[1]][1] != "-") {
            latitude <- c(latitude, as.numeric(splitted.string[[1]][1]))
            longitude <- c(longitude, as.numeric(splitted.string[[1]][3]))
        }
    }
    
    locations <- data.frame(longitude=longitude,
                            latitude=latitude)

    return(locations)       
}