## CODIGOS PARA VIDEO 12, 13 e 14 (regressao linear 1, 2 e 3)

##########################
### REGRESSAO LINEAR 1 ###
##########################

## pacotes usados no capitulo

library(tidyverse)

## criacao do conjunto de dados e inspecao

esplex <- read.csv("dados/esplex.csv")

esplexSUB = esplex %>%
  select(palavra, imageabilidade, concretude) %>% 
  filter(palavra %in% c("manera", "situación", "problema", 
                        "unión",  "político", "madre"))

head(esplexSUB)


## criando um modelo de regressao linear de imageabilidade 
## em funcao de concretude

modelo <- lm(imageabilidade ~ concretude, data = esplexSUB)


## ver os nomes dos objetos contidos no objeto modelo

names(modelo)

## ver o que ha em fitted.values e residuals

modelo$fitted.values

modelo$residuals

###########################################
#### FACA UMA PAUSA AQUI PARA ABSORVER ####
#### BEM OS CONCEITOS DE CORRELACAO,   ####
#### REGRESSAO, VALORES OBSERVADOS,    ####
#### AJUSTADOS E RESIDUOS - CONTINUE   #### 
#### QUANDO SE SENTIR CONFORTAVEL      ####
###########################################

## FIM DO VIDEO 12
## INICIO DO VIDEO 13

##########################
### REGRESSAO LINEAR 2 ###
##########################

## se voce estah comecando uma sessao nova a partir daqui, lembre-se de antes rodar todos os codigos anteriores

## buscando o sumario dos valores da regressao linear

summary(modelo)

## valor de imageabilidade para palavra com nota 2 de concretude

0.4654 + (1.0112*2)

## valor de imageabilidade para palavra com nota 3 de concretude

0.4654 + (1.0112*3)

## valor de imageabilidade para palavra com nota 6.212 de concretude
## (correspondente a madre)

0.4654 + (1.0112*6.212)


###########################################
#### FACA UMA PAUSA AQUI PARA ABSORVER ####
#### BEM OS CONCEITOS DE INTERCEPTO    ####
#### E SLOPE - CONTINUE QUANDO         ####
#### SE SENTIR CONFORTAVEL             ####
###########################################

## FIM DO VIDEO 13
## INICIO DO VIDEO 14

##########################
### REGRESSAO LINEAR 3 ###
##########################

## se voce estah comecando uma sessao nova a partir daqui, lembre-se de antes rodar todos os codigos anteriores

## buscando os valores ajustados no modelo (o primeiro dado 
## corresponde a madre)

modelo$fitted

# construindo modelo.nulo

modelo.nulo <- lm(imageabilidade ~ 1, esplexSUB)

# comparando residuos de modelo.nulo e modelo

modelo.nulo$residuals

modelo$residuals


# somando residuos

sum(modelo$residuals)
sum(modelo.nulo$residuals)

# elevando os residuos ao quadrado

residuo.quadrado.modelo     <- modelo$residuals^2
residuo.quadrado.nulo       <- modelo.nulo$residuals^2

# somando o quadrado dos residuos

sum(residuo.quadrado.modelo)
sum(residuo.quadrado.nulo)

# elevando o valor de r ao quadrado para 
# correlacao concretude x imageabilidade

(cor(esplexSUB$concretude, esplexSUB$imageabilidade))^2

####################################
#### ALGUNS COMANDOS ADICIONAIS ####
####################################

# nao estao no video
# servem para recuperar apenas as informacoes de slope e intercepto do modelo (sem precisar buscar td aquilo que vem com a funcao summary)

# usa-se o pacote broom

# baixando e instalando broom
install.packages("broom")
library(broom)

# usando tidy para extrair coeficientes de uma regressao linear
# o select seleciona apenas alguns valores: aqui, intercepto (term) e slope (estimate)

tidy(modelo) %>% 
  select(term, estimate)

# acessar a tabela completa de coeficientes com tidy

tidy(modelo) 

