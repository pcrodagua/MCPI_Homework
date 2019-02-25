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

# TAREA: 
# Crear una función llamada unique que dado un vector 
# regrese un nuevo vector con los elementos del primer 
# vector con los elementos duplicados
# ejemplo: si le mando c(1,2,3,4,5,6,7,8)
unique <- function(vect){
	new_vect <- c()
	for (i in 1:length(vect)) {
		if (vect[i] %in% new_vect) {
			next()
		} else {
			new_vect <- c(new_vect, vect[i])
		}
	}
	return(new_vect)
}
unique(vect = c(1,1,2,2,2,3,3,3,3,4,4,4,4,4))


# Crear un función 'cuantas' que dado un vector y un entero 
# regrese cuantas veces aparece el entero dentro del vector
c <- c(1,2,3,4,5,5,5,5,6,7, 7)
cuantas <- function(vect_, num) {
	return(length(which(vect_==num)))
}
cuantas(c, 7)
