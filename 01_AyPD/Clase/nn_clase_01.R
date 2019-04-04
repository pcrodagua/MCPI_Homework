train <- read.csv(file = 'Proyects/MCPI_Homework/01_AyPD/Clase/train.csv', stringsAsFactors = FALSE)
datos <- data.frame(train$Survived, train$Pclass, train$Sex, train$Age)

colnames(datos) <- c('vivo', 'clase', 'sexo', 'edad')

datos$sexo <- lapply(datos$sexo, as.character)
datos$sexo[datos$sexo == 'male'] <- 1
datos$sexo[datos$sexo == 'female'] <- 0
datos$sexo <- as.numeric(datos$sexo)
datos <- datos[!is.na(datos$edad),]

# neural nets
library(neuralnet)
n <- names(datos)
# dificil pero mejor
f <- as.formula(
  paste('vivo~', 
        paste(n[! n %in% 'vivo'], 
              collapse = '+')))
# fácil pero lento
ff <- as.formula('vivo~ clase + sexo + edad')

nn <- neuralnet(ff, data=datos, hidden=c(5, 3), linear.output = FALSE, act.fct = 'logistic', stepmax=1e6)

plot(nn)

predicciones <- unlist(nn$net.result)
comparar <- data.frame(predicciones, datos$vivo)

library(pROC)
rocc_train <- roc(comparar$datos.vivo,
                  comparar$predicciones,
                  levels=c(0, 1), plot=TRUE, ci=TRUE, smooth=FALSE, direction='auto',
                  col='black', main='Desempeno de redes neuroanles')