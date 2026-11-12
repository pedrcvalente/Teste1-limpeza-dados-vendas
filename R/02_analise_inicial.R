# ----------------------------------------
# Parte 2 - Identificar valores ausentes
# ----------------------------------------

# is.na() diz TRUE onde falta um valor
# colSums() soma os TRUE de cada coluna
colSums(is.na(dados))

# Total de valores ausentes no ficheiro todo
sum(is.na(dados))

# Ver quantas linhas estão repetidas
sum(duplicated(dados))

# Ver os valores diferentes de algumas colunas
# (assim dá para ver os erros de escrita)
table(dados$cidade)
table(dados$produto)
table(dados$metodo_pagamento)
table(dados$satisfacao)
summary(dados$idade)
