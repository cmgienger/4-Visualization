#Ch4 - Data Visualization

library(dplyr)
library(ggplot2)
library(gridExtra)

#read in datafile
compensation <- read.csv('compensation.csv')

#plot data
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point()

#add theme
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point() +
  theme_bw()

#add multiple customizations
ggplot(compensation, aes(x = Root, y = Fruit, shape = Grazing, color = Grazing)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()

#box and whisker plots
ggplot(compensation, aes(x = Grazing, y = Fruit)) +
  geom_boxplot() +
  xlab("Grazing treatment") +
  ylab("Fruit Production") +
  theme_bw()

ggplot(compensation, aes(x = Grazing, y = Fruit)) +
  geom_boxplot() +
  geom_point(size = 4, color = 'lightgrey', alpha = 0.5) +
  xlab("Grazing treatment") +
  ylab("Fruit Production") +
  theme_bw()

#ggplot2 pre-defined colors
browseURL("http://sape.inf.usi.ch/quick-reference/ggplot2/colour")


#Plotting distribution of a single variable
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram()

#Most obvious thing to adjust is bin width:
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(bins = 10)

ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(binwidth = 15)

#faceting
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(binwidth = 15) +
  facet_wrap(~Grazing)

#save the plot
ggsave("ThatCoolHistogramOfFruit.png")

#scales and themes in ggplot2
library(gridExtra)

# BASE scatterplot
eg_scatter <-
  ggplot(data = compensation, aes(x = Root, y = Fruit)) +
  geom_point()

# BASE box-and-whiskers plot
eg_box <-
  ggplot(data = compensation, aes(x = Grazing, y = Fruit)) +
  geom_boxplot()

grid.arrange(eg_scatter, eg_box, nrow = 1)

#plot customizations
eg_scatter

#add more intuitive axis labels
eg_scatter + xlab("Root Biomass") + ylab("Fruit Production")

#re-scale the axes (x,y)
eg_scatter + xlim(0, 20) + ylim(0, 140)

#putting custom text inside figure ; annotate() function
eg_scatter +
  annotate("text", x = c(6,8), y = c(105, 25),
           label = c("Text up here...","...and text down here"))

#adjust range of axes, frequency and location of tick marks
eg_scatter + scale_x_continuous(limits = c(4, 11), breaks = 4:11)

#customizing the colors allocated to each group using scale_colour_manual() layering.
ggplot(data = compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point() +
  scale_colour_manual(values = c(Grazed = "brown", 	Ungrazed = "green"))

#Scale transformation; one or both of the X-Y axes
eg_box +
  scale_y_continuous(breaks = seq(from = 10, to = 150, by = 20), trans = "log10")

#modify theme elements; powerful framework for adjusting all the non-aesthetic pieces of a graph
eg_scatter +
  theme(
    panel.background = element_rect(fill = NA, color = "black"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "lightblue")
  )

#the theme elements you can adjust
? theme #click on help tab to see possible theme elements

#Some theme() syntax for axis titles and ticks
eg_box +
  theme(
    axis.title.x = element_text(colour = "cornflowerblue", size =rel(2)),
    axis.text.x = element_text(angle = 45, size = 13, vjust = 	0.5))

#We use the scale_x_discrete() or scale_y_discrete() function to 
#customize the labelling of groups
eg_box + scale_x_discrete(limits = c("Ungrazed", "Grazed"), labels = c("Control", "Grazed"))

#legend position
ggplot(compensation, aes(x = Root, y = Fruit, color = Grazing)) +
  geom_point() +
  theme(legend.position = "none")
