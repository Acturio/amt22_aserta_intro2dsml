

# nombre_de_funcion <- function(parametro1, parametro2, ...) {
#   tareas internas
#   tareas internas
#   tareas internas
# 
#   return(salida)
# }


# nombre_de_funcion(c(1,2,3,4,5))





#### Funciones ####

notas <- c(4.0, 1.3, 3.8, 2.0)  # Notas de un estudiante
mean(notas)

6 + 4

a <- c(1, 3, 2)
b <- c(2, 0, 1)  # a y b de la misma dimensión

a + b

a - b

a * b 

b * a

a / b 

a ^ b 

7 %/% 3

7 %% 3

### Sección 2.5.3 - Pruebas lógicas

5 < 12
x <- 5
y <- 20 / 4
x == y

a <- c(1, 3, 2)
b <- c(2, 0, 1)
a > b  
a == b

### Sección 2.5.4 - Operadores lógicos

ans <- c(TRUE, FALSE, TRUE)
!ans

x <- c(5, 1.5, 2, 3, 2)
!(x < 2.5) 

x <- c(5, 1.5, 2)  
y <- c(4, 6, 3)

x < 4 
y > 5
x < 4 & y > 5  # evalua todas las entradas del vector
x < 4 && y > 5 # evalúa primer elemento de izquierda a derecha

### Sección 2.5.5 - Funciones sobre vectores

myvec <- c(5, 3, 2, 1, 2, 0, NA, 0, 9, 6)
myvec

min(myvec)

min(myvec, na.rm = TRUE)

max(myvec, na.rm = T)

range(myvec, na.rm = T) 

sum(myvec, na.rm = T)

prod(myvec, na.rm = T)

which.min(myvec)

which.max(myvec)


# Sección 2.5.6 - Función rep

rep(x=1:4, times=2)

rep(x=1:4, times=c(2,2,2,2))

rep(x=1:4, times=c(2,1,2,1))

rep(x=1:4, each=2)

# Sección 2.5.7 - Función seq

seq(from=0, to=1, length.out = 11)

seq(from=1, to=9, by=2) 

seq(from=1,to=9, by=pi)

2:8

3:-5

pi:6 

6:pi

#### Ejercicios ####

# El participante escribirá en la siguiente sección su nombre y dará respuesta 
# a los ejercicios de la sección 2.5.8

































