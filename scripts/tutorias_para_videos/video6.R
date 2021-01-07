## CODIGO PARA VIDEO 6


# criando vetor e extraindo media 

x <- c(2, 3, 4, 5)

sum(x)/length(x)


# a funcao para extracao de media aritmetica

mean(x)


# leitura dos dados esplex

esplex <- read.csv(file = "dados/esplex.csv")

# media da imageabilidade

mean(esplex$imageabilidade)


# ordenando notas em ordem crescente e apresentando as 7 primeiras

sort(esplex$imageabilidade)[1:7]

# valores minimo e maximo de imageabilidade

range(esplex$imageabilidade)

# amplitude da imageabilidade

diff(range(esplex$imageabilidade))


## calculando desvio padrao


# calculando diferenca entre media e cada observacao

diferenca <- mean(esplex$imageabilidade)-esplex$imageabilidade

# soma dos quadrados das diferencas

soma.quadrados <-sum(diferenca^2)

# divisao da soma dos quadrados por n-1

divisao<-soma.quadrados/(length(esplex$imageabilidade)-1)

# raiz quadrada da divisao = desvio - padrao

desvio.padrao <- sqrt(divisao)

# desvio padrao de imageabilidade

desvio.padrao

# desvio-padrao de imageabilidade 

sd(esplex$imageabilidade)
