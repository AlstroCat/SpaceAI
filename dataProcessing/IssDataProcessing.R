rm(list = ls())
setwd("~/Desktop/Space AI/Datasets")

# read data

# Data 1, 20 Aug - 24 Aug 2015, 24k
data1 = read.csv("ISS RasPi Data/astro_pi_data_20150824_085954.csv",
                 sep = ",", header = TRUE)
table(as.Date(data1$time_stamp))

range(data1$mag_x)
summary(data1$mag_x)
summary(data1$mag_y)
summary(data1$mag_z)


# Data 2, 16 Feb - 29 Feb 2016, 110k
data2 = read.csv("ISS RasPi Data/Columbus_Ed_astro_pi_datalog.csv",
                 sep = ",", header = TRUE)
table(as.Date(data2$time_stamp))
summary(data2$mag_x)



# Data 3, 14 Mar - 13 Apr 2016, 250k
data3 = read.csv("ISS RasPi Data/Columbus2_Ed_astro_pi_datalog.csv",
                 sep = ",", header = TRUE)
table(as.Date(data3$time_stamp))
summary(data3$mag_x)


# Data 4, 09 Mar - 25 Mar 2016, 110k
data4 = read.csv("ISS RasPi Data/Node2_Izzy_astro_pi_datalog.csv",
                 sep = ",", header = TRUE)
table(as.Date(data4$time_stamp))
summary(data4$mag_x)

# Data {2, 3} similar, {1}, {4}, different 
