# Limpeza de Dados de Vendas em R

Trabalho da cadeira de Programação em R. O objectivo é limpar um ficheiro de vendas que tem vários erros.

## O que foi feito
1. Importar o ficheiro com `read.csv()`
2. Identificar valores ausentes com `is.na()`
3. Eliminar registos duplicados
4. Corrigir espaços e letras maiúsculas/minúsculas
5. Identificar e tratar outliers
6. Corrigir tipos de dados
7. Validar emails
8. Criar um novo CSV com os dados limpos

## Pastas
- `data/raw` - ficheiro original
- `data/processed` - ficheiro limpo
- `R` - scripts (correr `R/00_executar_tudo.R`)
- `reports` - pequeno relatório

## Resultado
O ficheiro tinha 125 linhas e ficou com 120 depois de tirar os duplicados.

## Autor
Pedro Carlos Valente - 1º ano
