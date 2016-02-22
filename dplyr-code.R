# This exercise can be run entirely on `try.jupyter.org`

####Part A. Data preparation 
# 1. First we load the two packages that we are going to use: *dplyr* and *nycflights13*. There will be a warning message that we can ignore.

library(dplyr)
library(nycflights13)

# 2. We will use the ***flights*** data set on *nycflights13*. To find out the number of rows (cases) and columns (variables) we can use the `dim()` command. The `summary()` command will give us a summary of the data.

dim(flights)
summary(flights)
glimpse(flights)

# 3. For ease of use, lets just work with 5 cases. We can use the `select_n()` command to select 5 cases from the data set.

set.seed(123)
data <- sample_n(flights, 5)

#### Basic method of use select() 
# 4. Here we can select a set of variables by name

select(data, year)
select(data, year, month, day)
select(data, year:day)

select(data, -year, -month, -day)
select(data, -(year:day))

# 5. We can also select a set of variables by index.

select(data, 1, 2, 3)
select(data, 1:3)

select(data, -1, -2, -3)
select(data, -(1:3))

# 6. Extending the last two examples to more advanced examples.

select(data, year:day, -month)
select(data, -(year:day), month)
select(data, 1:3, -2)
select(data, -(1:3), 2)

# 7. Selecting variables based on characteristics of the variable name

# Utility functions of select()
select(data, starts_with("arr"))
select(data, ends_with("time"))
select(data, contains("_"))
select(data, matches("^(dep|arr)_"))

8. Useful for similar variable names, that differ by numbers at the end.

data2 <- data
colnames(data2) <- sprintf("x%d", 1:16)
select(data2, num_range("x", 8:11))
select(data2, num_range("x", c(9, 11)))


data3 <- data
colnames(data3) <- sprintf("x%02d", 1:16)
select(data3, num_range("x", 8:11, width=2))


col_vector <- c("year", "month", "day")
select(data, col_vector)
select(data, one_of(col_vector))


select(data, everything())

select(data, -starts_with("arr"))

#### Part C Standard evaluation


select_(data, "year", "month", "day")


col_vector <- c("year", "month", "day")
select_(data, .dots = col_vector)


select_(data, 'year:day')
select_(data, 'year:day', '-month')
select_(data, '-(year:day)')
select_(data, 'starts_with("arr")')
select_(data, '-ends_with("time")')


select_(data, .dots = c('starts_with("arr")', '-ends_with("time")'))
