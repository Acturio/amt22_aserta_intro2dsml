
#### Estructuras de control ####

### Estructura if

sal <- 5000 # Salario básico por semana
hlab <- 40 # Horas laboradas por semana

if (hlab > 40) {
  hext <- hlab - 40
  salext <- hext * 150
  sal <- sal + salext
}
sal


# if else
if (hlab > 40) {
  hext <- hlab - 40
  salext <- hext * 150
  sal <- sal + salext
} else {
 h_faltantes <- 40 - hlab
 sueldo_sobrante <- h_faltantes * sal/40
 sal <- sal - sueldo_sobrante
} # Cálculo de salario por horas trabajadas
sal


# else if
sal <- 5000 # Salario básico por semana
hlab <- 20 # Horas laboradas por semana

if (hlab > 40) {
 
   hext <- hlab - 40
   salext <- hext * 150
   sal <- sal + salext
   print(paste0("Pago semanal: $", sal))

  } else if (hlab < 16) {
 
   h_faltantes <- 40 - hlab
   sueldo_sobrante <- h_faltantes * sal/40
   sal <- sal - 1.05 * sueldo_sobrante
   print("despedido")
   print(paste0("liquidación: $", sal))
 
} else {
 
   h_faltantes <- 40 - hlab
   sueldo_sobrante <- h_faltantes * sal/40
   sal <- sal - sueldo_sobrante
   print(paste0("Pago con descuento: $", sal))

 }# Cálculo de salario por horas trabajadas




# Sección 2.6.3 - Instrucción ifelse

x <- c(5, 3, 2, 8, -4, 1)
ifelse(x %% 2 == 0, "Es par", "Es impar")


# Sección 2.6.4 - Instrucción for

nrep <- 10 # Número de repeticiones
n <- 100 # Tamaño de la muestra
conteo <- numeric(nrep) # Vector para almacenar el conteo
for (i in 1:nrep) {
  x <- runif(n = n, min = 1, max = 3)
  conteo[i] <- sum(x >= 2.5)
}
conteo # Para obtener el conteo


# Sección 2.6.5 - Instrucción while

resultados <- c("Cara", "Cruz")
sample(x = resultados, size = 1) # Prueba 1

num.lanza <- 0 # Contador de lanzamientos
num.caras <- 0 # Contados de caras obtenidas
historial <- NULL # Vector vacío para almacenar
while (num.caras < 5) {
  res <- sample(x = resultados, size = 1)
  num.lanza <- num.lanza + 1
  historial[num.lanza] <- res
  if (res == "Cara") {
    num.caras <- num.caras + 1
  }
}
historial

num.lanza


# Sección 2.6.6 - Instrucción repeat

x <- 3 # Valor de inicio
repeat {
  print(x)
  x <- x + 1
  if (x == 8) {
    break
  }
}

#### Ejercicios ####

# El participante escribirá en la siguiente sección su nombre y dará respuesta
# a los ejercicios solicitados con los datos que se muestran abajo:

# Combinar la estructura de un ciclo for con un if else para agregar dos columnas:
#
# Especificar en una columna llamada par si el número (num) es par o no lo es (TRUE/FALSE)
# Especificar el residuo entre cada número (num) y el valor 3

# Hint:
#
# for(i in nrow(data.frame)){
#
#  if (...){
#
#  ...
#
#  }
#  else({
#
#  ...
#
#  })
# }


datos <- data.frame(num = -10:10)
