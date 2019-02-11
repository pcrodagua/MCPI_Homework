# Ejercicio 01: utilizar repeat 
i <- 0
repeat{
	i <- i +1
	if (i %% 2 == 0) {
		print(i)
	} 
	if(i == 10){
		break
	}
}

# Ejercicio 02: 
i <- 1
msg <- c('hello')
repeat{
	print(msg[1])
	if(i == 5){
		break
	}
	i <- i +1
}

# Ejercicio 03:
i <- 1
while (i <= 7) {
	if (i %% 2 != 0)
		print(i)
	i <- i +1
}

# Ejercicio 04:
i <- 1
while (i <= 6) {
	print(msg)
	i <- i +1
}

# Ejercicio 04:
x <- c(7, 4, 3, 8, 9, 25)
for (i in 1:4) {
	print(x[i])
}

# Ejercicio 05:
sum_function <- function(x1, x2) {
	return (x1 + x2)
}
print(sum_function(1,2))

in_vector <- function(num, vect) {
	return (num %in% vect) 
}
print(in_vector(100, c(2,3,4,5,6,7)))
print(in_vector(3, c(2,3,4,5,6,7)))

# Ejercicio 06:
a <- c(1,2,3,4,5,6,7,8,9, 10)
b <- c(1L:10L)
c <- c()
df <- data.frame(a, b)

print_colname <- function(dataf){
	colnames_ <- names(dataf)
	coltype_  <- sapply(dataf, class)
	for (i in 1:ncol(dataf)) {
		print(colnames_[i])
		print(coltype_[i])
	}
}

print_colname(df)

