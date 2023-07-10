#### Techincal
penguins <- read.csv("data/penguins_raw.csv")
View(penguins)
library(ggplot2)

# Label axes, color by variable

# Distribution of One Variable

ggplot(penguins, aes(x = Clutch.Completion)) +
  geom_bar(aes(color = Species, fill = Species)) +
  scale_fill_manual(values = c("cadetblue1", "cornsilk", "burlywood")) +
  scale_color_manual(values = c("black", "black", "black"))+
  labs(title = "Clutch Completion Count by Species",
       x = "Clutch Completion",
       y = "Count by Species") +
  theme_light()

# Numeric vs. Categorical Variable
ggplot(penguins, aes(x = Species, y = Flipper.Length..mm.)) +
  geom_violin(aes(fill = Species)) + geom_boxplot(width = 0.2) +
  scale_fill_manual(values = c("cadetblue1", "cornsilk", "burlywood")) +
  labs(title = "Distribution of Flipper Lengths by Species",
       x = "Species",
       y = "Flipper Length (mm)") +
  theme_light()


# Numeric vs. Numeric Variable
ggplot(penguins, aes(x = Culmen.Length..mm., y = Culmen.Depth..mm.)) +
  geom_point(aes(color = Species)) +
  scale_color_manual(values = c("cadetblue1", "coral2", "burlywood")) +
  labs(title = "Culmen Depth vs. Culmen Length by Species",
       x = "Culmen Length",
       y = "Culmen Depth") +
  theme_light()
