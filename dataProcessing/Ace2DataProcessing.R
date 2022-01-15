rm(list = ls())
setwd("~/Desktop/Space AI/Datasets")



# Both libraries are unable to read the .hdf file
# Use ncdf4 lib to read .hdf files
#library(ncdf4)
#feb16_data <- nc_open("Ace2Data/swepam_data_1hr_2490.hdf")
#library(hdf5r)
#feb16_data = h5file("Ace2Data/swepam_data_1hr_2490.hdf", "r")

# Read from txt file
data_16 = read.table("Ace2Data/ACE_SWEPAM_Data.txt", header = TRUE)

# Get datetime, each row differs by 1 hr
data_16$date = as.Date(data_16$day, origin = "2015-12-31") # cuz R 0 indexed for date
data_16$datetime = paste(data_16$date, 
                         paste(sprintf("%02s", data_16$hr), "00:00", sep = ":"))
data_16$datetime = as.POSIXct(data_16$datetime, format="%Y-%m-%d %H:%M:%S")
