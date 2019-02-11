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
unique(vect = c(1,1,2,2,2,3,3,3,3,4,4,4,4,4))
unique(vect = c(1,1,2,2,2,3,3,3,3,4,4,4,4,4))
unique(vect = c(1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9))


# Crear un función 'cuantas' que dado un vector y un entero 
# regrese cuantas veces aparece el entero dentro del vector
vect_ <- c(1,2,3,4,5,5,5,5,6,7, 7,8,8,8,8)
cuantas <- function(vect_, num) {
	return(length(which(vect_==num)))
}
cuantas(vect_, 8) # 4
cuantas(vect_, 0) # 0
cuantas(vect_, 1) # 1

