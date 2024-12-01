install.packages("plotly")
install.packages("dplyr")
install.packages("httpgd")
library(plotly)
library(dplyr)


IBM <- read.csv("IBM.csv")
ls(IBM)

IBM$Date <- as.Date(IBM$Date) #fix date 
plot_ly(data=IBM, x=~Date,open=~Open, close=~Close, high=~High, low=~Low, type='ohlc') %>%
layout(
    title = "IBM 2018",
    yaxis = list(range = c(110, 170))  # Set y-axis range
  )

plot_ly(mtcars, x=~factor(gear), y= ~hp, color= ~factor(cyl), type='bar')

# Create a Plotly bar plot with a new column indicating if 'cyl' is greater than 4
plot_ly(
  data = mtcars %>%
    mutate(cyl_over_4 = cyl > 4),  # Create new column in the plot data
  x = ~factor(gear), 
  y = ~hp, 
  color = ~cyl_over_4,  # Use the new column for coloring
  type = 'bar'
    )