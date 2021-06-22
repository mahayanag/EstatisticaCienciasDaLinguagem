## CODIGOS PARA VIDEO 15 e 16

############################
#### REGRESSAO MULTIPLA ####
############################

# importar conjunto de dados

esplex <- read.csv("dados/esplex.csv")


# ajustando modelos 

modelo.c <- lm(imageabilidade ~ concretude, data = esplex)

modelo.cffr <- lm(imageabilidade ~ concretude + familiaridade + log(frq), data = esplex)

# inspecionando intercepto e slope

library(broom)

tidy(modelo.c) %>% 
  select(term, estimate)

tidy(modelo.cffr) %>% 
  select(term, estimate)

# buscando r2 com funcao glance (pacote broom)

glance(modelo.c)

glance(modelo.cffr)

###########################################
#### FACA UMA PAUSA AQUI PARA ABSORVER ####
#### BEM OS CONCEITOS DE SLOPE E       #### 
#### INTERCEPTO NO CONTEXTO DA         ####
#### REG. LINAR MULTIPLA - CONTINUE    #### 
#### QUANDO SE SENTIR CONFORTAVEL      ####
###########################################

## FIM DO VIDEO 15
## INICIO DO VIDEO 16

################################
#### DIAGNOSTICO DE MODELOS ####
################################

# carregando pacote ggfortify (deve ser baixado previamente)

library(ggfortify)

# inspecionando os resíduos de modelo.cffr

autoplot(modelo.cffr)

# carregando o pacote car (deve ter sido baixado)

library(car)

# inspecionando vif

vif(modelo.cffr)
