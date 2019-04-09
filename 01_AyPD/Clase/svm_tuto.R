datos <- read.delim(file = 'Proyects/MCPI_Homework/01_AyPD/Clase/caballos.txt')

library(e1071) # SVM

class(datos$Height)
class(datos$Weight)
class(datos$animal)

datos$animal <- as.character(as.factor(datos$animal))

plot(datos[,-3], col=1.5, pch=19)

model_svm <- svm(animal ~., data=datos, 
                 type = 'C-classification', 
                 kernel = 'linear', 
                 scale = FALSE)
summary(model_svm)

# plot
points(datos[model_svm$index, c(1, 2)], col='red', cex=2, lwd=1.5)

# parametes of the hyperplane
w <- t(model_svm$coefs)%*%model_svm$SV
b <- -model_svm$rho

# hyperplane
abline(a = -b/w[1, 2], b=-w[1, 1]/w[1, 2], col='red', lty=3)


# NEW
nuevos <- data.frame(
  Height=c(67, 121, 100),
  Weight=c(121, 190, 100))

clase <- as.numeric(as.character(datos$animal))
# old
plot(datos[, -3], col=(clase + 3)/2, pch=19, xlim=c(0, 250), ylim=c(0,250))

# graficando los datos nuevo y viejos
# sobreponer datos nuevos sobre los viejos
points(nuevos[1, ], col='green', pch=19)
points(nuevos[2, ], col='blue', pch=19)
points(nuevos[3, ], col='pink', pch=19)
# hyperplane
abline(a = -b/w[1, 2], b=-w[1, 1]/w[1, 2], col='red', lty=3)
predict(model_svm, nuevos)
