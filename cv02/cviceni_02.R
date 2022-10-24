data <- read.csv2('./cv02/01_dataset_Shower_data.csv')

head(data, 5)
tail(data, 5)
summary(data)
str(data)
nrow(data)
ncol(data)

data$group <- as.factor(data$group)
# 1)    -> 224.9612
mean(data$Showertime)

# 2)    -> 34461.68
var(data$Showertime)

# 3)    -> 175 \ 224.9612
median(data$Showertime)
mean(data$Showertime)

# 4)    -> 185.6386
sd(data$Showertime)

# 5)    ->
#    0%  25%  50%  75% 100%
#    16  100  175  294 2047
quantile(data$Showertime)

require('dplyr')
shower_data <- data.frame(Hh_ID = c(1,1,1,2,2), Volume = c(30, 33, 23, 40, 35))
shower_data[shower_data$Volume %in% c(30, 35),]

# Excercise I
# 1)
# a <- data[data$Hh_ID == 6395,]
a <- filter(data, Hh_ID == 6395)

# 2)
b <- arrange(data[data$Hh_ID == 6395,], Volume)

# 3)
c <- filter(data, !(Hh_ID %in% c(6395, 5307)))

# Excercise II
# 1)
# min(data$Showertime)
# max(data$Showertime)
summarise(data, maxVol = max(Showertime), minVol = min(Showertime))

# 2)
require('weathermetrics')
mutate(data, Avgtemperaturefahrenheit = celsius.to.fahrenheit(Avgtemperature))

# 3)
group_by(data, Hh_ID) %>%
    summarise(avgVol = mean(Volume), avgTemp = mean(Avgtemperature), avgDur = mean(Showertime)) %>%
    arrange(Hh_ID)

# Exercise III
# 1)
group_by(data, Hh_ID) %>%
    summarise(avgVol = mean(Volume), avgTemp = mean(Avgtemperature), avgDur = mean(Showertime)) %>%
    arrange(Hh_ID)

# 2)
# group_by(data, Hh_ID) %>%
#     mutate(., countOcc = count(., Hh_ID))