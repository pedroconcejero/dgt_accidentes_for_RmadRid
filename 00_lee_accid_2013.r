
setwd("C:/Users/pedroc/Desktop/dgt")

csvfiles <- list.files(pattern = glob2rx("*.csv"))

vehic <- read.table(csvfiles[3],
                    header = T,
                    sep =",")

dim(vehic)

vehic$ID_ACCIDENTE <- as.character(vehic$ID_ACCIDENTE)
vehic$ID_VEHICULO  <- as.factor(vehic$ID_VEHICULO)
vehic$ANIO_MATRICULA_VEHICULO[vehic$ANIO_MATRICULA_VEHICULO > 2015] <- NA
vehic$ANIO_MATRICULA_VEHICULO  <- as.factor(vehic$ANIO_MATRICULA_VEHICULO)
round(table(vehic$ANIO_MATRICULA_VEHICULO, exclude = NULL)/nrow(vehic)*100, digits = 3)
# 35% de los vehículos no tienen antiguedad
vehic$MES_MATRICULA_VEHICULO[vehic$MES_MATRICULA_VEHICULO == 99] <- NA
vehic$MES_MATRICULA_VEHICULO  <- as.factor(vehic$MES_MATRICULA_VEHICULO)
vehic$TIPO_VEHICULO  <- as.factor(vehic$TIPO_VEHICULO)
vehic$ESTADO_VEHICULO  <- as.factor(vehic$ESTADO_VEHICULO)
vehic$NUMERO_OCUPANTES_VEH[vehic$NUMERO_OCUPANTES_VEH == 999] <- NA


summary(vehic)

save(vehic, file = "vehic2013.rda")
