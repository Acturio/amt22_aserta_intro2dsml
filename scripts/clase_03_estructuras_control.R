


vec <- c()

for(i in 1:10){
 const <- i
 vec[i] <- i
}

vec
const


knrep <- 10  # Número de repeticiones
kn <- 100    # Tamaño de la muestra
conteo <- numeric(nrep)  # Vector para almacenar el conteo
suma <- c()
conteo2 <- c()
kumbral <- 2.5

for (i in 1:nrep) {
  sim_unif <- runif(n=n, min=1, max=3)
  mayor_umbral <- sim_unif[sim_unif >= umbral]
  
  conteo[i] <- sum(sim_unif >= umbral)
  conteo2[i] <- length(mayor_umbral)
  suma[i] <- sum(mayor_umbral)
}
conteo
conteo2
suma


x
qunif(0.75, min = 1, max = 3)
mean(x >= umbral)
quantile(x, probs = 0.75)


nombres <- c("Caro", "Fede", "Gabriel", "Ces", "Eri", "Mon", "Caro", "Fede", 
             "Gabriel", "Ces", "Eri", "Mon")
hola <- "hola"
saludo <- c()

for (nombre in nombres) {
 
 saludo[nombre] <- paste(hola, nombre)
 
}

saludo


for (j in seq(1,20, by =2)) {
 print(j)
}

for (j in 10:-10) {
 print(j)
}


historial <- NULL 
historial[1] <- 1
historial[2] <- 5
historial[100] <- 100

historial[1,1] <- 1
class(historial)



sample(x = 1:10, size = 100, replace = T, prob = rep(c(0.3, 0.7), 5))
sample(x = c("Ricardo", "Montse", "Mauricio"), size = 1)




nombre_variable
nombreVariable



plot(x    = x.coord,
     y    = data.mat[, MakeColName(metric, ptiles[1], "roiOpt")],
     ylim = ylim,
     xlab = "dates",
     ylab = metric,
     main = (paste(metric, " for 3 samples ", sep = "")))

plot(
 x    = x.coord,
 y    = data.mat[, MakeColName(metric, ptiles[1], "roiOpt")],
 ylim = ylim,
 xlab = "dates",
 ylab = metric,
 main = (paste(metric, " for 3 samples ", sep = ""))
 )



