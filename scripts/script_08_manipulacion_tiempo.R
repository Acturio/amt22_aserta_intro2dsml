library(lubridate)


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

tiempo <- make_datetime(year = 2004, month = 9, day = 25, hour = 11, min = 30, sec = 1)

year(tiempo)

month(tiempo)

month(tiempo, label = T, abbr = F)

day(tiempo)

hour(tiempo)

minute(tiempo)

second(tiempo)

wday(tiempo)

wday(tiempo, label = T, abbr = F)

mday(tiempo)

yday(tiempo)

#### Operaciones temporales

as_date("1991/11/15") - as_date("1992/04/23")

as_date("1992/04/23") - as_date("1991/11/15")

as_date("1991/11/15") + 365

as_date("1992/04/23") > as_date("1991/11/15")

as_date("1992/04/23") < as_date("1991/11/15")














