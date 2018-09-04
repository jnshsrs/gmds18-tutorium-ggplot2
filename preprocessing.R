library(gapminder)
library(tidyverse)


gapminder %>% 
  mutate(lifeExp_cat = if_else(quantile(lifeExp, probs = .9) <= lifeExp, "Top 10 Percent", "Lower 90 Percent")) %>% 
  write_csv("data/gapminder.csv")

titanic <- read_csv("~/Downloads/titanic.csv")
titanic %>% 
  mutate(
    pclass = case_when(
      pclass == 1 ~ "1st Class",
      pclass == 2 ~ "2nd Class",
      pclass == 3 ~ "3rd Class",
      is.na(pclass) ~ as.character(NA),
      TRUE ~ as.character(NA)
    )
  ) %>% 
  mutate(
    survived = if_else(survived == 1, "Yes", "No")
  ) %>% 
  mutate(
    sex = case_when(
      sex == "female" ~ "Female",
      sex == "male" ~ "Male",
      TRUE ~ as.character(NA)
    )  
  ) %>% 
  write_csv("./data/titanic.csv")
  