x_values <- c(seq(1970,2020, by=10))
y_values <- c(11000, 14000, 18000, 23000, 29000, 36000)
data_ <- data.frame(x_values, y_values)
model <- lm(y_values ~ x_values, data = data_)
summary(model)

plot(data_, pch = 16, col = "blue") #Plot the results
abline(model) #Add a regression line

print("Para el 2050 se estima un valor de: ")
print(-975666.67 + (500*2050))
