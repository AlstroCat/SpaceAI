rm(list = ls())
setwd("~/Desktop/SpaceAI CNN")

# Read from txt file
data_18 = read.table("ACE_SWEPAM_1518.txt", header = TRUE)

# If just want speed data
speed_18 = data_18["speed"]
write.csv(speed_18, "ACE_SWEPAM_SPEED_1518.csv", row.names = FALSE)

# Get datetime, each row differs by 1 hr
data_18$date = as.Date(data_16$day, origin = "2015-12-31") # cuz R 0 indexed for date
data_16$datetime = paste(data_16$date, 
                         paste(sprintf("%02s", data_16$hr), "00:00", sep = ":"))
data_16$datetime = as.POSIXct(data_16$datetime, format="%Y-%m-%d %H:%M:%S")
