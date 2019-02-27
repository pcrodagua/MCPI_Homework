#--------------------------- rats 
data <- read.csv(file = "MyProyects/MCPI/MCPI_Homework/01_AyPD/Ejercicios/clase_04/rat_protein.csv", sep = ",", stringsAsFactors = FALSE)
df_rat <- data.frame(data)
ts_rat <- t.test(df_rat$high_protein, df_rat$low_protein, var.equal = TRUE)
ts_rat
#--------------------------- older adults
data_adults <- read.csv(file = "MyProyects/MCPI/MCPI_Homework/01_AyPD/Ejercicios/clase_04/adults_.csv", sep = ",", stringsAsFactors = FALSE)
df_adults <- data.frame(data_adults)
ts_adults <- t.test(df_adults$older_adults, df_adults$younger_adults, var.equal = TRUE)
ts_adults
