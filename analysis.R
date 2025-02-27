library(SensoMineR)
library(readxl)
library(missMDA)
library(lmerTest)
library(predictmeans)
library(tidyverse)
library(missMDA)

####################Datos Sensoriales######################
library(readxl)
data <- read_excel("datall.xlsx", col_types = c("text", 
                                                  "text", "text", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric"))


str(data)



data<-as.data.frame(data) # lo transformo en data frame

data<-na.omit(data)

#configuramos producto, panelista y sesion como factor
data$sesion<-as.factor (data$sesion)
data$producto<-as.factor(data$producto)
data$panelista<-as.factor(data$panelista)
table(data$sesion,data$panelista)
str(data)

data<-data %>% select(producto,panelista,
                      sesion,
                      `Intensidad de color`,
                      `Matiz violeta`,
                      Astringencia,
                      Solvente,
                      Balsamico,
                      `Matiz rojo`,
                      Especiado,
                      Herbaceo_Pasto,
                      `Intensidad aromatica`,
                      Amargo
                      )

plot <- panellipse(data,col.p=1,col.j=2,firstvar=4,level.search.desc=0.05,graph.type = "ggplot")


plot$graph$plotIndEll+
  theme(aspect.ratio = 1) +labs(title="")+
  theme(axis.title.y = element_text(hjust = 0.5))+
  theme(axis.title.x = element_text(hjust = 0.5))+
  
  stat_ellipse(type = "t")

plot$graph$plotVarVariab+ theme(legend.position = "none")+
  labs(title="")+
  theme(axis.title.y = element_text(hjust = 0.5))+
  theme(axis.title.x = element_text(hjust = 0.5))







### Análisis multivariado para chequear que no se produzcan errores de tipo 1

da.a=as.matrix(data [,-c(1:3)])
da.man<-manova(da.a~(panelista+sesion+producto)^2, data=data)
a<-summary(da.man, test="Wilks")
output <- capture.output(a)
as.data.frame(output)


### Boxplot
boxplot(Intensidad.Color~producto,data=data,col="lightgray",main="Intensidad de color")
boxplot(Matiz.Amarillo~producto,data=data,col="lightgray",main="Matiz amarillo")
boxplot(Matiz.Verde~producto,data=data,col="lightgray",main="Matiz Verde")
boxplot(Intensidad.Aromatica~producto,data=data,col="lightgray",main="Intensidad Aromatica")
boxplot(Linalol~producto,data=data,col="lightgray",main="Linalol")
boxplot(Fruta.Fresca~producto,data=data,col="lightgray",main="Fruta Fresca")
boxplot(Frutal~producto,data=data,col="lightgray",main="Frutal")
boxplot(Astringencia~producto,data=data,col="lightgray",main="Astringencia")




#grafico de interacciones
graphinter(data[,c("panelista", "sesion", "producto", "Astringencia")],col.p=3,col.j=4,firstvar=6,lastvar=36,numr=1,numc=1)






#cuadro de interacciones


res.panelperf <- panelperf(data,firstvar=3,formul="~producto+panelista+ sesion+producto:panelista+bloque+producto:sesion+panelista:sesion",random=T)
res.panelperf <- panelperf(data,firstvar=4,formul="~producto+panelista+ sesion+producto:panelista+producto:sesion+panelista:sesion",random=T)
res.panelperf <- panelperf(data,firstvar=6,formul="~producto+panelista",random=T)

res.panelperf <- panelperf(data,firstvar=4,formul="~(producto + panelista + sesion)^2",random=T)

res.panelperf$p.value
coltable(res.panelperf$p.value[order(res.panelperf$p.value[,1]),],col.lower="gray", level.lower = 0.05,cex=0.8)

# contribución de los panelistas a la interacción
results=interact(data[,c("panelista", "sesion", "producto", "Astringencia")],col.p=3,col.j=4,firstvar=6)

data[,c("panelista", "sesion", "producto", "Astringencia")]

#cuadro de interacciones de los panelistas

#poder de Discrimination
res.paneliperf <- paneliperf(data,formul="~producto+panelista+ sesion+producto:panelista+producto:sesion+panelista:sesion", formul.j="~producto+sesion",col.j=4,firstvar=6,synthesis=TRUE)
names(res.paneliperf)
res.magicsort <- magicsort(res.paneliperf$prob.ind,method="median")
round(res.magicsort,3)
coltable(round(res.magicsort,2),level.lower=0.05,level.upper=0.06, col.lower="gainsboro",col.upper="gray",cex = 0.5, nbcol=16)
write.table(round(res.magicsort,3),"poderdiscri.csv",row.names = TRUE)
#Acuerdo de los panelistas
res.paneliperf <- paneliperf(data,formul="~producto+panelista+ sesion+producto:panelista+producto:sesion+panelista:sesion", formul.j="~producto+sesion",col.j=3,firstvar=5,synthesis=TRUE)
names(res.paneliperf)
res.magicsort <- magicsort(res.paneliperf$agree.ind,method="median")
round(res.magicsort,3)
coltable(round(res.magicsort,2),level.lower=-0.001,level.upper=0.80, col.lower="gainsboro",col.upper="gray",cex = 0.5,nbcol=16)


#Repetibilidad
res.paneliperf <- paneliperf(data,formul="~producto+panelista+ sesion+producto:panelista+producto:sesion+panelista:sesion", formul.j="~producto+sesion",col.j=3,firstvar=5,synthesis=TRUE)
names(res.paneliperf)
res.magicsort <- magicsort(res.paneliperf$res.ind,method="median")
round(res.magicsort,3)
coltable(round(res.magicsort,2),level.lower=0.001,level.upper=1.96, col.lower="gainsboro",col.upper="gray",cex = 0.5,nbcol=16)




### PCA con elipses
data2<-select(data, c(
                      "producto" ,
                      "bloque",

                      "sesion" ,
                      "panelista",
                      "Intensidad de color",
                      "Intensidad aromatica",
                      "Violaceo" ,
                      "Rojo" ,

                      "Ciruela" ,



                      ))
res.panellipse <- panellipse(data,col.p=2,col.j=6,firstvar=7,level.search.desc=1,graph.type = "classic")
coltable(res.panellipse$hotelling, main.title =  "P-values for the Hotelling T2 tests")


res.panellipse$graph$plotIndEll +geom_point(aes(res.panellipse$coordinates))

res.panellipse$coordinates

res.panellipse$graph$plotPan$coordinates


# PCA con elipses por sesión
panellipse.session <- panellipse.session(data,col.p=1,col.j=4,col.s=3,firstvar=5,level.search.desc=1)

###modelo mixto
variable<-data$Intensidad.Color

#Panelista como efecto aleatorio
mixedmodel <-lmer(variable~producto+sesion+producto:sesion
                  + (1|panelista)
                  +(1|producto:panelista)
                  +(1|panelista:sesion),data=data)

#Panelista y sesión como efecto aleatorio
mixedmodel <- lmer(Dulzor~producto/rep
                   + (1 | panelista)
                   + (1 | sesion)
                   + (1 | panelista:sesion)
                   + (1 | panelista:producto/rep)
                   + (1 | sesion:producto/rep), data=data)


mixedmodel <- lmer(Dulzor~producto/rep
                   + (1 | panelista)
                   + (1 | sesion),
               data=data)



model<-lm(Dulzor ~ (producto/rep + panelista + sesion)^2, data = data)

anova(model)


anova(mixedmodel)
rand(mixedmodel)

### Supuesto Bromalidad
qqnorm(resid(mixedmodel))
qqline(resid(mixedmodel))
shapiro.test(data$Fruta.Fresca)

data$Fruta.Fresca



# Tests a postriori
predictmeans(mixedmodel, "producto", adj="BH",pairwise=FALSE,Df=5,barplot=FALSE, plot=FALSE)



#### cluster



#################### original data ##############

##########333





mixedmodel <- lmer(Dulzor~producto/rep

                   + (1 | panelista)
                   + (1 | sesion)
                   + (1 | producto/rep:panelista)
                   + (1 | panelista:sesion)
                   + (1 | sesion:producto/rep), data=data)

str(data)

anova(mixedmodel)
rand(mixedmodel)

