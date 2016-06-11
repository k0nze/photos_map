# Photos Map

This litte R script reads the GPS location from the EXIF data of images and plots a map (using Google Maps or Plotly) with markers for the photo locations.

## Usage
### R Libraries

 * `ggmap`
 * `mapproj`
 * `plotly`

### Command Line Tools

 * `exiftools`

### How to Run

Before running the script one has to set the following variables in `plot_google_map.R` or `plot_plotly_map.R` 

 * `path.to.exiftool` path to the `exiftool`
 * `path.to.images` path of a directory which contains images (images only) with EXIF data

To finally run the program one has to execute the following command:

`Rscript plot_google_map.R` or `Rscript plot_plotly_map.R`

## Photo Credits
For the example the following photos were used

 * `london.jpg`, Pedro Szekely, https://www.flickr.com/photos/pedrosz/
 * `paris.jpg`, Rodrigo Paredes, https://www.flickr.com/photos/rodrigoparedes/
