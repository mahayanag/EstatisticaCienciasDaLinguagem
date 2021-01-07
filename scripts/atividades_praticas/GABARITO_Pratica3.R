### Referentes aos videos 6, 7 e 8


## Pratica

# a) O histograma da Figura 4.8 mostra duas distribuicoes com media igual a 10. Qual dessas distribuicoes tem desvio padrao igual a 1.8 e qual tem desvio padrao igual a 0.9? Como voce sabe?

### RESPOSTA: A figura B tem desvio-padrao mais baixo (0.9), pois as observacoes estao menos dispersas
  
# b) Olhando para as distribuicoes da Figura 4.8 eh possivel dizer que o valor da mediana esta mais proximo de 10 ou 5? Por que?

### RESPOSTA: a mediana estah mais proxima de 10, que eh a media. como a distribuicao eh simetrica, valores da media e mediana devem ser proximos.  
  
# c) Faca um histograma e um boxplot da variavel `rt` (tempo de resposta) de `esplex` por categoria. Como voce classificaria a distribuicao desses dados em relacao a sua simetria?

## primeiro deve importar o conjunto de dados

## histograma
ggplot(esplex, aes(rt))+
  geom_histogram()+
  facet_wrap(~categoria)

## boxplot
ggplot(esplex, aes(categoria, rt))+
  geom_boxplot(alpha = 0.3)

### os dados nao sao simetricos e tem uma cauda mais longa a direita, com alguns valores muito altos (outliers)
  
# d) Use `group_by` e `summarise` para extrair media, desvio padrao, mediana e desvio interquartilico do tempo de resposta para as palavras de cada uma das categorias. Como os valores que voce obteve se relacionam com os boxplots e histogramas que fez no exercicio anterior?

#### RESPOSTA: algumas das celulas da coluna rt estao vazias, o que eh bem comum em estudos experimentais. Voce pode ver na planilha da area environment que essas celulas sao marcadas pela sigla NA. Para que voce consiga extrair os valores de media, mediana, descio-padrao e desvio interquartilico apesar dessas celulas, eh soh colocar o codigo na.rm = TRUE dentro das funcoes que extraem esses valores. Esse codigo diz que o argumento da funcao que especifica a remocao de NA eh TRUE, ou seja, verdadeiro. O codigo eh o seguinte:

esplex %>%
  group_by(categoria) %>%
  summarise(media = mean(rt, na.rm = TRUE), mediana = median(rt, na.rm = TRUE), desviopadrao = sd(rt, na.rm = TRUE), desvio.iqr = IQR(rt, na.rm = TRUE))

## Analisando os dados, vemos que as medianas tem valores mais baixos que as medias, o que pode indicar cauda mais longa a direita (como vimos). O desvio-padrao e o desvios interquartilico mostram que a dispersao das observacoes para o NOME é menor que para as outras categorias, como vemos nos graficos.

