#### Orden y estructura de tablas

pacman::p_load(
 tidyr,
 magrittr,
 readxl,
 stringr,
 dplyr
 )

Resumen <- readRDS("data/loc_mun_cdmx.rds")
Resumen


#### Pivote horizontal####

Resumen %>% pivot_wider(
  names_from = Ambito, 
  values_from =  Total_localidades
  )

# Otro ejemplo
fish_encounters

fish_encounters %>%
  pivot_wider(
   names_from = station, 
   values_from = seen
   )

fish_encounters %>%
  pivot_wider(
   names_from = station, 
   values_from = seen, 
   values_fill = 0
   )

Resumen %>% pivot_wider(
  names_from = Ambito, 
  values_from =  Total_localidades,
  values_fill = 0
  )

# Otro ejemplo
us_rent_income %>% arrange(NAME)

us_rent_income %>%
  pivot_wider(
   names_from = variable, 
   values_from = c(estimate, moe)
   )

Resumen %>% 
 group_by(Ambito) %>% 
 mutate(porc = Total_localidades/sum(Total_localidades)*100) %>% 
 arrange(Ambito) %>% 
 print(n = 23) %>% 
 pivot_wider(
  names_from = Ambito,
  values_from = c(Total_localidades, porc),
  values_fill = 0
 )


# Un ejemplo más

warpbreaks <- warpbreaks[c("wool", "tension", "breaks")] %>% as_tibble()
warpbreaks

warpbreaks %>%
  pivot_wider(
    names_from = wool,
    values_from = breaks,
    values_fn = ~mean(.x, na.rm = T)
  )

set.seed(13528)
Resumen %>% 
 mutate(Categoria = factor(sample(1:4, 23, T))) %>% 
 #relocate(Categoria, .after = Ambito) %>% 
 select(-NOM_MUN) %>% 
 pivot_wider(
  names_from = Ambito,
  values_from = Total_localidades,
  values_fn = ~sum(.x, na.rm = T),
  values_fill = 0
 ) %>% 
 arrange(Categoria) 

#### Pivote vertical ####

relig_income

relig_income %>% 
  pivot_longer(
   cols = -religion, 
   names_to = "income", 
   values_to = "count"
   )


#### Unión de tablas ####

Datos <- read_excel("data/Margin CONAPO.xlsx", sheet = "Margin CONAPO")
Datos

Datos2 <- Datos %>% select(ENT, MUN, LOC)
Datos2$ENT %<>% str_pad(width = 2, side = "left", pad = "0") # Formato geoespacial
Datos2$MUN %<>% str_pad(width = 3, side = "left", pad = "0") # Formato geoespacial
Datos2$LOC %<>% str_pad(width = 4, side = "left", pad = "0") # Formato geoespacial

Datos2 %>% head(5)

Datos2 %>% 
 unite("CVE_GEO", c("ENT","MUN","LOC"), sep="", remove = F) %>% 
 head(5)

Datos2 %>% 
 unite("CVE_GEO", c("ENT","MUN","LOC"), sep="/",remove = T) %>% 
 head(5)


#### Separación de columnas ####

Datos_unite1 <- Datos2 %>% 
 unite("CVE_GEO", c("ENT","MUN","LOC"), sep = "", remove = T) 

Datos_unite1 %>% head(5)


Datos_unite1 %>% 
  separate("CVE_GEO", c("EDO","MUNI","LOC"), sep = c(2, 5), remove = F) %>% 
  head(5)

