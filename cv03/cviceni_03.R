data <- read.csv2('./cv02/01_dataset_Shower_data.csv')
require("dplyr")

head(data)
summarise(data, minDur = min(Showertime), maxDur = max(Showertime))