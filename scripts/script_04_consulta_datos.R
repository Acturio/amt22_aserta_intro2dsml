remotes::install_version("RSQLite")

library(readr)
library(jsonlite)
library(dplyr)
library(dbplyr)
library(RSQLite)
library(odbc)
library(RJDBC)

### Lectura de datos locales

base <- read.csv("data/ames.csv") 
head(base, 2)

tidy <- read_csv("data/ames.csv")
head(tidy, 2)

ames_txt <- read_delim("data/ames.txt", delim = ";", col_names = TRUE)
head(ames_txt, 2)

# ¡¡ EJERCICIO !! Leer archivo excel de la carpeta del curso

base_json <- jsonlite::fromJSON("data/ames.json")
head(base_json, 2)

saveRDS(base_json, "data/ames.rds")

base_rds <- readRDS("data/ames.rds")


### Lectura de datos (Servidor)

con <- src_memdb()

copy_to(con, storms, overwrite = T)
copy_to(con, mtcars, overwrite = T)

tbl_storms <- tbl(con, "storms")
tbl_storms

tbl_mtcars <- tbl(con, "mtcars")
tbl_mtcars

#### Consulta de datos ####

ames_housing <- read_csv("data/ames.csv")
glimpse(ames_housing)

### Selección de columnas

ames_housing %>% select(Lot_Area, Neighborhood, Year_Sold, Sale_Price)

ames_housing %>% select(contains("Area"))

ames_housing %>% select(starts_with("Garage"))


### Filtrar renglones

table(ames_housing$Sale_Condition)

ames_housing %>% filter(Sale_Condition == "Normal")

ames_housing %>% filter(Lot_Area > 1000 & Sale_Price >= 150000)

ames_housing %>% filter(Lot_Area < 1000 | Sale_Price <= 150000)


### Ordenar registros
 
ames_housing %>% arrange(Sale_Price)

ames_housing %>% arrange(desc(Sale_Price))

ames_housing %>% 
 arrange(Sale_Condition, desc(Sale_Price), Lot_Area) %>% 
 select(Sale_Condition, Sale_Price, Lot_Area)


### Agregar o modificar columna

ejemplo_mutate <- ames_housing %>% 
 select(Year_Sold, Year_Remod_Add) %>%
 mutate(Antique = Year_Sold - Year_Remod_Add)

ejemplo_mutate

ejemplo_mutate %>% 
 mutate(Antique = Antique * 12)


### Resumen estadístico

ames_housing %>% 
 select(Year_Sold, Year_Remod_Add) %>%
 mutate(Antique = Year_Sold - Year_Remod_Add) %>%
 summarise(Mean_Antique = mean(Antique))


### Agrupamiento

ames_housing %>% 
 mutate(Antique = Year_Sold - Year_Remod_Add) %>% 
 group_by(Neighborhood) %>% 
 summarise(Mean_Antique = round(mean(Antique), 0))


### Cruce de tablas

conjuntoX <- tibble("Llave" = LETTERS[1:8], "C1" = 1:8)
conjuntoY <- tibble(
 "Llave" = sample(LETTERS[11:3], size = 9, replace = T), 
 "Ex1" = letters[2:10], 
 "Ex2" = 1002:1010,"Ex3" = paste0(letters[12:20], 2:10)
 )

conjuntoX
conjuntoY

left_join(x = conjuntoX, y = conjuntoY, by = "Llave")

right_join(x = conjuntoX, y = conjuntoY, by = "Llave")

full_join(x = conjuntoX, y = conjuntoY, by = "Llave")

inner_join(x = conjuntoX, y = conjuntoY, by = "Llave")

semi_join(x = conjuntoX, y = conjuntoY, by = "Llave")

anti_join(x = conjuntoX, y = conjuntoY, by = "Llave")








