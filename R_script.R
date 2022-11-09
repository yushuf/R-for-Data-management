# Author: Yushuf Sharker
# Date: 8/15/2022
# Purpose: R workshop

rm(list = ls())
setwd("Q:/Scientific/YS/R_workshop")


# R Functions
c(2, 3, 5, 6)
mean(c(2, 3, 5, 6))
mean(c(2, 3, 5, NA), na.rm = TRUE)
date()
dir()

# Packages
install.packages("dplyr") # One time
library("dplyr")
remove.packages("dplyr")

# Working Directory
getwd() # current working directory
setwd("Q:/Scientific/YS/R_workshop") # Copy the address from windows explorer
# replace \ with /

# Saving and loading works
save.image(file = 'myEnvironment.RData') # where it will be saved?

# Suppose you already have an image file by name "myEnvironment.RData". You have
# to replace the previous with a new data.
load("myEnvironment.RData")

################################################################################
# Objects in R
#   Vector
1:10
c(1:10, 20:25)
Sex <- c(2 , 2, 2, 1, 2, 1, 2, 1, 1, 2, 2, 2, 2, 1, 2, 2)
clusterID <-
  c(
    "C3",
    "C3",
    "C3",
    "C3",
    "C3",
    "C1",
    "C1",
    "C1",
    "C1",
    "C1",
    "C2",
    "C2",
    "C2",
    "C2",
    "C2",
    "C3"
  )
clusterIDNA <-
  c("C3",
    "C3",
    "",
    "C3",
    "C3",
    "C1",
    "C1",
    "C1",
    "C1",
    "C1",
    "C2",
    "C2",
    "C2",
    "C2",
    "C2",
    "")
age <- c(30,
         36,
         25,
         19,
         18,
         29,
         20,
         25,
         35,
         28,
         18,
         30,
         47,
         18,
         20,
         40)
pain <- c(1, 1, 3, 3, 3, 3, 3, 1, 1, 3, 3, 1, 3, 3, 3, 1)

painYn <- c(0,
            0,
            1,
            1,
            1,
            1,
            1,
            0,
            0,
            1,
            1,
            0,
            1,
            1,
            1,
            0)

marital <-
  c(1,
    1,
    1,
    4,
    4,
    1,
    1,
    1,
    1,
    1,
    4,
    1,
    3,
    4,
    1,
    2)

householdID <- c(
  "I0008",
  "I0016",
  "I0024",
  "I0032",
  "I0041",
  "I0736",
  "I0744",
  "I0753",
  "I0760",
  "I0768",
  "I1456",
  "I1464",
  "I1472",
  "I1480",
  "I1491",
  "I0048"
)

ageNA <- c(30,
           36,
           25,
           19,
           18,
           29,
           20,
           25,
           35,
           NA,
           18,
           30,
           47,
           18,
           20,
           40)
sort(clusterID) 
# Challange sort in decreasing order
table(clusterID)
length(clusterID)
length(clusterIDNA)

# Mathematical operations
age + 1
age + rep(1, length(age))
age * 2
age ^ 2
ageNA + 1
summary(age)
summary(ageNA)
! ("C3" %in% clusterID)
age / 7!

# Conditional operations
age >28

# invalid mathematical operations
Sex + 1
Sex ^ 2
summary(Sex)
# Do you feel any problem?

# Check vectors type
class(Sex)
class(age)
str(Sex)
str(ageNA)

# Let us fix the type of vectors
Sex <- factor(
  x = Sex,
  levels = c(1, 2),
  labels = c("Male", "Female")
)

pain <- factor(
  x = pain,
  levels = c(1, 2, 3),
  labels = c("No Pain", "Mild Pain", "Severe Pain"),
  ordered = TRUE
)

marital <- factor(
  x = marital,
  levels = c(1, 2, 3, 4),
  labels =  c("Married", "Divorced", "Widow(er)", "Never Married")
)

painYn <-
  as.logical(x = painYn) # Also see as.factor, as.numeric(), as.character()

vec_test <- c(1:14, "b", "c") # what would be the type of vector
# Can you make them numeric
# what is the impact of forcing them to be numeric

str(Sex)
summary(Sex)
Sex ^ 2

# Attributes and sub-setting, Extract elements from vectors
Class(Sex)
class(age)
Sex[1:4]
Sex[age > 28]
cbind(age, Sex)
Sex[1]
c(Sex[1], age[1])



# Data frame
dat <- data.frame(clusterID, householdID, age, Sex, pain, painYn)
names(dat)
names(dat) <- c("a", "B", "C", "d", "E", "f")

# attributes
nrow(dat)
ncol(dat)
class(dat)
str(dat)
head(dat)
tail(dat)
# Challenge: write code to see how How many missing in the data frame

dat$clusterID
dat[["clusterID"]]
dat[[1]]
dat[, 1]
dat[2, 2]
dat[1, ]
dat[age > 20, ]
dat[age > 20, "Sex"]
dat[age > 20, c("Sex", "age")]
dat[age > 20, 2:3] # do you notice any limitations with this one
with(dat, summary(Sex))

dat2 <-
  data.frame(
    a = c(1, 2),
    age = c(28, 30),
    clusterID = c("C3", "C1")
  )
dat2 <-
  data.frame(
    Sex = c(1, 2),
    age = c(28, 30),
    clusterID = c("C3", "C1")
  )

cbind(dat, ageNA)
rbind(dat, dat2)

list_dat <-
  list(
    df = dat,
    df2 = dat2,
    mat = matrix(c(3, 9, 5, 1, -2, 8), nrow = 2),
    vec = ageNA,
    vec_test
  )
names(list_dat)
list_dat$df
list_dat[[2]]
class(list_dat[[2]])
###############################################################################

# Day 2
#	%>% pipes
# Read a data file
rm(list = ls())
setwd("Q:/Scientific/YS/R_workshop")

# Loading necessary libraries for data processing and analysis
library(tidyverse)

# Importing a csv file into R working environment
dfSession4a <- read_csv(file = "data_1.csv")

dfSession4a <- readxl::read_xlsx(path =  "data_2.xlsx", sheet = "Sheet1")
help("read_xlsx") # you migh have some more flexibility with excel files

# Checking variable properties and first few data points
glimpse(dfSession4a)

# Defining appropriate measurement scale for "sex"
# "pain" and "marital"
dfSession4a <- dfSession4a %>%
  mutate(
    sexNominal = factor(
      x = sex,
      levels = c(1, 2),
      labels = c("Male", "Female")
    ),
    painOrdinal = factor(
      x = pain,
      levels = c(1, 2, 3),
      labels = c("No Pain", "Mild Pain", "Severe Pain"),
      ordered = TRUE
    ),
    maritalNominal = factor(
      x = marital,
      levels = c(1, 2, 3, 4),
      labels =  c("Married", "Divorced", "Widow(er)", "Never Married")
    )
  )

# Defining appropriate measurement scale for painYn variable
dfSession4a <- dfSession4a %>%
  mutate(painYn = as.logical(x = painYn))

# Exporting processed data into a csv file
write_csv(x = dfSession4a,
          file = "df_session4_processed_data.csv")


# At a single command using pipeline
read_csv(file = "data_1.csv") %>%
  mutate(
    sexNominal = factor(
      x = sex,
      levels = c(1, 2),
      labels = c("Male", "Female")
    ),
    painOrdinal = factor(
      x = pain,
      levels = c(1, 2, 3),
      labels = c("No Pain", "Mild Pain", "Severe Pain"),
      ordered = TRUE
    ),
    maritalNominal = factor(
      x = marital,
      levels = c(1, 2, 3, 4),
      labels =  c("Married", "Divorced", "Widow(er)", "Never Married")
    )
  ) %>%
  mutate(painYn = as.logical(x = painYn)) %>%
  
  write_csv(., file = "df_session4_processed_data.csv")

help(mutate) #explore
# without changing the original R environment, we can write the data


# Extract and arrange cases
filter(.data = dfSession4a, age > 25, sexNominal == "Male")
dfSession4a %>% filter(age > 25, sexNominal == "Male") # explore slice or
dfSession4a %>% filter(age > 25) %>% slice(c(3, 8))

help("table")
table(dfSession4a$sexNominal)
with(dfSession4a, table(sexNominal))
dfSession4a %>% with(., table(sexNominal))

# Subsetting columns
dfSession4a %>%
  select(clusterID, householdID, age, sexNominal) %>%
  group_by(sexNominal) %>%
  summarize(n = n(), mean_age = mean(age))


# bind columns independently and bind cols by relation
df1 <- data.frame(team = c('A', 'A', 'B', 'B'),
                  points = c(12, 14, 19, 24))


df2 <- data.frame(team = c('A', 'B', 'C', 'C'),
                  points = c(8, 17, 22, 25))

df3 <- data.frame(team = c('A', 'B', 'C', 'C'),
                  assists = c(4, 9, 12, 6))
bind_rows(df1, df2, df3)

bind_cols(df1, df2, df3)

# Merge
# https://www.guru99.com/r-dplyr-tutorial.html#:~:text=The%20beauty%20of%20dplyr%20is%20that%20it%20handles,To%20merge%20two%20datasets%20and%20keep%20all%20observations.
# You must have the unique id filed

df_primary <- tribble(~ ID, ~ y,
                      "A", 5,
                      "B", 5,
                      "C", 8,
                      "D", 0,
                      "F", 9)
df_secondary <- tribble(~ ID, ~ z,
                        "A", 30,
                        "B", 21,
                        "C", 22,
                        "D", 25,
                        "E", 29)

df_primary %>% left_join(df_secondary, by ='ID')
right_join(df_primary, df_secondary, by ='ID')
full_join(df_primary, df_secondary, by ='ID')
inner_join(df_primary, df_secondary, by ='ID')

# Multiple id variable
df_primary <- tribble(
  ~ID, ~year, ~items,
  "A", 2015,3,
  "A", 2016,7,
  "A", 2017,6,
  "B", 2015,4,
  "B", 2016,8,
  "B", 2017,7,
  "C", 2015,4,
  "C", 2016,6,
  "C", 2017,6)
df_secondary <- tribble( 
  ~ID, ~year, ~prices,
  "A", 2015,9,
  "A", 2016,8,
  "A", 2017,12,
  "B", 2015,13,
  "B", 2016,14,
  "B", 2017,6,
  "C", 2015,15,
  "C", 2016,15,
  "C", 2017,13
  )
left_join(df_primary, df_secondary, by = c('ID'))

duplicated(
  select(df_primary, c("ID", "year"))
  )


# The term is popular by the name of reshape

# https://datacarpentry.org/R-ecology-lesson/03-dplyr.html
pivot_longer(
  bind_cols(df1, df2, df3),
  cols = c("team...1", "team...3", "team...5"),
  names_to = "team",
  values_to = "Values"
)
# little more advance
lon_dat <- pivot_longer(
  bind_cols(df1, df2, df3),
  cols = c("team...1", "team...3", "team...5"),
  names_prefix = "team...",
  names_to = "team",
  values_to = "Values"
) %>%
  pivot_longer(
    cols = starts_with("points"),
    names_prefix = "points...",
    names_to = "point",
    values_to = "values_point"
  )


# Long to wide
pivot_wider(
  lon_dat,
  id_cols = NULL,
  names_from = "team",
  values_from = "Values"
)

lon_dat %>%
  pivot_wider(
    id_cols = NULL,
    names_from = "team",
    values_from = "Values",
    names_prefix = "team..."
  )
###############################################################################

# Session 3
# use iris data
# Writing custom functions
# split, group_split
# looping lapply, sapply
# Similar command is map in tidyverse
# Please look at the best practices for writing functions
data(iris)

fCV <- function(numVec) {
  avg <- mean(numVec)
  std <- sd(numVec)
  cv <- std / avg
  return(CV = cv)
}
fCV(iris$Sepal.Length)


fCV <- function(numVec) {
  avg <- mean(numVec)
  std <- sd(numVec)
  cv <- std / avg
  return(c(avg, std, cv))
}
fCV(iris$Sepal.Length)

Ys <- function(numVec) {
  avg <- mean(numVec)
  std <- sd(numVec)
  cv <- std / avg
  return(
    c(
    Average = avg,
    STD = std,
    CV = cv
  )
  )
}
Ys(iris$Sepal.Length)



# argumet 1: dframe is a dataframe of all numeric columns
# output: return the column means
fcolmean <- function(dframe) {
  avg <- colMeans(dframe)
  return(avg)
}
fcolmean(iris[1:4])

fcolmean2 <- function(dframe) {
  avg <- apply(dframe, 2, median)
  return(avg)
}
fcolmean2(iris[1:4])

# repeat functions for multiple data 
group_split(iris, Species)
x <-
  lapply(group_split(iris, Species), function(i)
    fcolmean(i[1:4]))
x <-
  sapply(group_split(iris, Species), function(i)
    fcolmean(i[1:4]))

group_split(iris, Species) %>% map( ~ fcolmean(.[1:4]))
group_split(iris, Species) %>% map_dfr( ~ fcolmean(.[1:4]))

# please explore mapply
# for parallel processing, mclapply, and parLapply 
# A few more variants of map Other map variants: imap(), invoke(), 
# lmap(), map2(), map_if(), modify(). Basic structure remains the same
# map2() is a bit advanced command that applied to the functions using two lists
# pmap is for many lists.

# When execution is conditional
if (test_expression) {
  statement
}

if (iris$Species[20] == "setosa") {
  print ("t")
}

if (iris$Species[140] == "setosa") {
  print ("t")
} else {
  print ("F")
}

x <- -5
if (x > 0) {
  print("Non-negative number")
} else {
  print("Negative number")
}

x <- 2
if (x == 1) {
  group_split(iris, Species) %>% map_dfr( ~ fcolmean(.[1:4]))
  
} else {
  group_split(iris, Species) %>% map_dfr( ~ fcolmean2(.[1:4]))
}

# Few more conditional statement
which(iris$Petal.Width > 2)
rowSums(iris[which(iris$Petal.Width > 2), 1:4])# executes statement 3, sd
test <- 3  
switch(test, mean(iris$Petal.Length), median(m1$elev), sd(m1$elev)) 
# statement #3, sd()
rowSums(iris[which(iris$Petal.Width > 2), 1:4])


# Get data using Redcap API

token <- "token" # obtain it from the redcap admin
url <- "https://cri-datacap.org/api/"
formData <- list(
  "token" = token,
  content = 'report',
  format = 'json',
  report_id = '13630',
  # refers to the demographic report
  csvDelimiter = '',
  rawOrLabel = 'raw',
  rawOrLabelHeaders = 'raw',
  exportCheckboxLabel = 'false',
  returnFormat = 'json'
)
response <- httr::POST(url, body = formData, encode = "form")
result <- as.tibble(do.call(rbind, httr::content(response)))
glimpse(result)


# Multiple records from the redcap
formData <- list(
  "token" = token,
  content = 'record',
  action = 'export',
  format = 'json',
  type = 'flat',
  csvDelimiter = '',
  'records[0]' = 'POST-RES-0093',
  'records[1]' = 'POST-RES-0094',
  'records[2]' = 'POST-RES-0096',
  'records[3]' = 'POST-RES-0097',
  'records[4]' = 'POST-RES-0099',
  'records[5]' = 'POST-RES-0101',
  'records[6]' = 'POST-RES-0102',
  #'forms[0]'='cesd',###
  rawOrLabel = 'raw',
  rawOrLabelHeaders = 'raw',
  exportCheckboxLabel = 'false',
  exportSurveyFields = 'false',
  exportDataAccessGroups = 'false',
  returnFormat = 'json'
)
response <- httr::POST(url, body = formData, encode = "form")
result <- as.data.frame(do.call(rbind, httr::content(response)))
glimpse(result)