SELECT COUNT(DISTINCT cpf_cnpj_doador) as qtde_doadores,
       MAX(valor_receita) as maximo,
       MIN(valor_receita) as minimo,
       ROUND(AVG(valor_receita), 2) as media,
       SUM(valor_receita) as total
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cpf_candidato = '94062897849';