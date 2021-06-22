## CODIGO PARA VIDEOS 17 e 18

#######################
#### MODELO LINEAR ####
#######################


## carregando pacotes para o capitulo
library(tidyverse)
library(broom)

## conjunto de dados

esplex <- read.csv("dados/esplex.csv")

str(esplex)

levels(esplex$categoria)

### apenas se CATEGORIA nao estiver codificada como factor, rodar o codigo abaixo
# codificando variavel como categorica
esplex$categoria <- as.factor(esplex$categoria)

str(esplex)


# criando subconjunto de dados

esplex.cat <- esplex %>% 
  select(palavra, categoria, concretude) %>%  # L1
  filter(categoria %in% c("VERBO", "NOME")) %>% # L2
  group_by(categoria) %>% # L3
  arrange(desc(concretude)) %>% # L4
  top_n(n = 6) %>%  # L5
  droplevels()

# inspecionando novo conjunto
esplex.cat


## ajustar o modelo
modelo.categoria <- lm(concretude ~ categoria, esplex.cat)

## coeficientes
tidy(modelo.categoria) %>% 
  select(term, estimate)

## médias de concretude por categoria
esplex.cat %>%
  group_by(categoria) %>%
  summarize(mean(concretude))

# ajustando os niveis manualmente
esplex.cat <- mutate(esplex.cat, categoria01 = ifelse(categoria == "VERBO", 1, 0))


## ajustar o modelo
modelo.categoria01 <- lm(concretude ~ categoria01, esplex.cat)

## coeficientes
tidy(modelo.categoria01) %>% 
  select(term, estimate)


# mudando nivel de referencia da variavel
esplex.cat$categoriaRelevel <- relevel(esplex.cat$categoria, ref = "VERBO")


# novo modelo com novo nivel de referencia
modelo.relevel = lm(concretude ~ categoriaRelevel, esplex.cat)

tidy(modelo.relevel) %>% 
  select(term, estimate)


###########################################
#### FACA UMA PAUSA AQUI PARA ABSORVER ####
#### BEM OS CONCEITOS DE SLOPE E       #### 
#### INTERCEPTO NESSE NOVO CONTEXTO -  ####
#### CONTINUE QUANDO SE SENTIR         ####
#### CONFORTAVEL                       ####
###########################################

## FIM DO VIDEO 17
## INICIO DO VIDEO 18

####################
#### CONTRASTES ####
####################

# conferindo contraste
contrasts(esplex.cat$categoria)


# ajustanto novo contraste
contrasts(esplex.cat$categoria) <- contr.sum(2)

contrasts(esplex.cat$categoria)


# novo modelo: contraste por sum coding
modelo.contraste <- lm(concretude ~ categoria, esplex.cat)

tidy(modelo.contraste) %>% 
  select(term, estimate)


# tirando a media da nota de concretude por categoria
esplex %>% 
  group_by(categoria) %>% 
  summarise(media = mean(concretude))

# modelo para esplex
modelo.3niveis <- lm(concretude ~ categoria, esplex)

tidy(modelo.3niveis) %>% 
  select(term, estimate)


# investigando contrastes
contrasts(esplex$categoria)

## diagnostico do modelo
library(ggfortify)
autoplot(modelo.3niveis)
