penguins <- read.csv("data/penguins_raw.csv")
View(penguins)

# 4. Pick numeric column and find mean, median, range

penguins2 <- na.omit(penguins)
flippers <- penguins2$Flipper.Length..mm.

# calcs

mean <- mean(flippers)
mean

median <- median(flippers)
median

max(flippers) - min(flippers)

variance <- var(flippers)
variance

sdeviance <- sd(flippers)
sdeviance

IQRange <- IQR(flippers)
IQRange

# OUTLIERS ################

# outliers < mean - 3 * sd
lower <- mean - 3 * sdeviance
# outliers < mean + 3 * sd
upper <- mean + 3 * sdeviance
# outliers < Q1 - 1.5 * IQR
lower2 <- quantile(flippers, 0.25) + 1.5 * IQRange
# outliers > Q3 + 1.5 * IQR
upper2 <- quantile(flippers, 0.75) + 1.5 * IQRange

# checking for outliers
flippers < lower | flippers > upper
flippers < lower2 | flippers > upper2

# removing outliers
flippers <- c(flippers, 100, 150, 290)
mean <- mean(flippers)
mean

median <- median(flippers)
median





