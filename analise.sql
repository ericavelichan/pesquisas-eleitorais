-- Quais foram os diferentes institutos de pesquisa das eleições de 2018?
SELECT DISTINCT instituto
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano = 2018
LIMIT 1000;

-- Quais foram os candidatos selecionados na pesquisa?
SELECT DISTINCT nome_candidato
FROM `basedosdados.br_poder360_pesquisas.microdados`
WHERE ano = 2018;

-- Quais foram os valores de receitas - máximo, mínimo, média e total - (doações PF/PJ) para os candidatos das eleições de 2018 em SP?
SELECT MAX(valor_receita) as maximo,
       MIN(valor_receita) as minimo,
       AVG(valor_receita) as media,
       SUM(valor_receita) as total
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP';

-- Quem foram os candidatos da pesquisa de 2018 para governador de SP?
SELECT DISTINCT nome_candidato, cpf_candidato
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cargo = 'Governador';

-- Informações sobre as receitas do candidato eleito - João Dória
SELECT MAX(valor_receita) as maximo,
       MIN(valor_receita) as minimo,
       AVG(valor_receita) as media,
       SUM(valor_receita) as total
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cpf_candidato = '94062897849';

-- Quantos doadores o candidato Dória teve?
SELECT COUNT(DISTINCT cpf_cnpj_doador) as qtde_doadores
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cpf_candidato = '94062897849';

-- Quantos doadores (receita) o governador Dória teve na eleição de 2018?
SELECT COUNT(DISTINCT cpf_cnpj_doador) as qtde_doadores,
       MAX(valor_receita) as maximo,
       MIN(valor_receita) as minimo,
       ROUND(AVG(valor_receita), 2) as media,
       SUM(valor_receita) as total
FROM `basedosdados.br_tse_eleicoes.receitas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cpf_candidato = '94062897849';

-- Quantos fornecedores distintos o governador Dória teve na eleição de 2018? Valor máximo, mínimo, total de despesas?
SELECT COUNT(DISTINCT cpf_cnpj_fornecedor) as qtde_fornecedores,
       MAX(valor_despesa) as maximo,
       MIN(valor_despesa) as minimo,
       SUM(valor_despesa) as total
FROM `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE ano = 2018
  AND sigla_uf = 'SP'
  AND cpf_candidato = '94062897849';

--Despesas do candidato João Dória nas eleições de 2018 
SELECT ano,
nome_candidato, 
  MAX(valor_despesa) as max_valor_despesa,
  MIN(valor_despesa) as min_valor_despesa,
  ROUND(AVG(valor_despesa), 2) AS media_valor_despesa,
  SUM(valor_despesa) as total_de_despesaFROM `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE ano = 2018 AND sigla_uf = 'SP' AND cpf_candidato = '94062897849'
group by nome_candidato, ano;

--Despesas de todos os candidatos de SP nas eleições de 2018 do estado de SP
SELECT  ano,
nome_candidato,
MAX(valor_despesa) as max_valor_despesa,
 MIN(valor_despesa) as min_valor_despesa,
 ROUND(AVG(valor_despesa), 2) AS media_valor_despesa,
 SUM(valor_despesa) as total_de_despesaFROM `basedosdados.br_tse_eleicoes.despesas_candidato`
WHERE ano = 2018 AND sigla_uf = 'SP' and cargo = 'governador'
group by nome_candidato, ano;

--Despesas dos cargos de governadores do Brasil
SELECT ano,
cargo,
sigla_uf,
 MAX(valor_despesa) as max_valor_despesa,
 MIN(valor_despesa) as min_valor_despesa,
 ROUND(AVG(valor_despesa), 2) AS media_valor_despesa,
 SUM(valor_despesa) as total_de_despesaFROM `basedosdados.br_tse_eleicoes.despesas_candidato`
 WHERE ano = 2018 and cargo = 'governador'
group by cargo, ano, sigla_uf;