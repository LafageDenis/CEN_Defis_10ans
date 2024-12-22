# Librairies

library(ggplot2)
library(readr)
library(ggtextures)
library(magick)

# Import file

data <- read_csv("./csv/scores_defit_10ans.csv")

# Histogram


#> Linking to ImageMagick 6.9.9.39
#> Enabled features: cairo, fontconfig, freetype, lcms, pango, rsvg, webp
#> Disabled features: fftw, ghostscript, x11

data <- tibble(
  count = c(5, 6, 6, 4, 2, 3),
  animal = c("giraffe", "elephant", "horse", "bird", "turtle", "dog"),
  image = list(
    image_read_svg("http://steveharoz.com/research/isotype/icons/giraffe.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/elephant.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/horse.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/bird.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/turtle.svg"),
    image_read_svg("http://steveharoz.com/research/isotype/icons/dog.svg")
  )
)

ggplot(data, aes(Nom, Points, fill = Mois, image = image)) +
  geom_isotype_col(
    img_height = grid::unit(1, "null"), img_width = NULL,
    ncol = 1, nrow = 1, hjust = 1, vjust = 0.5
  ) +
  coord_flip() +
  guides(fill = "none") +
  theme_minimal()




library("ggplot2")
library("ggimage")

set.seed(2017-02-21)
img <- list.files(system.file("extdata", package="ggimage"),
                  pattern="png", full.names=TRUE)
d <- data.frame(x = rnorm(10),
                y = rnorm(10),
                image = sample(img, size=10, replace = TRUE)
)

ggplot(d, aes(x, y)) + geom_image(aes(image=image), size=.05)
