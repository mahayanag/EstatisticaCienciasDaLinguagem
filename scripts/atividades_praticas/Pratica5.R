## Pratica referentes aos videos 11 a 15

#1. Nesse capitulo, fizemos analises considerando apenas um pequeno conjunto dos dados de `esplex.csv`. Agora você pode fazer o mesmo usando todas as 300 observacoes do conjunto de dados.

#(a) Desenhe um grafico de dispersao que mostre a relacao entre concretude e imageabilidade.

#(b) Construa um modelo linear para investigar a relacao entre concretude e imageabilidade de todo o conjunto. Inspecione os seus resultados.

#(c) Tente escrever por extenso o que os valores de intercepto e slope estao te dizendo. Esses valores sao menores ou maiores do que aqueles que vimos para o subconjunto analisado neste capitulo?

#(d) Qual o R ao quadrado do modelo? O que ele significa?

#2. Usando o conjunto de dados `aquisicao_mediana.csv`, repita as tarefas (a), (b) e (c) do exercicio 1 para investigar a relacao entre idade e producao de palavras em criancas.

aquisicao <- read.csv("dados/aquisicao_mediana.csv")

str(aquisicao) #para confirmar o nome das colunas

ggplot(esplex, aes(idade, producao))+
  geom_point(alpha = 0.5, size = 2)+
  theme_bw()

modelo.aquisicao <- lm(producao ~ idade, aquisicao)

summary(modelo.aquisicao)

#### RESPOSTA: O valor do intercepto eh o valor de y quando x eh igual a zero. Em modelo.aquisicao dessa tarefa pratica, vemos que uma crianca de 0 meses produzieia -533 palavras. Isso nao faz sentido para esse conjunto de dados, claro. 

# Jah o valor de slope de idade é 31.341. Esse valor indica que para cada mes vivido, a nota de imageabilidade sobe 0.82888 ponto. Eh importante que esses dados se referem apenas ao intervalo de idade de que trata nossa amostra (de 0 a 30 meses), pois nao temos como saber se a producao de palavras continua tendo uma relacao linear para alem desse intervalo.
