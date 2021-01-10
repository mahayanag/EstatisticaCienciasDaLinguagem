## CODIGOS PARA VIDEO 11: correlacoes e grafico de dispersao

##################
### CORRELACAO ###
##################

# importando/inspecionando aquisicao_mediana 

aquisicao <- read.csv(file = "dados/aquisicao_mediana.csv")

str(aquisicao)

# calculando valor de r para producao x idade
cor(aquisicao_mediana$producao, aquisicao_mediana$idade)

# importando/inspecionando elp 

elp <- read.csv(file = "dados/ELP_frequency.csv")

str(elp)

# calculando valor de r para log(Freq) e log(RT)
cor(log(elp$Freq), log(elp$RT))