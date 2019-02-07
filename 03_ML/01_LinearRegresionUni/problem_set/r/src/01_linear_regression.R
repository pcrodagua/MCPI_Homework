library(ggplot2)

x_values <- c(seq(1970,2020, by=10))
y_values <- c(11, 14, 18, 23, 29, 36)
data_ <- data.frame(x_values, y_values)
model <- lm(y_values ~ x_values, data = data_)
summary(model)

plot(data_, pch = 16, col = "blue") #Plot the results
abline(model) #Add a regression line
