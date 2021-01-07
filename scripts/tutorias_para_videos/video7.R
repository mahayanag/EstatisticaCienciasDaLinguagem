## CODIGO PARA VIDEO 7


# importe o conjunto de dados esplex

esplex <- read.csv("dados/esplex.csv")

# carregar pacote

library(tidyverse)

# media e mediana pelos niveis de categoria

esplex %>% 
  group_by(categoria) %>% 
  summarise(mean(frq), median(frq))



# medidas de posicao e dispersao para frq

esplex %>% 
  group_by(categoria) %>% 
  summarise(media = mean(frq), mediana = median(frq), desvio.iqr = IQR(frq))
