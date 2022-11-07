


#####

library(dplyr)

data <- read.csv2("Shower_data.csv") 


#Exercise 2

d <- dplyr::summarise(data, minShowerDuration = min(Showertime),
                       maxShowerDuration = max(Showertime))

e <- dplyr::mutate(data, avgtemperaturefahrenheit = weathermetrics::celsius.to.fahrenheit(Avgtemperature))


grouped_showers <- group_by(data, Hh_ID)

measures <- summarise(grouped_showers, meanDuration = mean(Showertime),
                      meanTemperature  = mean(Avgtemperature),
                      meanVolume = mean(Volume))


#Exercise 3

measures <- data %>% dplyr::group_by(Hh_ID) %>%
                     summarise(meanDuration = mean(Showertime),
                                      meanTemperature  = mean(Avgtemperature),
                                      meanVolume = mean(Volume))

moreThan50 <- data %>% dplyr::group_by(Hh_ID) %>%
                       dplyr::summarise(n = n()) %>%
                       dplyr::filter(n > 50)

avgNumberOfShowers <- data %>% dplyr::group_by(Hh_ID, group) %>%
                               dplyr::summarise(n = n()) %>%
                               dplyr::group_by(group) %>%
                               dplyr::summarise(grpmean = mean(n)) 



## Join


survey <- read.csv2("Shower_survey_data.csv") 


combined_dataset <- dplyr::inner_join(data, 
                                      survey)

result <- combined_dataset %>% dplyr::group_by(X03d_longhair, group) %>% 
                               dplyr::summarise(avgVolume = mean(Volume),
                                                avgDuration = mean(Showertime))



##ggplot2
library(ggplot2)


#Exemplary plots
g <- ggplot(data, aes(x=Avgtemperature, y=Volume))
g <- g + geom_point()
g

g <- g + ggtitle("Distribution of average temparature and volume")
g <- g + xlab("Temperature")
g <- g + ylab("Volume in liters")
g <- g + geom_hline(yintercept = mean(data$Volume), 		 			    color="red")
g

g <- ggplot(data, aes(x=Avgtemperature, y=Volume, color=factor(group)))
g <- g + geom_point()
g

g <- ggplot(data, aes(x=Avgtemperature, y=Volume))
g <- g + geom_point()
g <- g + facet_wrap(~group, nrow = 1)
g
            


#Exercise ggplot2
g <- ggplot(data, aes(x=Showertime, y=Volume))
g <- g + geom_point()
g


g2 <- ggplot(data, aes(x=log(Showertime), y=log(Volume)))
g2 <- g2 + geom_point()
g2

g3 <- ggplot(data, aes(x="",y=Showertime))
g3 <- g3 + geom_boxplot()
g3

g4 <- ggplot(survey, aes(x=einkommen))
g4 <- g4 + geom_bar()
g4

g5 <- ggplot(data, aes(x=Volume ))
g5 <- g5 + geom_density()
g5 <- g5 + facet_wrap(~group)
g5


