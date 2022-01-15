rm(list = ls())
setwd("~/Desktop/Space AI/Datasets")

sample_data = read.csv("AiBox_AccGyroMag.csv",sep = ",", header = TRUE)

# remove NA fields from collected data
sample_data_filtered = sample_data[!is.na(sample_data$ICM_ACCEL_X), ]
nrow(sample_data_filtered) # shld be arnd 300k

attach(sample_data_filtered)

# replace string in time
sample_data_filtered$Time = gsub('T', ' ', Time)
sample_data_filtered$Time = gsub('Z', '', sample_data_filtered$Time)
sample_data_filtered[1:5, ]

# convert to datetime, millisec are ignored
sample_data_filtered$Time <- as.POSIXct(sample_data_filtered$Time)
sample_data_filtered[1:5, ]

plot(sample_data_filtered$ICM_MAG_X, sample_data_filtered$Time)
range(sample_data_filtered$Time)


######################### Visualisation #########################
# Distribution of datetime
hist(sample_data_filtered$Time, breaks = "days",
     main = "Distribution by day")
hist(sample_data_filtered$Time, breaks = "hours",
     main = "Distribution by hours")
# First add in one more col called date, then filter by date
sample_data_filtered$date = as.Date(sample_data_filtered$Time)
data_by_date_table = table(sample_data_filtered$date)
table_date <- names(data_by_date_table)
table_val <- as.vector(data_by_date_table)

barplot(table_val, names.arg = table_date)


# Filter only those 19 - 25 Nov
sample_shorter_date = 
        sample_data_filtered[sample_data_filtered$date >= "2021-11-19", ]
# check
table(sample_shorter_date$date)

######################### Export Files #########################
# Export to csv
write.csv(sample_data_filtered,
          "AiData_Processed_15Nov25Nov.csv", row.names = TRUE)

write.csv(sample_shorter_date,
          "AiData_Processed_19Nov25Nov.csv", row.names = TRUE)


######################### Further Analysis #########################
AiBoxData = read.csv("AiData_Processed_19Nov25Nov.csv", sep = ",", header = TRUE)

summary(AiBoxData$ICM_MAG_X)
summary(AiBoxData$ICM_MAG_Y)
