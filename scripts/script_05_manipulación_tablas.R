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

tidyr::billboard %>% 
 select(contains("wk1"))

#### Selección de renglones ####

table(ames_housing$Sale_Condition) # Conocimiento de categorías de columna: Sale_Condition

ames_housing %>% 
 filter(Sale_Condition == "Normal")

ames_housing %>% 
 filter(Lot_Area > 1000 & Sale_Price >= 150000)

ames_housing %>% 
 filter(Lot_Area > 1000, Sale_Price >= 150000, Year_Built > 1980)

ames_housing %>% 
 filter(!(Lot_Area < 1000 | Sale_Price <= 150000))

ames_housing %>% 
 filter(Lot_Area >= 1000, Sale_Price > 150000)

ames_housing %>% 
 filter(Sale_Condition %in% c("Normal", "Partial")) %>% 
 group_by(Sale_Condition) %>% 
 tally()

datos <- tibble(x1 = c(1,2,3,4,5,NA,NA,9,1),
                x2 = letters[1:9])

!TRUE

datos %>% filter(is.na(x1))
datos %>% filter(!is.na(x1))

ames_housing %>% 
 filter(Sale_Price >= 150000)

ames_housing %>% 
 filter(Sale_Price < 150000)

ames_housing %>% 
 filter(Sale_Price = 150000)

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
 select(Year_Sold, Year_Remod_Add,Sale_Price) %>%
 mutate(
  Antique = Year_Sold - Year_Remod_Add,
  Sale_Price_Pesos = Sale_Price * 20) %>%
 summarise(
  Mean_Antique = mean(Antique, na.rm = T),
  Mean_Sale_Price_Pesos = mean(Sale_Price_Pesos, na.rm = T),
  median = quantile(Sale_Price_Pesos, probs = 0.5),
  median2 = median(Sale_Price_Pesos)
  )


# Ejercicio:
#
# Realizar una consulta usando summarise() y cada una de las funciones 
# estadísticas listadas anteriormente.



#### Agrupamiento ####

reporte <- ames_housing %>% 
 mutate(Antique = Year_Sold - Year_Remod_Add) %>% 
 select(Antique, Neighborhood, Sale_Price) %>% 
 group_by(Neighborhood) %>% 
 summarise(
  Mean_Antique = round(mean(Antique), 0),
  Mean_Sale_Price = mean(Sale_Price, na.rm = T),
  median = quantile(Sale_Price, probs = 0.5)
  ) 


ames_housing %>% 
 mutate(Antique = Year_Sold - Year_Remod_Add) %>% 
 select(Antique, Neighborhood, Sale_Price) %>% 
 group_by(Neighborhood) %>% 
 mutate(
  n = n(),
  precio_medio = mean(Sale_Price),
  desv = sd(Sale_Price),
  LI = precio_medio - qnorm(0.975)*desv,
  LS = precio_medio + qnorm(0.975)*desv) %>% 
 ungroup() %>% 
 mutate(
  dentro_intervalo = case_when(
   Sale_Price < LI ~ "Abajo",
   Sale_Price > LS ~ "Arriba",
   TRUE ~ "Dentro"
  )
  )
 


reporte %>% 
 write_csv("data/precio_x_vecindario.csv")

reporte %>% arrange(median)

# Ejercicio:
# 
# Calcular distintos estadísticos agrupados sobre alguna variable numérica de interés





#### Unión de tablas (JOIN) ####

conjuntoX <- tibble("Llave" = LETTERS[1:8], "C1" = 1:8)

conjuntoY <- tibble(
 "OtraLlave" = sample(LETTERS[11:3], size = 9, replace = T), 
 "Ex1" = letters[2:10], 
 "Ex2" = 1002:1010,"Ex3" = paste0(letters[12:20], 2:10)
 )

conjuntoX
conjuntoY
conjuntoZ

conjuntoX %>% 
 full_join(conjuntoY, by = "Llave") %>% 
 full_join(conjuntoZ, by = "Llave2") %>% 
 left_join(conjuntoW) %>% 
 inner_join()



# Left join
left_join(x = conjuntoX, y = conjuntoY, by = c("Llave"="OtraLlave"))


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



