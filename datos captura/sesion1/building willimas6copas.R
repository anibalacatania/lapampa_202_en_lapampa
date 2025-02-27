library(tidyr)
library(plyr)
library(tidyverse)
library(crossdes)

library(readxl)

library(readxl)
vinos<- read_csv("bloque1.csv")



g2<-as.vector(vinos$sesion1)
g2


n=6 # escribir aca el numero de copas


df
set.seed(873)
s1 <- sample(g2, n, replace=F)

set.seed(173)
s2 <- sample(g2, n, replace=F)
s2
set.seed(569)
s3 <- sample(g2, n, replace=F)
s3
  set.seed(291)
s4 <- sample(g2, n, replace=F)
s4
dam <- williams(n)
dam
dam2 = mapvalues(dam, c(1:n),s1)
dam3 = mapvalues(dam, c(1:n),s2)
dam4 = mapvalues(dam, c(1:n),s3)
dam5 = mapvalues(dam, c(1:n),s4)

rep1<-rbind(dam2,dam3,dam4,dam5)
rep1
rep1<-t(rep1)
rep1<-as.data.frame(rep1)
copas <- rownames(rep1)
rep1<-cbind(copas,rep1)





rep1<-gather(rep1, panelista, copas)

# empezar en 19
rep2<-rep1 %>%
  group_by(copas)%>%
  mutate(ID =
           case_when(copas == "LP1" ~ "911", 
                     copas == "LP3" ~ "690",
                     copas == "LP13" ~ "920",
                     copas == "LP23" ~ "585", 
                     copas == "LP20" ~ "737",
                     copas == "LP24" ~ "581"
            ))%>%
         mutate(Muestra =
           case_when(copas == "LP1" ~ "1", 
                     copas == "LP3" ~ "2",
                     copas == "LP13" ~ "3",
                     copas == "LP23" ~ "4", 
                     copas == "LP20" ~ "5",
                     copas == "LP24" ~ "6"

        ))



write.table(rep2,"sesion1/sesion1.csv",row.names = FALSE)

