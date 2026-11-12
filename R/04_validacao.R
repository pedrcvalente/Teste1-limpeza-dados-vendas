# ----------------------------------------
# Parte 4 - Verificar se a limpeza ficou bem
# ----------------------------------------

# Ler o ficheiro novo
limpos <- read.csv("data/processed/dados_limpos.csv", na.strings = "")

dim(limpos)                      # 120 linhas
sum(duplicated(limpos))          # deve dar 0
colSums(is.na(limpos))           # valores ausentes depois da limpeza
summary(limpos$idade)            # idades entre 18 e 70
table(limpos$satisfacao)         # só de 1 a 5
table(limpos$cidade)
table(limpos$metodo_pagamento)
