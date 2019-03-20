# ejemplo de correlación

data('mtcars')
my_data <- mtcars[]
data <- my_data[,c(1,3,4,5,6,7)]
head(data)

# correlación entre todas las variables
round(cor(x = data, method = "pearson"), 2)
round(cor(x = data, method = "kendall"), 2)
round(cor(x = data, method = "spearman"), 2)

# correlación entre dos variables
cor(x = data$mpg, y = data$wt, method = "spearman")


library("ggpubr")
ggscatter(data, x = "mpg", y = "wt", add="reg.line", 
          cor.coef = TRUE, 
          cor.method = "pearson",
          xlab = "MPG (x)",
          ylab = "Peso (y)",
          conf.int = FALSE)

ggscatter(data, x = "wt", y = "disp", add="reg.line", 
          cor.coef = TRUE, 
          cor.method = "pearson",
          xlab = "Peso (x)",
          ylab = "Desplazamiento (y)",
          conf.int = FALSE)

ggscatter(data, x = "hp", y = "disp", add="reg.line", 
          cor.coef = TRUE, 
          cor.method = "pearson",
          xlab = "MPG (x)",
          ylab = "Peso (y)",
          conf.int = FALSE)
