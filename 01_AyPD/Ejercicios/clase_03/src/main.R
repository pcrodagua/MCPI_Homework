setwd("Dropbox/MCPI/SEM_01/01_AyPD/Ejercicios/clase_03/src/")
data <- read.csv(file = "../data/data_cohb.csv", stringsAsFactors = FALSE)
data_cohb <- data.frame(data)
str(data_cohb)

mean_ <- function(data) {
	sum_ = 0.0
	for (i in length(data)) {
		sum_ = sum + i
	}
	return( sum_/length(data))
}

mean_()