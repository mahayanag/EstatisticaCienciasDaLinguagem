## Pratica referente aos videos 17 e 18

#Para praticar o que aprendemos neste capitulo, use o conjunto de dados `alunos.csv` e ajuste um modelo linear para investigar se a altura de uma pessoa (medida em centimetros nesse modelo) muda em funcao de seu genero. Voce devera ajustar dois modelos para praticar o que aprendemos sobre contrastes:

# carregando pacote e importando dados
library(tidyverse)
alunos <- read.csv("dados/alunos.csv", stringsAsFactors = TRUE)

str(alunos) ## genero jah esta codificado como factor

# inspecionando distribuicao de altura
ggplot(alunos, aes(genero, altura))+
  geom_boxplot()+
  theme_bw()

contrasts(alunos$genero) 
# jah estah em treatment (default do R), 
# fem como nivel de referencia

#1. Um primeiro modelo, com contraste do tipo _treatment_ entre as variaveis.

# construindo modelo 1
mdl <- lm(altura ~ genero, alunos)

# coeficientes
tidy(mdl1) %>% 
  select(term, estimate)

## intercepto eh o nivel de referencia (feminino)
## slope corresponde a diferenca de medias em os niveis feminino e masculino
## homens sao em media 11.7 cm mais altos que as mulheres nessa amostra

#2. Um segundo modelo, com contraste do tipo _sum coding_.

## ajustando contraste
# ajustanto novo contraste
contrasts(alunos$genero) <- contr.sum(2)

contrasts(alunos$genero) ## sum coding, centrou intercepto

# construindo modelo 2
mdl2 <- lm(altura ~ genero, alunos)

# coeficientes
tidy(mdl2) %>% 
  select(term, estimate)

## intercepto agora eh a media de altura da amostra:
mean(alunos$altura)

## slope de genero1 eh metade da diferenca entre os niveis masculino e feminino (jah que eles foram codificados como -1 e 1)