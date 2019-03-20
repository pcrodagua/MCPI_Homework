# Decision Trees (Árboles de Desición)
data("iris")

data_iris <- iris
head(data_iris)

library(caret)
indices <- createDataPartition(y=data_iris$Species, p=0.7, list=FALSE)

train <- data_iris[indices,]
test <- data_iris[-indices,]

library(rpart)

model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
               method = "class",
               data = train)
plot(model, uniform = TRUE, main = "Decision Tree")
  text(model, use.n = TRUE,all=TRUE, cex = 0.8)
  
  
# Random Forest (Bosques Aleatorios)
