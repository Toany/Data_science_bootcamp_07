library(tidyverse)
library(rvest)

# HW01 - IMDB
url_idmb <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating%2Cdesc"

movie_name <- url_idmb %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>%
  html_text2()

movie_date <- url_idmb %>%
  read_html() %>%
  html_elements("span.lister-item-year") %>%
  html_text2()

year <- gsub("[()]", "" , movie_date, ignore.case = T)

ratings <- url_idmb %>%
  read_html() %>%
  html_elements("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

run_time <- url_idmb %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2()

genre <- url_idmb %>%
  read_html() %>%
  html_elements("span.genre") %>%
  html_text2()

vote <- url_idmb %>%
  read_html() %>%
  html_elements("p.sort-num_votes-visible") %>%
  html_text2()

imdb <- data.frame(movie_name,
                   year,
                   ratings,
                   run_time,
                   genre,
                   vote) %>%
  separate(vote, sep = "\\|", into = c("votes", "gross", "tops_250"))

View(imdb)
