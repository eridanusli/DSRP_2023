## check a function's or dataset's package
## upper left corner of Help Document func(package)


# install required packages
# install.packages("ggplot2")
    # commented out because we don't want it to install again

# load required packages (required)
library(ggplot2)

?ggplot2 # see: ggplot2.tidyverse.org


## mpg dataset
str(mpg)
?mpg
      # tibble -> tidy table
      # [rows, columns]


ggplot(data = mpg, aes(x = hwy, y = cty)) +
    geom_point() + #adds points & "geometry"
    labs(x = "Highway mpg",
         y = "City mpg,",
         title = "Car City vs Highway mileage")

#### HISTOGRAMS

ggplot(data = mpg, aes(x = hwy)) +
    geom_histogram()

ggplot(data = iris, aes(x = Sepal.Length)) +
    geom_histogram(bins = 30)
    # default num of bins is 30 (num of sections)

ggplot(data = iris, aes(x = Sepal.Length)) +
    geom_histogram(binwidth = 0.25) +
    labs(x = "Sepal Length",
         y = "Sepal Lengths",
         title = "Sepal Length of Irises")
    # changing binwidth - a range of data of 0.25, how many flowers are in that range?


#### DENSITY GRAPHS
ggplot(data = iris, aes(x = Sepal.Length)) +
    geom_density() +
    labs(x = "Sepal Lengths",
         y = "Density",
         title = "Sepal Length Densities")


#### BOXPLOTS
ggplot(data = iris, aes(x = Sepal.Length)) +
    geom_boxplot()
    # horizontal plot

ggplot(data = iris, aes(y = Sepal.Length)) +
    geom_boxplot()
    # vertical plot

ggplot(data = iris, aes(x = Sepal.Length, y = Species)) +
    geom_boxplot()
    # breaks sepal lengths into three species categories


#### VIOLIN PLOT  
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_violin() +
    labs(title = "Distribution  of Sepal Lengths by Species")
    # without layered boxplot

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_violin() + geom_boxplot(width = 0.2)
  labs(title = "Distribution  of Sepal Lengths by Species")
  # with layered boxplot

  
  
#### COLORS
  ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_violin(color = "aquamarine", fill = "grey") + geom_boxplot(width = 0.2)
labs(title = "Distribution  of Sepal Lengths by Species")


#### BARPLOTS
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_bar(color = "magenta", fill = "pink", stat = "summary",
             fun = mean) +
    labs(y = "Sepal Length Mean",
         title = "The Mean of Spepal Lenghts by Species")


#### COLORS BASED ON DATA
ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
    geom_bar(stat = "summary",
            fun = mean)

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_violin(aes(fill = Species)) + geom_boxplot(width = 0.2)
    labs(title = "Distribution  of Sepal Lengths by Species")


#### SCATTERPLOTS
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point()
    # 2 numerics

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_point()
    # numeric + categorical (not the best)
    # tells us min, max, gaps, but we don't know what is overlapping

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_jitter(width = 0.25)
    # "jitters" the points and gives it random x values to better show the data

#### LINE PLOTS
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point() + geom_line()
    # this is what happens without stat = "summary" -> you probably don't want this

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_line(stat = "summary",
              fun = mean) +
    labs(title = "Mean of Sepal Width by Sepal Length")


#### EXTRA
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_smooth() + geom_point()
    # smooth with standard deviation + spread

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_smooth(se = F) + geom_point()
    # smooth without spread


#### THEMES
# themes_minimal(), classic(), etc
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point(aes(color= Species)) +
    scale_color_manual(values = c("violet", "cyan", "yellow"))



#### FACTORS
# wrapping objects in factor allows coloring and etc.
mpg$year <- as.factor(mpg$year)

# reordering variable levels
iris$Species <- factor(iris$Species, levels)



##### na.rm = T to omit na values
