dataset = read.csv(file = 'Proyects/MCPI_Homework/01_AyPD/Clase/compentencia/cancer.csv', stringsAsFactors = FALSE) 
str(dataset)

# DATA PREPROCESSING

dataset$Diagnosis <- lapply(dataset$Diagnosis, as.character)
dataset$Diagnosis[dataset$Diagnosis == 'M'] <- 1
dataset$Diagnosis[dataset$Diagnosis == 'B'] <- 0
dataset$Diagnosis <- as.numeric(dataset$Diagnosis)
dataset <- dataset[!is.na(dataset$Diagnosis),]

dataset <- dataset[2:length(dataset)]

# ENCODE AS factor(
dataset$Diagnosis <- factor(dataset$Diagnosis, levels = c(0,1))


# DATA SPLITTING
library(caTools)
set.seed(123) 
split = sample.split(dataset$Diagnosis, SplitRatio = 0.70) 

training_set = subset(dataset, split == TRUE) 
test_set = subset(dataset, split == FALSE)

# FEATURE SCALING


# PROCESSING
library(e1071) 

classifier = svm(formula = Diagnosis ~ ., # concavity + concave.points + area + smoothness, 
                 data = training_set, 
                 type = 'C-classification', 
                 kernel = 'linear') 

# Predicting the Test set results 
y_pred = predict(classifier, newdata = test_set) 
y_pred
# confussion matrix
cm = table(test_set[, length(data_)], y_pred)
cm

fitted.results <- ifelse(y_pred > 0.5, 1, 0)
miss.classified.error <- mean(y_pred != test_set$Diagnosis)
print(paste('Acurracy', 1 - miss.classified.error))
