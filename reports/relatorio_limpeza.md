# Relatório

## Problemas encontrados
- 5 linhas repetidas
- Valores em falta: idade (12), cidade (10), preço (7), email (8)
- Cidades e métodos de pagamento escritos de formas diferentes (ex: MATOLA e Matola, M-PESA e M-Pesa)
- Produtos com espaços a mais (ex: " computador ")
- Preços com vírgula em vez de ponto
- Idades impossíveis (-5 e 250)
- Quantidades 0 e -3
- Satisfação 0 e 9 (a escala é de 1 a 5)
- Um preço muito alto: 9 999 999 MZN
- Duas datas mal escritas: "15-08-2025" e "31/14/2025"
- Dois emails errados: "email_invalido" e "maria@@email.com"

## O que fiz
- Tirei as linhas repetidas com `duplicated()`.
- Usei `trimws()`, `tolower()` e `toTitleCase()` para o texto.
- Troquei a vírgula pelo ponto com `gsub()` e passei o preço para número.
- Os valores impossíveis passaram a NA.
- Para o preço usei o método do IQR. Só o 9 999 999 ficou fora dos limites.
- Corrigi a data "15-08-2025". A "31/14/2025" ficou NA porque o mês 14 não existe.
- Validei os emails com `grepl()`. Os dois errados ficaram NA.

## Conclusão
Não substituí os NA pela média ou mediana para não inventar dados.
O ficheiro final tem 120 linhas e 11 colunas.
