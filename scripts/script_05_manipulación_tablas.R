#### Carga de librerías ####

pacman::p_load(
 readr,
 dplyr
)

#### Carga de datos ####
ames_housing <- read_csv("data/ames.csv")
glimpse(ames_housing)


#### Selección de columnas ####


select(ames_housing, Lot_Area, Neighborhood, Year_Sold, Sale_Price)

datos_filtrados <- ames_housing %>% 
 select(Lot_Area, Neighborhood, Year_Sold, Sale_Price)

ames_housing %>% 
 select(contains("Area"))

ames_housing %>% 
 select(starts_with("Garage"))

# Ejercicio: Selección de columnas de acuerdo a distintos tipos de filtros

ames_housing %>% 
 select(72, 73, 50:55, 1,2,3)

ames_housing %>% 
 select(ends_with("Cond"), contains("Garage"), starts_with("MS"))

tidyr::billboard %>% 
 select(num_range("wk", 10:15))


#### Selección de renglones ####

table(ames_housing$Sale_Condition) # Conocimiento de categorías de columna: Sale_Condition

ames_housing %>% 
 filter(Sale_Condition == "Normal")

ames_housing %>% 
 filter(Lot_Area > 1000 & Sale_Price >= 150000)

ames_housing %>% 
 filter(Lot_Area > 1000, Sale_Price >= 150000)

ames_housing %>% 
 filter(Lot_Area < 1000 | Sale_Price <= 150000)

# Ejercicio:
#
#  Practicar la función de filtro de observaciones usando los operadores auxiliares.
#
#  Concatenar el resultado de seleccionar columnas y posteriormente filtrar columnas.


#### Ordenamiento de registros ####

ames_housing %>% 
 arrange(Sale_Price) %>% 
 relocate(Sale_Price, .before = MS_SubClass)

ames_housing %>% 
 arrange(desc(Sale_Price)) %>% 
 relocate(Sale_Price, .before = MS_SubClass)

ames_housing %>% 
 arrange(Sale_Condition, desc(Sale_Price), Lot_Area) %>% 
 select(Sale_Condition, Sale_Price, Lot_Area)


#### Agregar o modificar columnas ####

ejemplo_mutate <- ames_housing %>% 
 select(Year_Sold, Year_Remod_Add) %>%
 mutate(Antique = Year_Sold - Year_Remod_Add)

ejemplo_mutate


ejemplo_mutate %>% 
 mutate(Antique = Antique * 12)


#### Resumen estadístico ####

ames_housing %>% 
 select(Year_Sold, Year_Remod_Add) %>%
 mutate(Antique = Year_Sold - Year_Remod_Add) %>%
 summarise(Mean_Antique = mean(Antique))


# Ejercicio:
#
# Realizar una consulta usando summarise() y cada una de las funciones 
# estadísticas listadas anteriormente.



#### Agrupamiento ####

ames_housing %>% 
 mutate(Antique = Year_Sold - Year_Remod_Add) %>% 
 group_by(Neighborhood) %>% 
 summarise(Mean_Antique = round(mean(Antique), 0))


# Ejercicio:
# 
# Calcular distintos estadísticos agrupados sobre alguna variable numérica de interés





#### Unión de tablas (JOIN) ####

conjuntoX <- tibble("Llave" = LETTERS[1:8], "C1" = 1:8)

conjuntoY <- tibble(
 "Llave" = sample(LETTERS[11:3], size = 9, replace = T), 
 "Ex1" = letters[2:10], 
 "Ex2" = 1002:1010,"Ex3" = paste0(letters[12:20], 2:10)
 )

conjuntoX
conjuntoY

# Left join
left_join(x = conjuntoX, y = conjuntoY, by = "Llave")


# Right join
right_join(x = conjuntoX, y = conjuntoY, by = "Llave")


# Full join
full_join(x = conjuntoX, y = conjuntoY, by = "Llave")


# Inner join
inner_join(x = conjuntoX, y = conjuntoY, by = "Llave")


# Semi join
semi_join(x = conjuntoX, y = conjuntoY, by = "Llave")


# Anti join
anti_join(x = conjuntoX, y = conjuntoY, by = "Llave")



