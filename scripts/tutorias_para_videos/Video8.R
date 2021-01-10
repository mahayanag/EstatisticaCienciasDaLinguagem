## CODIGO PARA VIDEO 8: ggplot para fazer histogramas e boxplots


 # carregando o pacote tidyverse
 
 library(tidyverse)
 
 # carregando conjunto de dados
 
 esplex <- read.csv("dados/esplex.csv")
 
 # boxplot de frq incompleto
 
 ggplot(esplex, aes(x = categoria, y = frq))

 # boxplot de frq
 
 ggplot(esplex, aes(x = categoria, y = frq)) +
   geom_boxplot()

 # mudando outliers
 
 ggplot(esplex, aes(x = categoria, y = frq)) +
   geom_boxplot(alpha = 0.5, outlier.size = 2)
 
 # mudando tema
ggplot(esplex, aes(x = categoria, y = frq)) +
  geom_boxplot(alpha = 0.5, outlier.size = 2)+
  theme_bw()


#histograma de imageabilidade

ggplot(esplex, aes(x = imageabilidade)) +
  geom_histogram()+
  theme_bw()

# histograma de imageabilidade por categoria 

ggplot(esplex, aes(x = imageabilidade)) +
  geom_histogram()+
  facet_wrap(~ categoria, ncol = 3)+
  theme_bw()


## filtrando + ggplot

esplex %>% filter(categoria == "NOME")

# histograma de palavras codificadas como NOME

esplex %>% filter(categoria == "NOME") %>%
  ggplot(., aes(x = imageabilidade)) +
  geom_histogram()+
  theme_bw()

