# HW02 - Samsung Phone List
url_samsung <- "https://specphone.com/brand/Samsung"

phone_list <- url_samsung %>%
  read_html() %>%
  html_elements("div.name") %>%
  html_text2()

price <- url_samsung %>%
  read_html() %>%
  html_elements("div.price") %>%
  html_text2()

samsung_phones <- data.frame(phone_list, price)
View(samsung_phones)

url_samsung_z_fold <- "https://specphone.com/Samsung-Galaxy-Z-Fold-3.html"

topic <- url_samsung_z_fold %>%
  read_html() %>%
  html_elements("div.topic") %>%
  html_text2()

detail <- url_samsung_z_fold %>%
  read_html() %>%
  html_elements("div.detail") %>%
  html_text2()

samsung_z_fold <- data.frame(topic, detail)
View(samsung_z_fold)
