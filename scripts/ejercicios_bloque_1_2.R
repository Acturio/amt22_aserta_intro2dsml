# HORA DE PRACTICAR #

#### Funciones ####

# 1.0 - Crear una función que realice el promedio de números ingresados en un vector

# Ejemplo:
# 
media <- function(x, y){
 
 promedio <- (x + y)/2

  return(promedio)
}

media(1,5)

# P.D. No se vale usar la función "mean()" que ya existe en R

# Opciones:
#  1.- usar la función "sum()" y "length()" 
#  2.- Iterar sobre el vector e ir sumando los elementos uno por uno



#### Operaciones vectoriales ####

# 2.0 - Calculemos los bonos y descuentos a cada uno de los colaboradores la nómina

colaborador <- c("Karina", "Oscar", "Alex", "Diana", "Reynaldo", "Cinthia", 
                 "Carlos", "Ana", "Erik", "Iván", "Victor", "Julio")
sueldo <- c(60000, 21500, 70000, 18000, 30000, 15000, 45000, 28000, 48000, 31500, 
            19000, 24000)
nivel <- c("N3", "N2", "N3", "N1", "N2", "N1", "N2", "N1", "N3", "N2", "N1", "N2")
horas_sem <- c(60, 40, 30, 40, 50, 30, 55, 45, 40, 55, 40, 45)
horas_extra <- c(200, 100, 80, -24, 60, -8, 150, 160, 0, -16, 0, -4)

nomina <- data.frame(colaborador, nivel, sueldo, horas_sem, horas_extra)
nomina

# Paso 1: Calcular las horas de trabajo de 1 mes. Hint: Horas_sem/5 * 23
#         Supuesto: Pago calculado por 23 días laborales al mes



# paso 2: Calcular el pago por hora de cada colaborador



# Paso 3: Calcula el descuento de cada colaborador (solo en caso de que exista descuento)
#         El descuento deberá ser proporcional al número de horas no trabajadas



# Paso 4: Calcula el bono de cada colaborador (solo en caso de que exista bono)
#         El bono deberá ser nivel de cada colaborador
#         Nivel      Extra adicional
#           N1           + 20% 
#           N2           + 15%
#           N3           + 10%



# Paso 5: Usa la estructura de control condicional para crear un vector con el 
#         bono o descuento, según corresponda. (Agregar resultado a tabla de datos)



# Paso 6: Calcular columna con pago final a realizar



# Paso 7: Extrae un subconjunto de datos con los colaboradores que 
#         trabajaron menos horas de las esperadas



# Paso 8: Extrae un subconjunto de datos con los colaboradores que 
#         trabajaron más horas de las esperadas



# Paso 9: Crear una función que realice todos los pasos anteriores y regrese una 
#         lista con los siguientes elementos:
#         
#         1) Tabla completa con sueldos recalculados
#         2) Subtabla con empleados con desempeño menor al esperado
#         3) Subtabla con empleados con desempeño superior al esperado
#         4) Monto total de bono adicional (no considerar descuentos)
#         5) Promedio de pagos adicionales (no considerar descuentos)

# Hint:
# 
# nombre_funcion <- function (datos) {
# 
#  ... procedimiento ...
#  
#  resultados <- list(
#     nomina = algo, 
#     mayor_aporte = algo_2, 
#     ..., 
#     pago_extra_promedio = algo_5
#  )
#  
#  return(resultados)
# }



# Paso 10: Agregar a la lista original los siguientes empleados y recalcular usando la función creada

nomina_2 <- data.frame(
 colaborador = c("David", "Augusto", "Idalia", "Samuel", "Gabriel"),
 sueldo = c(20000, 21500, 56000, 5000, 5000), 
 nivel = c("N2", "N2", "N3", "N1", "N1"),
 horas_sem = c(40, 40, 55, 20, 20),
 horas_extra = c(-30, -18, 70, 0, 2)
)

nomina_2


# Hint: Para combinar dos tablas que contienen mismas columnas, usamos la función 
#       rbind(tabla1, tabla2)

# nomina_total <- rbind(tabla1, tabla2)










# Extra: Replicar el paso 10 con el uso del operador %>% 
















