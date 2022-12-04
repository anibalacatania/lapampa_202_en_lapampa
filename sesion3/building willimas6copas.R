library(tidyr)
library(plyr)
library(tidyverse)
library(crossdes)

library(readxl)

library(readxl)
vinos<- read_csv("bloque1.csv")



g2<-as.vector(vinos$sesion3)
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
           case_when(copas == "LP8" ~ "922", 
                     copas == "LP12" ~ "800",
                     copas == "LP14" ~ "735",
                     copas == "LP17" ~ "575", 
                     copas == "LP18" ~ "698",
                     copas == "LP11" ~ "481"
            ))%>%
         mutate(Muestra =
           case_when(copas == "LP8" ~ "1", 
                     copas == "LP12" ~ "2",
                     copas == "LP14" ~ "3",
                     copas == "LP17" ~ "4", 
                     copas == "LP18" ~ "5",
                     copas == "LP11" ~ "6"

        ))



write.table(rep2,"sesion3/sesion3.csv",row.names = FALSE)

