
train_data <- read.csv(file = 'Proyects/MCPI_Homework/01_AyPD/Clase/train.csv', na.strings = c(""), header = TRUE, stringsAsFactors = TRUE)

# output the number of missing values for each column
sapply(train_data, function(x) sum(is.na(x)))

# quick check for how many different values for each feature
sapply(train_data, function(x) length(unique(x)))

# visual way to check missing data
# install.packages('Amelia')
library(Amelia)
missmap(train_data, main="Missing Values")

# subset of datea
data_subset <- subset(train_data, select = c(2, 3, 5, 6, 7, 8, 10, 12))

# remove na's in data with missing values
data_subset$Age[is.na(data_subset$Age)] <- median(data_subset$Age, na.rm = TRUE)

# R should automaticallly code embarked as factor().
is.factor(data_subset$Sex)
is.factor(data_subset$Embarked)

# Check categorical data econdeing for better understanding

contrasts(data_subset$Sex)
contrasts(data_subset$Embarked)

# Remove rows (embarked) with NAs
data_subset <- data_subset[!is.na(data_subset$Embarked), ]
rownames(data_subset) <- NULL

# Train and test splitting
train <- data_subset[1:775,]
test <- data_subset[776:889,]
#train <- data_subset[1:800,]
#test <- data_subset[801:889,]
prop.table(table(train$Survived))
# -----------------------


# model fitting
model <- glm(Survived ~Pclass + Sex + Age + SibSp  + Parch + Embarked, family=binomial(link = 'logit'), data=train )
summary(model)


# ---------------------------------------------------------------------------
# MEASURING THE PREDICTIVE ABILITY OF THE MODEL

# If prob > 0.5 then 1, else 0. Threshold can be set for better re

fitted.results <- predict(model,
                          newdata = subset(test, select = c(2,3,4,5,6,7,8)),
                          type='response'
                          )

fitted.results <- ifelse(fitted.results > 0.5, 1, 0)
miss.classified.error <- mean(fitted.results != test$Survived)
print(paste('Acurracy', 1 - miss.classified.error))
# ---------------------------------------------------------------------------
