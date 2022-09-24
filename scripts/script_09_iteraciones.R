
pacman::p_load(
  dplyr,
  stringr,
  purrr
)

#### Ejercicio: Crea una función que transforme los datos a una distribución 
#### normal estándar (i.e z = [x-mean(x)]/sd(x) ) y posteriormente aplique 
#### dicha función a las columnas de interés.

set.seed(13258)
datos <- tibble(
  fruit1 = fruit[1:10],
  fruit2 = fruit[26:17],
  value1 = rnorm(10, 10, 1),
  value2 = rnorm(10, 50, 3),
  value3 = rpois(10, 1000)
)
datos

transf <- function(x){
 z <- (x - mean(x)) / sd(x)
 return(z)
}
transf(rnorm(100, 100, 5))

for (i in 3:5) {
 datos[,i] <- datos[,i] %>% pull() %>% transf()
}

datos %>% pull(fruit2)





mi_2da_lista <- list(
 my_number = c("cinco" = 5),
 my_vector = c("NombreA"="a", "NombreB"="b", "NombreC"="c"),
 my_dataframe = data.frame(
  a = 1:3, b = c("q", "b", "z"), 
  c = c("bananas", "are", "so very great"))
 )
mi_2da_lista

mi_2da_lista %>% map(class)
mi_2da_lista %>% map(names)
mi_2da_lista %>% map(length)
mi_2da_lista %>% map(dim)


addTen <- function(.x) {
  return(.x + 10)
}
map(.x = c(1, 4, 7), .f = addTen)

addy <- function(.x, y) {
  return(.x + y)
}
map(list(1, 4, 7, 10, 5), addy, y = -15)
map(.x = list(1, 4, 7), .f = addy(y = 1) ) # No funciona


map(data.frame(a = 1, b = 4, c = 7), addTen)
data.frame(a = 1, b = 4, c = 7) %>% map(addTen)

tibble(a = c(1, 5), b = c(4, 2), c = c(7, 10)) %>% 
  map(addTen)


map_dbl(c(1, 4, 7), addTen)

map_chr(c(1, 4, 7), addTen)

map_df(
  .x = c(1, 4, 7), 
  .f = function(.x) {
    z <- data.frame(old_number = .x, new_number = addTen(.x))
    return(z)
  }
)

#### Bucles dobles ####

x <- list(1, 5, 15, 20, -10)
y <- list(10, 20, 30, 40, 50)

map2(.x = x, .y = y,  .f = ~ .x - .y)

map2_dbl(.x = x, .y = y, .f = ~ .x + .y)

map2_chr(.x = x, .y = y, .f = ~ .x + .y)

df <- tibble(
  x = c(1, 4, 5),
  y = c(5, 2, 8)
)
df

map2_dbl(df$x, df$y, min)

df %>% mutate(min = map2_dbl(df$x, df$y, min))


#### Mapeo condicional y selectivo ####

datos %>% 
  map_at(c(3, 4, 5), addTen) %>% 
  as_tibble()

datos %>% 
  map_if(is.numeric, addy, y = 1000) %>% 
  as_tibble()

datos %>% 
  map_if(is.numeric, addy, y = -1000) %>% 
  as_tibble() %>% 
  select_if(is.numeric) %>% 
  bind_cols(datos, .)

#### Ejercicio: Crea una función que transforme los datos a una distribución 
#### normal estándar (i.e z = [x-mean(x)]/sd(x) ) y posteriormente aplique 
#### dicha función a las columnas de interés.


# Pregunta: ¿Qué hacen las siguientes funciones?
#
# select_if()   vs   select_at()
# mutate_if()   vs   mutate_at()


