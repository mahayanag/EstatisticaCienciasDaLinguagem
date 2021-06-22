### Referentes aos videos 15 e 16


#1. Imagine o seguinte modelo:
  
# y ~ A + B


# Supondo que esse modelo tenha um intercepto igual a 2.63, e que os _slopes_ de A e B sejam, respectivamente, 1.32 e 5.78. Calcule o valor de y para uma observacao em que A seja igual a 7 e B seja igual a 4.


# 2. Ainda usando o conjunto `esplex.csv`, selecione apenas as observacoes referentes as palavras classificadas como `NOME` na variavel `categoria` e que tenham tempo de resposta menor que 1300ms (em experimentos de tempo de resposta, eh comum definirmos, com base na literatura, um valor para excluir dados com valores superiores - cf. secao 7.1 de Baayen 2008). 

# A partir desse subconjunto de dados, construa um modelo que mostre como concretude, imageabilidade e o logaritmo da frequencia podem afetar o logaritmo do tempo de resposta (Assim como ao longo do capitulo usamos o logaritmo de frequencia (`log(frq)`), voce devera usar aqui o logaritmo do tempo de resposta por razoes que serao explicadas mais adiante). 

# Antes de fazer a tarefa, pense em como voce acha que as variaveis preditoras influenciarao a variavel resposta. Voce acha que a regressao mostrarea correlacoes positivas ou negativas?
  
#  O passo-a-passo a seguir pode te ajudar nessa tarefa.

# a) selecione apenas observacoes em que `categoria` eh igual a NOME;

# b) filtre apenas aquelas observacoes com valor de tempo de resposta menor que 1300 (veja quantas observacoes voce perde quando faz essa filtragem: eh importante reportar!);

# c) faca inspecao grafica entre variavel resposta e variaveis preditoras para ver se ha alguma relacao que seja nao-linear;

# d) construa seu modelo e interprete os valores de intercepto e _slope_ (lembre-se de que essa interpretacao aqui eh apenas descritiva - nao podemos fazer qualquer generalizacao sem estatistica inferencial)


# e) faca o diagnostico de seu modelo para ver se ele obedece as hipoteses da regressao linear.