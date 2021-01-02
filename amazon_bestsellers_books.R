# Projeto Amazon Bestsellers

### DATA WRANGLING ###

# Definindo o diretório de trabalho
setwd("C:/Users/Pichau/Documents/FCD/Projetos/project_amazon_bestsellers_books")
getwd()

# Definindo pacotes de trabalho
library(readr)
library(dplyr)
library(tidyr)
library(plyr)
library(ggplot2)

# Carregando os dados
amazon_data <- read_csv("raw_bestsellers_with_categories.csv")

# Análise das variáveis
glimpse(amazon_data)
View(amazon_data)
head(amazon_data)
class(amazon_data)

# Variáveis categóricas: "Name", "Author" e "Genre"
# Variáveis numéricas: "User Rating", "Reviews", "Price" e "Year"

# Mudando o nome da variável "User rating" para "User_rating"
names(amazon_data)[3] <- "User_rating"

# Sumarização das variáveis númericas
amazon_data %>% select(User_rating, Reviews, Price, Year) %>% summary()

# Verificando valores ausentes no dataset somando todos os valores NA.
sum(is.na(amazon_data))

# Felizmente não temos nenhum valor ausente no dataset. Para cada variável
# há 550 valores registrados.

# Convertendo as variáveis Genre e Year para o tipo fator em um novo dataset
amazon_data2 <- amazon_data
amazon_data2$Genre <- as.factor(amazon_data2$Genre)
amazon_data2$Year <- as.factor(amazon_data2$Year)
glimpse(amazon_data2)
head(amazon_data2)

# Verificando duplicidade

amazon_data2$Name %>% table() %>% sort(decreasing = TRUE) %>% head()
sum(duplicated(amazon_data2))

# Temos o mesmo nome de livro registrado mais de uma vez, porém zero linhas duplicadas.

amazon_data2 %>%
  select(Name, Author, User_rating, Reviews, Price, Year, Genre) %>%   
  filter(str_detect(Name, "Publication Manual of the American Psychological Association, 6th Edition"))

# A partir do exemplo acima, foi detectado que o mesmo livro aparece mais de uma vez porém em ano diferente.

# Confirmando se a distribuição de registro é igualitária por ano. Temos um total de 550 registros, portanto
# devemos ter 50 registros por ano.

g1 <- ggplot(amazon_data2, aes(Year, fill = Year)) + geom_bar() + guides(fill = FALSE) +
  ggtitle("Verificação de registro por ano") +  theme(plot.title = element_text(hjust = 0.5)) + xlab("Ano") +
  ylab("Contador")
g1

# De acordo com o gráfico temos 50 registros por ano.

### DATA ANALYSIS ###
