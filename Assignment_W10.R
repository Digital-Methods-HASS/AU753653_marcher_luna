### answers for the assignment

## Q1 Use R to figure out how many elements in the vector below are greater than 2.
rooms <- c(1, 5, 2, 3, 1, NA, 3, 1, 3, 2, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA, 4, 3 ,1 ,7 ,2 ,1 ,NA ,1, 1, 3) # creates vector
rooms_no_na <- rooms[!is.na(rooms)] # creates vector without missing data
length(which(rooms_no_na>2)) # counts elements (excluding NA)
# answer: there is 13 elements greater than 2 in the rooms-vector

## Q2 Which function tells you the type of data the 'rooms' vector above contains?
typeof(rooms)
# answer: the data type is "double"

## Q3 What is the result of running the median() function on the above 'rooms' vector?
median(rooms) # will not work because of missing data
median(rooms, na.rm = TRUE) # excludes the missing data
median(rooms_no_na) # same answer as above
# answer: result of the given vector is NA. The median of the room-vector without missing data is 2

## Q4 install packages and downloade data
install.packages("tidyverse")
install.packages("here")
download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv",
  "data/SAFI_clean.csv", mode = "wb"
)
library(tidyverse)
library(here)

interviews <- read_csv(
  here("data", "SAFI_clean.csv"), 
  na = "NULL")

## Q5 
danish_monarchs <- read_csv2(here("data", "danish_monarchs.csv"))
danish_monarchs$reign_length <- danish_monarchs$Reign_End - danish_monarchs$Reign_start # new variable
mean(danish_monarchs$reign_length, na.rm = TRUE) # calculates mean
median(danish_monarchs$reign_length, na.rm = TRUE) # calculates median
summary(danish_monarchs$reign_length) # or just this for basic statistics
# answer: the mean is 20.9 years and the median is 21 years