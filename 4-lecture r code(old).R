#C.M. Gienger
#Visualization with ggplot2

library(dplyr)
library(ggplot2)
library(gridExtra)

#Lets make a graph
compensation <- read.csv('compensation.csv')
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point()

#Interpretation, then Customize
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point() +
  theme_bw()

#increase size of points
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point(size = 5) +
  theme_bw()

#alter X and Y axis labels
ggplot(compensation, aes(x = Root, y = Fruit)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()

#adjust the colours of the points to match specific levels of a group
ggplot(compensation, aes(x = Root, y = Fruit, colour = Grazing)) +
  geom_point(size = 5) +
  xlab("Root Biomass") +
  ylab("Fruit Production") +
  theme_bw()

#multiple customizations
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
  geom_point(size = 4, colour = 'lightgrey', alpha = 0.5) +
  xlab("Grazing treatment") +
  ylab("Fruit Production") +
  theme_bw()

#pre-defined palettes
library("RColorBrewer")
display.brewer.all()

#Distributions: Making Histograms
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram()

ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(bins = 10)

ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(binwidth = 15)

#Facets; producing a matrix of graphs
ggplot(compensation, aes(x = Fruit)) +
  geom_histogram(binwidth = 15) +
  facet_wrap(~Grazing)

ggsave("ThatCoolHistogramOfFruit.png")

#Selected Material from Chapter 8: Scales and Themes
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

#Axis labels, limits, and annotations
eg_scatter
eg_scatter + xlab("Root Biomass") + ylab("Fruit Production")
eg_scatter + xlim(0, 20) + ylim(0, 140)

#Putting Custom Text Inside Figure
eg_scatter +
  annotate("text", x = c(6,8), y = c(105, 25),
           label = c("Text up here...","...and text down here"))

#Scales
eg_scatter + scale_x_continuous(limits = c(4, 11), breaks = 4:11)

ggplot(data = compensation, aes(x = Root, y = Fruit, colour 	= Grazing)) +
  geom_point() +
  scale_colour_manual(values = c(Grazed = "brown", 	Ungrazed = "green"))

eg_box +
  scale_y_continuous(breaks = seq(from = 10, to = 150, by = 20),trans = "log10")

#The Theme
eg_scatter +
  theme(
    panel.background = element_rect(fill = NA, colour = "black"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(colour = "lightblue")
  )

#Some theme() Syntax for Axis Titles and Ticks
eg_box +
  theme(
    axis.title.x = element_text(colour = 	"cornflowerblue",
                                size =rel(2)),
    axis.text.x = element_text(angle = 45, size = 13, 	vjust = 0.5))

#Discrete Axis Customizations
eg_box + scale_x_discrete(limits = c("Ungrazed", "Grazed"),
                          labels = c("Control", "Grazed"))

#Legend Position
ggplot(compensation, aes(x = Root, y = Fruit, color = Grazing)) +
  geom_point()+
  theme(legend.position = "none")
