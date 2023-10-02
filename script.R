require(sf)
require(tidyverse)
require(tmap)
require(tidygeocoder)


# Load the data
d <- read.csv("./Restaurants.csv")

# Geocode it
geo.d <- d %>% 
  geocode(
    street = Street,
    city = City,
    state = State,
    method = "census"
  ) %>% 
  as.data.frame(.)

# Concatenate full address
geo.d <- as.data.frame(geo.d)
geo.d$Address <- paste0(geo.d$Street, " ",
                        geo.d$Suite, ", ",
                        geo.d$City, ", ",
                        geo.d$State)

# convert to shapefile
restaurants <- st_as_sf(geo.d, coords = c("long", "lat"), crs = 4326)
