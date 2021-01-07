## CODIGOS PARA VIDEO 1: comandos basicos no R

## coloque no codigo abaixo o caminho adequado para importar esplex do seu computador (conforme vimos no video 2)

esplex <- read.csv("dados/esplex.csv")

# verificando o conteudo do objeto esplex

head(esplex)

# verificando o tipo de dados nas colunas de esplex

str(esplex)

# verificando os nomes das colunas de esplex

names(esplex)


# acessando a linha 3, coluna 2 de esplex

esplex[3, 2]

# acessando a linha 3 de esplex

esplex[3, ]

# acessando a coluna 2 de esplex

esplex[, 2]

# acessando a coluna 2 de esplex

esplex$concretude

# media de altura dos esplex

mean(esplex$concretude)