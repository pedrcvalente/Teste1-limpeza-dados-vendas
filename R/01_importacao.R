# ----------------------------------------
# Trabalho de Limpeza de Dados em R
# Parte 1 - Importar o ficheiro
# ----------------------------------------

# Ler o ficheiro CSV
# na.strings serve para o R considerar as células vazias como NA
dados <- read.csv("data/raw/dados_sujos_limpeza.csv",
                  na.strings = c("", "NA"),
                  fileEncoding = "UTF-8-BOM")

# Ver as primeiras linhas
head(dados)

# Ver o número de linhas e colunas
dim(dados)

# Ver o tipo de cada coluna
str(dados)
