# install.packages("palmerpenguins")
library("tidyverse")
library("palmerpenguins")
glimpse(penguins)

species_count <- table(penguins$species, penguins$island)
species_count

barplot(species_count, legend = rownames(species_count))

ggplot(penguins) + 
  aes(x = body_mass_g) + 
  geom_histogram()

ggplot(penguins, mapping = aes(x = body_mass_g, color = species)) + 
  geom_histogram(binwidth = 500)

ggplot(penguins, mapping = aes(x = body_mass_g, fill = species)) + 
  geom_histogram(binwidth = 500)

ggplot(penguins, mapping = aes(x = body_mass_g, fill = species)) + 
  geom_histogram(binwidth = 500, position = "dodge")

ggplot(penguins, mapping = aes(x = body_mass_g, fill = species)) + 
  geom_histogram(binwidth = 500) +
  facet_wrap(~ species)

# Different geoms

ggplot(penguins, mapping = aes(x = island, fill = species)) + 
  geom_bar() 

ggplot(penguins, mapping = aes(x = species, y = body_mass_g)) + 
  geom_boxplot() 

ggplot(penguins, mapping = aes(x = flipper_length_mm,  y = body_mass_g,
                               color = species, shape = sex)) + 
  geom_point() 

# Layered plot
ggplot(penguins, mapping = aes(x = body_mass_g)) +
  geom_histogram(fill = "grey") + 
  geom_histogram(aes(color = species), position = "identity", fill = NA)
  


ggplot(penguins, mapping = aes(x = body_mass_g, y = stat(density))) +
  geom_histogram(fill = "grey") + 
  geom_density()


ggplot(penguins) + 
  aes(x = body_mass_g, fill = species) + 
  geom_histogram(binwidth = 500) + 
  facet_wrap(~ species) + 
  scale_colour_brewer(palette = "Set1")
  
# install.packages("gganimate")
library(gganimate)
ggplot(penguins) + 
  aes(x = flipper_length_mm, y = body_mass_g, fill = species) + 
  geom_point() + 
  transition_states(~species)


# install.packages("plotly")
library(plotly)
ggplotly(penguins) + 
  aes(x = flipper_length_mm, y = body_mass_g, fill = species) + 
  geom_point() + 
  transition_states()


ggplot() + xlim(-5, 5) +
  geom_function(fun = dnorm)

ggplot() + xlim(-5, 5) +
  geom_function(fun = function(x) x^2 + x)
