install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

airlines <- nycflights13::airlines
plances <- nycflights13::planes
weather <- nycflights13::weather
df <- flights

## How far is each airline?
df %>%
  group_by(carrier) %>%
  summarise(sum_distance = sum(distance)) %>%
  head(5)

## How many tailnum in nyc airplane?
df %>%
  count(tailnum) %>%
  arrange(-n) %>%
  drop_na() %>%
  head(10)

## sample of an airline not delay
df %>%
  left_join(airlines, by = "carrier") %>%
  select(carrier, name, dep_delay) %>%
  filter(dep_delay == 0) %>%
  head(10)

## What is the wind gust day in September?
weather %>%
  drop_na(wind_gust) %>%
  filter(month == 9) %>%
  select(year, month, day, wind_gust) %>%
  arrange(desc(wind_gust)) %>%
  head(10)

## Which the most plane flies and who is the manufacturer?
df %>%
  count(tailnum) %>%
  left_join(plances, by = "tailnum") %>%
  select(tailnum, n, manufacturer) %>%
  arrange(desc(n)) %>%
  drop_na() %>%
  head(10)
