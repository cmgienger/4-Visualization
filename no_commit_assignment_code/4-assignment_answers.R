#######################################################
######### Homework: Visualizations Using ggplot  ######
#######################################################

#Answers to Homework

#Your homework script and outputs should be contained in a new R Project Folder (contains .Rproj file).

data("mtcars")
library(ggplot2)
library(gridExtra)

#1. Using the mtcars dataset, make a scatterplot showing the relationship between displacement (predictor)
#and horsepower (response).

quest1 <- ggplot(mtcars, aes(x = disp, y = hp )) +
  geom_point(size = 5) +
  theme_bw()
quest1

#2. Color the points by the number of cylinders.

quest2 <- ggplot(mtcars, aes(x = disp, y = hp, color = cyl)) +
  geom_point(size = 5) +
  theme_bw()
quest2

#3. Change the axes labels to Displacement (inches^3) and Horsepower. 

quest3 <- ggplot(mtcars, aes(x = disp, y = hp, color = cyl)) +
  geom_point(size = 5) +
  xlab("Displacement(inches^3)") +
  ylab("Horsepower") +
  theme_bw()
quest3

#4. Annotate the plot with your name (so I know who made it)

quest4 <- quest3 +
  annotate("text", x = 125, y = c(310),
           label = "My Name Here")
quest4

#5. Save the plot to the local directory.

ggsave("Saved_Scatterplot.png")

#6. Make a boxplot showing the distribution of miles per gallon as a function of the number of cylinders.

quest6 <- ggplot(mtcars, aes(x = as.factor(cyl), y = (mpg))) +
  geom_boxplot() +
  theme_bw()
quest6

#7. Add the raw data points on top of the boxplots.

quest7 <- quest6 +
  geom_point(size = 4, alpha = 0.5)+
  theme_bw()
quest7

#8. Change axes labels to Number of Cylinders and Fuel Economy (miles per gallon).

quest8 <- quest7 +
  xlab("Cylinders") +
  ylab("Fuel Economy (miles per gallon)") +
  theme_bw()
quest8

#9. Change the colors of the boxplot to be something other than the default.

quest9 <- ggplot(mtcars, aes(x = as.factor(cyl), y = (mpg))) +
  geom_boxplot(color = 'blue') +
  geom_point(size = 4, color = 'orange', alpha = 0.5)+
  xlab("Cylinders") +
  ylab("Fuel Economy (miles per gallon)") +
  theme_bw()
quest9

#10. Annotate plot with your name and save the plot to the local directory.

quest10 <- quest9 +
  annotate("text", x = 3, y = 29,
           label = "Quest 10 Name of Plotmaker")
quest10

ggsave("Saved_BoxPlot.png")

# Submit your R Project File to the Assignments area on D2L.
# Your submission should be a folder containing the .Rproj file, the script, and the figure outputs.
# You may have to zip (compress) the folder before uploading.
