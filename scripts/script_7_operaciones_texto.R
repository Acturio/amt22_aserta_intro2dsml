library(stringr)

# Definición de cadenas de texto

Cadena1 <- "Se definen cadenas a través de comillas dobles"
print(Cadena1)


Cadena2 <- 'También es posible con comillas simples y el resultado es el mismo'
print(Cadena2)


Cadena3 <- 'Se pueden implementar "comillas" dentro de la cadena'
print(Cadena3)


Cadena4 <- 'Esta es otra forma de incluir \"comillas\" dentro de un texto'
print(Cadena4)


cat(Cadena3)

cat(Cadena4)

# Tamaño de cadena

str_length("Esta es una cadena de 35 caracteres")

str_length(c("Un","vector","con","diferente","cantidad","de","carecteres","por","cadena"))


# Concatenar cadenas

str_c("Concatenado", "de","varias", "cadenas", "sin","espacios")

str_c("Concatenado","con","espacios", sep=" ")

str_c("separando","mediante","otro","caracter","definido", sep="-")

str_c("Valores",str_c("09","006"),"anidados también se pueden concatenar",sep=" ")


str_c(c("Colapsamiento", "de","un","vector","de", "cadenas", "en","una",
        "sola","cadena"), collapse = " ")

str_c(c("Colapsamiento", "de","un","vector","de", "cadenas",
        "separado","por","signos"), collapse = "+")


# Extraer y reemplazar

str_sub("subcadenas", start = 4, end = 9)

x <- "00000090060002"
str_sub(x, start = str_length(x) - 8, str_length(x))

str_sub(x, start = -9)


y <- "substring"
str_sub(y, start = 4, end = 9) <- "cadena"; y

x <- "090060002"
str_sub(x, start = str_length(x)-6,str_length(x)-4) <- "555"; x 



# Expresiones regulares

head(sentences, 10)

head(words, 20)

head(fruit, 20)

str_view(sentences,"great", match = TRUE)

str_view(sentences,"this", match = TRUE)

str_view(sentences,"up.", match = TRUE)

str_view(words,"^y", match = TRUE)

str_view(words,"x$", match = TRUE)

vector <- c("nulo aprendizaje", "poco aprendizaje","aprendizaje moderado","aprendizaje", "aprendizaje total")

str_view(vector,"^aprendizaje$")



cadena <- "El año 2022 será un año de mucho crecimiento."

str_view(cadena,"\\d", match = T)

str_view(c("tamaño","tasa","tata","taza","tapa"),"ta(s|z)a")

## Repeticiones

x <- "1888 es el año más largo en números romanos: MDCCCLXXXVIII"

str_view(x,"XX?")


str_view(x,"XX+")


str_view(x,"C[LX]+")


str_view(x,"X{3}")


str_view(x,"X{1,2}")


str_view(x,"M*")


str_view_all(x,"M*")


str_detect(fruit, "[au]")


fruit[str_detect(fruit, "[lo]")]


## Conteo de coincidencias

str_count(fruit, "[aeiou]")


mean(str_count(fruit, "[aeiou]"))


tabla <- tibble(
  "Vocal" = c("a","e","i","o","u"),
  "Conteos" = c(sum(str_count(fruit, "a")),sum(str_count(fruit, "e")),
                sum(str_count(fruit, "i")),sum(str_count(fruit, "o")),
                sum(str_count(fruit, "u")))) %>% 
  mutate(Porcentaje = Conteos/sum(Conteos))

tabla


## Extracción de coincidencias

patron <- "( and )|( or )"

coincidencias <- str_subset(sentences, patron)
head(coincidencias,10)


str_extract(coincidencias, patron)


head(str_extract_all(coincidencias,patron), 5)


sample_n(
  tbl = as_tibble(str_extract_all(coincidencias, patron, simplify = TRUE)), 
  size = 10
)

sum(str_count(coincidencias, pattern = patron))


## Reemplazar coincidencias

x <- c("1","2","1","2","1","2","1","2","1","2")

x1 <- str_replace(x, "1","Hombre")
print(x1)

x2 <- str_replace(x1, "2","Mujer")
print(x2)

str_replace_all(x, c("1" = "Hombre", "2" = "Mujer"))


## División mediante patrones

fechas <- c("15/11/1991","20/11/1981","04/02/1966","01/10/1958","23/04/1992")
fechas

str_split(string = fechas,pattern = "/",n = 3, simplify = T) %>% 
  as_tibble() %>% 
  rename(day = V1, month = V2, year = V3)

## Localización de coincidencias

x <- c("090020001-123","090001-512","09002-1236","90020001-1237","09001-123811")
str_locate(x,"-\\d{2,}")



