library(tidyr)
library(plyr)
library(crossdes)
library(readxl)


vinos<-c("LP1",
         "LP3",
         "LP5",
         "LP11",
         "LP13",
         "LP15",
         "LP19",
         "LP21",
         "LP23",
         "LP4",
         "LP6",
         "LP8",
         "LP10",
         "LP12",
         "LP14",
         "LP20",
         "LP22",
         "LP24"
         )
         

       

set.seed(43567345)
chunk <- function(x,n) split(x, factor(sample(rank(x)%%n)))
chunk1<-chunk(vinos,3)

c1<-chunk1$`0`
c1

c2<-chunk1$`1`
c2

c3<-chunk1$`2`
c3


  grupos<-cbind(c1,c2,c3)
grupos

write.csv(grupos,"bloque3.csv")