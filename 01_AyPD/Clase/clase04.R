
train_data <- read.csv(file = 'Proyects/MCPI_Homework/01_AyPD/Clase/compentencia/cancer.csv', na.strings = c(""), header = TRUE, stringsAsFactors = TRUE)

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
is.factor(data_subset$Diagnosis)

# Check categorical data econdeing for better understanding

contrasts(data_subset$Diagnosis)

# Remove rows (embarked) with NAs
data_subset <- data_subset[!is.na(data_subset$Diagnosis), ]
rownames(data_subset) <- NULL

data_subset$Diagnosis <- lapply(data_subset$Diagnosis, as.character)
data_subset$Diagnosis[data_subset$Diagnosis == 'M'] <- 1
data_subset$Diagnosis[data_subset$Diagnosis == 'B'] <- 0
data_subset$Diagnosis <- as.numeric(data_subset$Diagnosis)
data_subset <- data_subset[!is.na(data_subset$Diagnosis),]

data_subset <- data_subset[2:length(data_subset)]

# Train and test splitting
library(caTools)
set.seed(123) 
split = sample.split(data_subset$Diagnosis, SplitRatio = 0.70) 

train = subset(data_subset, split == TRUE) 
test = subset(data_subset, split == FALSE)




prop.table(table(train$Diagnosis))
# -----------------------


# model fitting
model <- glm(Diagnosis ~., family=binomial(link = 'logit'), data=train )
summary(model)


# ---------------------------------------------------------------------------
# MEASURING THE PREDICTIVE ABILITY OF THE MODEL

# If prob > 0.5 then 1, else 0. Threshold can be set for better re

fitted.results <- predict(model,
                          newdata = subset(test),
                          type='response'
)


fitted.results <- ifelse(fitted.results > 0.5, levels=c(FALSE, TRUE), labels = c("B","M"))
miss.classified.error <- mean(fitted.results != test$Diagnosis)
print(paste('Acurracy', 1 - miss.classified.error))
# ---------------------------------------------------------------------------
