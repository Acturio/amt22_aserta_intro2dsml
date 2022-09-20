library(lubridate)
library(dplyr)

fechas <- c("2018/09/11", "1992/04/23", "1966/02/04", "1958/10/01", "1991/11/15")
class(fechas)

class(as_date(fechas))

make_date(year = 1999, month = 06, day = 16)

make_datetime(
 year = 1999:2001, 
 month = 06, 
 day = 16, 
 hour = 10:12, 
 min = 37, 
 sec = 15
 )

mdy("11/25/1982")

### Extracción de datos temporales

tiempo <- make_datetime(year = 2004:2010, month = 9, day = 25, hour = 11, min = 30, sec = 1)

year(tiempo)

month(tiempo)

month(tiempo, label = T, abbr = T)

day(tiempo)

hour(tiempo)

minute(tiempo)

second(tiempo)

wday(tiempo)

wday(tiempo, label = T, abbr = F, locale = "en_US.UTF-8")
wday(tiempo, label = T,abbr=F, locale = "de_DE.UTF-8") 
wday(tiempo, label = T,abbr=F, locale = "fr_fr.UTF-8") 
wday(tiempo, label = T,abbr=F, locale = "it_IT.UTF-8") 
wday(tiempo, label = T,abbr=F, locale = "ru_ru.UTF-8") 

mday(tiempo)

yday(tiempo)

#### Operaciones temporales

as_date("1991/11/15") - as_date("1992/04/23")

as_date("1992/04/23") - as_date("1991/11/15")

as_date("1991/11/15") + 365

as_date("1992/04/23") > as_date("1991/11/15")

as_date("1992/04/23") < as_date("1991/11/15")


as.duration(interval(as_date("1991/11/15"), as_date("1995/04/23"))) / as.duration(years(1))
interval(as_date("1991/11/15"), as_date("1995/04/23")) %>% as.numeric('years')
interval(as_date("1991/11/15"), as_date("1995/04/23")) / years(1)

#### Transformación de formato ####

dates1 <- c("06sep2001","21jun2004","04jul2006","6ago2005") 
as_date(dates1, format ="%d%B%Y")

dates2 <- c("20ene07","06sep01","6agosto05","6ago2005","20junio1999") 
as_date(dates2, format = "%d%b%y")

dates3 <- c("20/ene/07","06/sep/01","6/agosto/05","6/ago/2005","20/junio/1999") 
as_date(dates3, format = "%d/%b/%y")

sdate1 <- "6ago2005"
sdate2 <- "ene151999"
sdate3 <- "12-15-2001"

as_date(sdate1, format = "%d%b%Y")
as_date(sdate2, format = "%b%d%Y")
as_date(sdate3, format = "%d%b%Y")














