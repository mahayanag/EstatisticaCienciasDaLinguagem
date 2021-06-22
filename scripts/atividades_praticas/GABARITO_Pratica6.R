### Referentes aos videos 15 e 16


#1. Imagine o seguinte modelo:
  
# y ~ A + B


# Supondo que esse modelo tenha um intercepto igual a 2.63, e que os _slopes_ de A e B sejam, respectivamente, 1.32 e 5.78. Calcule o valor de y para uma observacao em que A seja igual a 7 e B seja igual a 4.

# resposta:
y = 2.63 + (1.32*7) + (5.78*4)


# Ainda usando o conjunto `esplex.csv`, selecione apenas as observacoes referentes as palavras classificadas como `NOME` na variavel `categoria` e que tenham tempo de resposta menor que 1300ms (em experimentos de tempo de resposta, eh comum definirmos, com base na literatura, um valor para excluir dados com valores superiores - cf. secao 7.1 de Baayen 2008). 

# A partir desse subconjunto de dados, construa um modelo que mostre como concretude, imageabilidade e o logaritmo da frequencia podem afetar o logaritmo do tempo de resposta (assim como ao longo do capitulo usamos o logaritmo de frequencia (`log(frq)`), voce devera usar aqui o logaritmo do tempo de resposta por razoes que serao explicadas mais adiante). 

# Antes de fazer a tarefa, pense em como voce acha que as variaveis preditoras influenciarao a variavel resposta. Voce acha que a regressao mostrarea correlacoes positivas ou negativas?
  
#  O passo-a-passo a seguir pode te ajudar nessa tarefa.

# a) selecione apenas observacoes em que `categoria` eh igual a NOME;

# b) filtre apenas aquelas observacoes com valor de tempo de resposta menor que 1300 (veja quantas observacoes voce perde quando faz essa filtragem: eh importante reportar!);

dados <- read.csv("dados/esplex.csv")

## inspecionando nome das variaveis

str(dados)

### novo conjunto de dados

library(tidyverse)

dados2 <- dados %>% filter(categoria == "NOME") %>% filter(rt <1300)

# c) faca inspecao grafica entre variavel resposta e variaveis preditoras para ver se ha alguma relacao que seja nao-linear;

# concretude, imageabilidade e o logaritmo da frequencia podem afetar o logaritmo do tempo de resposta

# log(rt) ~ concretude
ggplot(dados2, aes(x = concretude, y = log(rt)))+
  geom_point()

# log(rt) ~ imageabilidade
ggplot(dados2, aes(x = imageabilidade, y = log(rt)))+
  geom_point()

# log(rt) ~ log(frq)
ggplot(dados2, aes(x = log(frq), y = log(rt)))+
  geom_point()

# d) construa seu modelo e interprete os valores de intercepto e _slope_ (lembre-se de que essa interpretacao aqui eh apenas descritiva - nao podemos fazer qualquer generalizacao sem estatistica inferencial)

modelo <- lm(log(rt) ~ concretude + imageabilidade + log(frq), dados2)

summary(modelo)


# e) faca o diagnostico de seu modelo para ver se ele obedece as hipoteses da regressao linear.

# verificando residuos

library(ggfortify)

autoplot(modelo) ## grafico qq mostra que a ponta a distribuicao foge um pouco da linha, mas nada que divirja muito da normal

# verificando ausencia de multicolinearidade (pois concretude e imageabilidade sao mto correlacionadas)

library(car)

vif(modelo) ## sem problemas segundo valor de referencia em Winter(2019)/Zuur et al (2010)

