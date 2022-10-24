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