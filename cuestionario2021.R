library(tidyverse)
install.packages("haven")
library(haven)
library (readx1)

#Dos paquetes comunes utilizados para abrir archivos .dta son haven y foreign

df <- haven::read_dta("2021.dta")

colnames(df)
head(df)

#En su opinión, ¿cuál es el problema más grave que está enfrentando el país?

# El paquete sjmisc tiene la función fqr() que es muy útil, especialmente si
# tienes datos con labels.

sjmisc::frq(df,a4)

#a4 "En su opinión, ¿cuál es el problema más grave que está enfrentando el país?

df %>%
  group_by(a4) %>% # Para agrupar por unidad análisis.
  summarise (n=n())%%
  arrange(-n)

# Si quiero saber los resultados por género?

sjmisc::frq(df,q1tb)

df%>%
  group_by(q1tb,a4)%>%
  summarise(n=n())%>%
  arrange(-n)
  filter(q1tb==2)

df%>%
  select(q1tb,a4,pn4) %>% 
  filter(q1tb==2)%>%
  mutate(pn4_a=rec(pn4,rec='1,2= 1[Muy satisfecho];
                   4,5= 3[Muy insatisfecho];
                   3=2[Neutro]))

df_a <- df%>%
  group_by(a4,q1tb4)%>%
  summarise(n=n())%>%


#filter()
#@mutate()


