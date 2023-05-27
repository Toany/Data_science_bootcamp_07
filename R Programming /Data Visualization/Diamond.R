library(tidyverse)
library(patchwork)

View(diamonds)
glimpse(diamonds)

# We found a relationship about carat and price by cut grade with random around 1000 sample
c1 <- ggplot(diamonds %>% sample_n(1000),
             aes(carat, price, col=cut)) +
  geom_point(size = 5, alpha=0.5) +
  theme_minimal() +
  labs(title = "Relationship between carat and price",
       x = "Carat",
       y = "Price USD$",
       subtitle = "Color fill by cut",
       caption = "Datasource: diamonds ggplot2") + 
  scale_color_brewer(type="div", palette = 5)

c1

# We count about depth around 60-65 by clarity with random around 1000 sample
c2 <- ggplot(diamonds %>% sample_n(1000) %>% 
               filter(depth >= 60 & depth <= 65),
             aes(depth, fill=clarity)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Diamonds in depth around 60-65 ",
       x = "Depth",
       y = "Count",
       subtitle = "Color fill by clarity",
       caption = "Datasource: diamonds ggplot2")

c2

# We found a relationship about price and color with random around 1000 sample
c3 <- ggplot(diamonds %>% sample_n(1000),
             aes(price, color, fill=cut)) +
  geom_col() +
  theme_minimal() +
  labs(title = "Relationship between price and color",
       x = "Price USD$",
       y = "Color",
       subtitle = "Color fill by cut",
       caption = "Datasource: diamonds ggplot2")

c3

# We found the frequency about carat that under 1.5 with random around 1000 sample
c4 <- ggplot(diamonds %>% sample_n(1000) %>%
               filter(carat <= 1.5),
             aes(carat, fill=color)) +
  geom_histogram(size = 15, position = "fill") +
  theme_minimal() +
  labs(title = "The frequency about carat that under 1.5",
       x = "Carat",
       y = "Frequency",
       subtitle = "Color fill by color",
       caption = "Datasource: diamonds ggplot2")

c4

# We cut into 5 chart by cut column
# each chart that come from relationship between carat and price
# with random around 1000 sample
c5 <- ggplot(diamonds %>% sample_n(1000),
             aes(carat, price, col = color)) +
  geom_point(size = 3, alpha = 0.3) +
  theme_minimal() +
  facet_wrap( ~cut, ncol=1) +
  theme_minimal() +
  labs(title = "Relationship between carat and price in 5 chart",
       x = "Carat",
       y = "Price USD$",
       subtitle = "Color fill by color",
       caption = "Datasource: diamonds ggplot2")

c5
