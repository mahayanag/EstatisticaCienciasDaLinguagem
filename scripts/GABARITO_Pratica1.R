## RESPOSTAS

# A soma de 567 e 27783 
567 + 27783

# Raiz quadrada de 76
sqrt(76)

# Crie um vetor com os numeros 3, 4, 5, 8 e 10
vetor1 <- c(3, 4, 5, 8, 10)

#Crie outro vetor com os numeros 0, 0, 2, 1 e 4
vetor2 <- c(0, 0, 2, 1, 4)

#Some os dois vetores que vc criou
vetor1 + vetor2

#Crie um vetor com o nome ou sigla dos estados da regiao nordeste

nordeste <- c("AL","BA", "CE", "MA", "PB", "PE", "PI", "RN", "SE")

#Importe o conjunto de dados _alunos.csv_ (material coletado pelo Prof Marcus Nunes - DEST/UFRN) e tente entender o que esse conjunto de dados mostra. Para isso, siga os passos:

dados <- read.csv("dados/alunos.csv") 
 
#Veja quantas observacoes e variaveis o conjunto tem.
  
  ## tem 119 observacoes de 15 variaveis

# Use a função head() para ver o conjunto de dados

head(dados)

# Use a funcao `str()` para ver o tipo de colunas desse conjunto: quantas sao `int` e quantas são `int`, `num` e `chr`?

str(dados)

    #sao 6 int (ano, idade, altura, calcado, irmaos, alcool, sono)

    # sao 4 num (peso, sono, exercicio, enem)

    # sao 5 chr (genero, conjuge, fumante, estimacao, ufrn)

#Use a funcao `names()` para ver o nome das colunas do conjunto de dados

names(dados)

# Recupere o valor na segunda linha, na quinta coluna.

dados[2, 5]

#Liste os valores da coluna `enem`.

dados$enem