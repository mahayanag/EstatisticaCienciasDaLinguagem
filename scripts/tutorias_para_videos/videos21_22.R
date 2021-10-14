## CODIGO PARA VIDEOS 21 e 22

# carregando amostras
amostra1 <- read.csv(file = "dados/amostra1.csv")
amostra2 <- read.csv(file = "dados/amostra2.csv")
amostra3 <- read.csv(file = "dados/amostra3.csv")


# carregando pacote (deve ser baixado previamente com install.packages)
library(effsize)

# d para amostra 1
cohen.d(notas ~ metodo, amostra1)

# d para amostra 2
cohen.d(notas ~ metodo, amostra2)

# d para amostra 3
cohen.d(notas ~ metodo, amostra3)

# correlacao entre [1,2] e [2,3]

x <- c(1,2) # cria valores de x
y <- c(2,3) # cria valores de y

cor(x, y)