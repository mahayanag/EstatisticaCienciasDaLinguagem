## CODIGO PARA VIDEO 17 E 18

# pacotes para o capitulo
library(tidyverse)
library(broom)


# importar conjunto de dados
aquisicao <- read.csv("dados/aquisicao_mediana.csv")

# ajustando modelo producao ~ idade
mdl.idade <- lm(producao ~ idade, aquisicao) 

# extraindo intercepto e slope
tidy(mdl.idade) %>% 
  select(term, estimate)


# criando variavel
aquisicao <- aquisicao %>% 
  mutate(idade_c = idade - mean(idade))

# vendo a nova variavel criada
head(aquisicao)

# comparando a media de idade e de idade_c
aquisicao %>% 
  summarise(media.idade = mean(idade), media.idade_c = mean(idade_c))

#novo modelo, com variavel centrada
mdl.idade_c <- lm(producao ~ idade_c, aquisicao) 

tidy(mdl.idade_c) %>% 
  select(term, estimate)

# intercepto igual a media  de producao
mean(aquisicao$producao)



# importando dados
callipo <- read.csv("dados/callipo.csv")

# vendo conjunto de dados

str(callipo)


# ajustando modelo compreensao ~ tempo + pseudo
mdl.tempo.pseudo <- lm(compreensao ~ tempo + pseudo, callipo)

tidy(mdl.tempo.pseudo) %>% 
  select(term, estimate)


# conferindo amplitude das variaveis preditoras 
range(callipo$tempo)
range(callipo$pseudo)


# criando valores padronizados para variaveis preditoras

callipo <- mutate(callipo,
                  tempo_c = tempo - mean(tempo), #centrando tempo
                  tempo_z = tempo_c/sd(tempo_c), #padronizando tempo
                  pseudo_c = pseudo - mean(pseudo),
                  pseudo_z = pseudo_c/sd(pseudo_c))

# inspecionando novas variaveis

str(callipo)


# media e desvio-padrao das amostras com valores padronizados

callipo %>% 
  summarise(m.pseudo_z = mean(pseudo_z), 
            sd.pseudo_z = sd(pseudo_z), 
            m.tempo_z = mean(tempo_z), 
            sd.tempo_z = sd(tempo_z))

# novo modelo com valores padronizados

mdl.tempo.pseudo_z <- lm(compreensao ~ tempo_z + pseudo_z, callipo)

tidy(mdl.tempo.pseudo_z) %>% 
  select(term, estimate)

# media de compreensao

mean(callipo$compreensao)

# logaritmo
log(2)
log(100)
log(1000)

# exponencial
exp(log(2))
exp(log(100))
exp(log(1000))


# importar/inspecionar dataframe
godoy <- read.csv("dados/godoy2014.csv")

str(godoy)

# criar variavel com o log de tempo.pronome
godoy$logRT <- log(godoy$tempo.pronome)

# inspecionando nova variavel
head(godoy)

 # histograma com dados de tempo.pronome
 ggplot(godoy, aes(tempo.pronome))+
   geom_histogram()+
   theme_bw()
 
 # histograma com dados de logRT
 ggplot(godoy, aes(logRT))+
   geom_histogram()+
   theme_bw()

