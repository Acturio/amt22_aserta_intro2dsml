
#### 2.4 Estructuras de almacenamiento ####

### Sección 2.4.1 - Operadores de asignación

a <- 5.3 # Recomendado
4.6 -> b # No es usual
age = 25 # No recomendado

### Sección 2.4.2 - Variables

x <- 5
(2 * x) + 3

pais <- "México"
nchar(pais)

y <- 10
y == (5 + 3 + 2)

y != 5 + 5

### Sección 2.4.3 - Vectores

edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
sexo <- c("Hombre", "Mujer", "Hombre", "Hombre", "Mujer")

edad
deporte
sexo

edad[3]

sexo[c(2, 5)]

edad[2:50]

deporte[-3]

vec2 <- c("T","T", "F", "FALSE", 5, NA)
vec3 <- c(T,T, F, FALSE, 5, "hola")
vec4 <- c(10, 30, 20, "*") 


### Sección 2.4.4 - Matrices

mimatriz <- matrix(data = 1:20, nrow = 4, ncol = 5, byrow = FALSE)

mimatriz

mimatriz[3, 4]

mimatriz[2, ] 

mimatriz[, 5]

mimatriz[, -c(2, 4)]

mimatriz[, c(2, 4)]

mimatriz[c(2, 4), ]

mimatriz[-1, -3]

matriz2 <- matrix(data = c(4,3,6,7,8,4,4,3,5, 10), ncol = 5)
matriz2[1, 1] <- 5

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C.1", "C.2", "C.3")))
mdat


### Sección 2.4.5 - Arreglos

miarray <- array(data = letters[1:24], dim=c(3, 4, 2))

miarray

miarray[1, 3, 2]

miarray[,, 2]

miarray[, 3,]

miarray2 <- array(data = c(letters[1:12], 1:12), dim=c(3, 4, 2))

### Sección 2.4.6 - Data Frames

mi_data_frame <- data.frame(edad, deporte, sexo)

mi_data_frame

# Ejercicio: 
# 
# Extraer el tercer renglón 
# Extraer el tercer y quinto renglón
# Extraer la 1er y 1er columna

# Sección 2.4.7 - Listas

set.seed(12345)
mivector <- runif(n=5)
matriz2 <- matrix(data=1:12, ncol=6)

milista <- list(E1=mivector, E2=matriz2, E3=mi_data_frame)

milista

milista$E2

milista[[2]]

milista[2]

class(milista$E2)

class(milista[[2]])

class(milista[2])


length(mivector)
length(matriz2)
dim(matriz2)
length(milista)

length(milista[[1]])
class(milista[[1]])
class(milista[[2]])
length(milista[[2]])
dim(milista[[2]])

names(milista)

names(mi_data_frame)



#### Ejercicios ####

# El participante escribirá en la siguiente sección su nombre y dará respuesta 
# a los ejercicios de esta semana








