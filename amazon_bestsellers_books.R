# Projeto Amazon Bestsellers

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

# Verificando valores ausentes no dataset
sum(is.na(amazon_data))

# Felizmente não temos nenhum valor ausente no dataset. Para cada variável
# há 550 valores registrados.