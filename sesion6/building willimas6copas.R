library(tidyr)
library(plyr)
library(tidyverse)
library(crossdes)

library(readxl)

library(readxl)
vinos<- read_csv("bloque2.csv")



g2<-as.vector(vinos$sesion6)
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
           case_when(copas == "LP1" ~ "539", 
                     copas == "LP3" ~ "415",
                     copas == "LP5" ~ "347",
                     copas == "LP4" ~ "887", 
                     copas == "LP12" ~ "680",
                     copas == "LP21" ~ "271"
            ))%>%
         mutate(Muestra =
           case_when(copas == "LP1" ~ "1", 
                     copas == "LP3" ~ "2",
                     copas == "LP5" ~ "3",
                     copas == "LP4" ~ "4", 
                     copas == "LP12" ~ "5",
                     copas == "LP21" ~ "6"

        ))



write.table(rep2,"sesion6/sesion6.csv",row.names = FALSE)

