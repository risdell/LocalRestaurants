require(sf)
require(tidyverse)
require(tmap)
require(tidygeocoder)


# Load the data
d <- read.csv("./Restaurants.csv")

# Geocode it
osm.d <- d %>% 
  geocode(
    street = Street,
    city = City,
    state = State,
    method = "osm"
  ) %>% 
  as.data.frame(.)

# Concatenate full address
osm.d <- as.data.frame(osm.d)
osm.d$Address <- paste0(osm.d$Street, " ",
                        osm.d$Suite, ", ",
                        osm.d$City, ", ",
                        osm.d$State)

# convert to shapefile
restaurants <- st_as_sf(osm.d, coords = c("long", "lat"), crs = 4326)
