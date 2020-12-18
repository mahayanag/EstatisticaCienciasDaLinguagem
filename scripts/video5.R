## CODIGO PARA VIDEO 5


# importar e inspecionar esplex

esplex <- read.csv("dados/esplex.csv")

str(esplex)


# criar nova coluna metade_frq

esplex$metade_frq <- esplex$frq/2

head(esplex)


# verificando valores unicos para variaveis

unique(esplex$categoria)

unique(esplex$num_caracteres)


## erro em codigo: NULL

levels(esplex$categoria)


# mudando a variavel para codificar como categorica 

esplex$categoria <- as.factor(esplex$categoria )

# inspecionado a codificacao da variavel "categoria"

str(esplex$categoria)


# niveis da variavel "categoria"

levels(esplex$categoria)

#####################################
### Manipulando conjunto de dados ###
#####################################

# instalar pacotes (rodar apenas uma vez)

install.packages("tidyverse")

# carregando pacotes

library(tidyverse)


# selecionando variaveis palavra, concretude, imageabilidade e categoria
 
 esplex %>%
   select(palavra, concretude, imageabilidade, categoria)

# selecionando apenas palavras na categoria NOME ou VERBO

esplex %>%
  filter(categoria == "NOME" | categoria == "VERBO")


# selecionando variaveis e filtrando observacoes

esplex %>%
  select(palavra, concretude, imageabilidade, categoria) %>%
  filter(categoria == "NOME" | categoria == "VERBO") %>%
  filter(concretude > 3)


 # criando conjunto esplex2
 
 esplex2 <- esplex %>%
   select(palavra, concretude, imageabilidade, categoria) %>%
   filter(categoria == "NOME" | categoria == "VERBO") %>%
   filter(concretude > 3) %>%
   droplevels()


## codigo com erro

esplex %>%
  select(palavra, concretude) %>%
  filter(categoria == "NOME" | categoria == "VERBO")


# outra maneira de usar pipe, mantendo codigo na mesma linha

 esplex %>% select(palavra, concretude, imageabilidade, categoria)
 

# selecionando observcoes de palavras especificas
 
 esplex %>%
   filter(palavra == "manera" | palavra == "situación" | palavra == "problema" | palavra == "unión" | palavra == "político" | palavra == "madre")
 
# criando vetor e usando %in%

esplex %>%
  filter(palavra %in% c("manera", "situación", "problema", "unión",  "político", "madre"))


