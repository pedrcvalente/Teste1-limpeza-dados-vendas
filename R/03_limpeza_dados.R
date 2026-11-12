# ----------------------------------------
# Parte 3 - Limpeza dos dados
# ----------------------------------------

# ===== Eliminar registos duplicados =====
# duplicated() mostra TRUE nas linhas repetidas
# o sinal ! quer dizer "não", então ficamos só com as que não são repetidas
dados <- dados[!duplicated(dados), ]
nrow(dados)   # agora devem ser 120 linhas


# ===== Corrigir espaços e maiúsculas/minúsculas =====
# trimws() tira os espaços no início e no fim
dados$nome_cliente <- trimws(dados$nome_cliente)
dados$cidade <- trimws(dados$cidade)
dados$produto <- trimws(dados$produto)
dados$email <- trimws(dados$email)
dados$metodo_pagamento <- trimws(dados$metodo_pagamento)

# Pôr tudo em minúsculas e depois a primeira letra em maiúscula
dados$cidade <- tools::toTitleCase(tolower(dados$cidade))
dados$produto <- tools::toTitleCase(tolower(dados$produto))

# O toTitleCase não pôs bem "Xai-Xai", então corrigi à mão
dados$cidade[dados$cidade == "Xai-xai"] <- "Xai-Xai"

# Métodos de pagamento escritos de forma diferente
dados$metodo_pagamento[dados$metodo_pagamento == "M-PESA"] <- "M-Pesa"
dados$metodo_pagamento[dados$metodo_pagamento == "E-MOLA"] <- "e-Mola"
dados$metodo_pagamento[dados$metodo_pagamento == "CARTÃO"] <- "Cartão"

table(dados$cidade)
table(dados$produto)
table(dados$metodo_pagamento)


# ===== Corrigir tipos de dados =====
# Alguns preços têm vírgula (ex: 36519,66). O R só entende ponto.
# gsub() troca a vírgula pelo ponto
dados$preco_unitario_MZN <- gsub(",", ".", dados$preco_unitario_MZN)
dados$preco_unitario_MZN <- as.numeric(dados$preco_unitario_MZN)

# A idade vem como 61.0, passei para número inteiro
dados$idade <- as.integer(dados$idade)

# Datas: havia duas datas mal escritas
dados$data_venda[dados$data_venda == "15-08-2025"] <- "2025-08-15"
dados$data_venda[dados$data_venda == "31/14/2025"] <- NA   # mês 14 não existe
dados$data_venda <- as.Date(dados$data_venda)

str(dados)


# ===== Identificar e tratar outliers =====
# Primeiro olhei para os gráficos
boxplot(dados$idade, main = "Idade")
boxplot(dados$preco_unitario_MZN, main = "Preço unitário")

# Idade: não é possível ter -5 ou 250 anos
dados$idade[dados$idade < 0 | dados$idade > 100] <- NA

# Quantidade: não pode ser 0 nem negativa
dados$quantidade[dados$quantidade <= 0] <- NA

# Satisfação: a escala é de 1 a 5
dados$satisfacao[dados$satisfacao < 1 | dados$satisfacao > 5] <- NA

# Preço: usei o método do IQR (intervalo interquartil) dado na aula
Q1 <- quantile(dados$preco_unitario_MZN, 0.25, na.rm = TRUE)
Q3 <- quantile(dados$preco_unitario_MZN, 0.75, na.rm = TRUE)
amplitude <- Q3 - Q1
limite_inferior <- Q1 - 1.5 * amplitude
limite_superior <- Q3 + 1.5 * amplitude
limite_superior

# Ver quais preços estão fora dos limites
outliers <- which(dados$preco_unitario_MZN < limite_inferior |
                  dados$preco_unitario_MZN > limite_superior)
dados$preco_unitario_MZN[outliers]   # aparece o 9999999

# Substituir o outlier por NA
dados$preco_unitario_MZN[outliers] <- NA

# Nota: preferi deixar NA em vez de pôr a média,
# para não inventar valores que não sei.


# ===== Validar emails =====
dados$email <- tolower(dados$email)

# Um email válido tem: texto, um @, texto, um ponto e o final (ex: .com)
# grepl() dá TRUE se o email segue esse padrão
email_valido <- grepl("^[^@ ]+@[^@ ]+\\.[a-z]+$", dados$email)

# Ver os emails que não são válidos
dados$email[!email_valido & !is.na(dados$email)]

# Os emails inválidos passam a NA
dados$email[!email_valido] <- NA


# ===== Criar o novo CSV =====
write.csv(dados, "data/processed/dados_limpos.csv", row.names = FALSE, na = "")
