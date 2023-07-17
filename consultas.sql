-- Primeira Questão : Quantos países estão na base de dados?

SELECT DISTINCT
    COUNT(location) AS Paises_na_base_de_dados
FROM
    pais;


-- Segunda Questão : Qual o total de casos para o mundo no dia 01/02/2022?

SELECT 
    total_cases AS Total_de_Casos
FROM
    casos
WHERE
    C_date = '2022/02/1'
        AND C_isocode LIKE '%OWID_WRL%';

-- Terceira Questão : Quais foram os 10 países com mais casos confirmados no mês de janeiro/2022
-- 					(ordem descrescente)?

SELECT DISTINCT
    pais.location AS Paises
FROM
    NOVOS_CASOS,
    pais
WHERE
    YEAR(date) = 2022 AND MONTH(date) = 1
        AND pais.isocode = novos_casos.isocode
        AND novos_casos.isocode NOT LIKE '%OWID%'
ORDER BY new_cases DESC
LIMIT 10;

-- Quarta Questão : Liste os 10 países com maior e os 10 com menor expectativa de vida.

SELECT  *
FROM 
 (
SELECT location
FROM pais, informacoes_populacao
WHERE pais.isocode = informacoes_populacao.isocode
GROUP BY location
 ORDER BY life_expectancy DESC
 LIMIT 10
)  a UNION
SELECT * FROM
(SELECT location
FROM pais, informacoes_populacao
WHERE life_expectancy != 0 AND pais.isocode = informacoes_populacao.isocode
 GROUP BY location
 ORDER BY life_expectancy ASC
 LIMIT 10
 ) b
 LIMIT 20;


-- Quinta Questão : Liste os continentes contendo o total de casos de cada um em 2021

SELECT distinct s.SouthAmerica, n.NorthAmerica, e.Europe, o.Oceania, a.Asia, af.Africa
FROM pais, casos,
(
SELECT distinct sum(new_cases) AS SouthAmerica
FROM pais, novos_casos
WHERE date < '2022-01-01'
 AND date >= '2021-01-01'
 AND novos_casos.isocode = pais.isocode 
 AND continent = 'South America'
 ) AS s,
 (
SELECT distinct sum(new_cases) as NorthAmerica
FROM pais, novos_casos
WHERE date < '2022-01-01' 
AND date >= '2021-01-01'
 AND novos_casos.isocode = pais.isocode 
 AND continent = 'North America'
) AS n,
(
SELECT distinct sum(new_cases) as Europe
FROM pais, novos_casos
WHERE date < '2022-01-01'
 AND date >= '2021-01-01'
 AND novos_casos.isocode = pais.isocode
 AND continent = 'Europe'
) AS e,
(
SELECT distinct sum(new_cases) as Oceania
FROM pais, novos_casos
WHERE date < '2022-01-01' 
AND date >= '2021-01-01' 
AND novos_casos.isocode = pais.isocode
 AND continent = 'Oceania'
) AS o,
(
SELECT distinct sum(new_cases) as Asia
FROM pais, novos_casos
WHERE date < '2022-01-01' 
AND date >= '2021-01-01' 
AND novos_casos.isocode = pais.isocode 
AND continent = 'Asia'
) AS a,
(
SELECT distinct sum(new_cases) AS Africa
FROM pais, novos_casos
WHERE date < '2022-01-01' 
AND date >= '2021-01-01' 
AND novos_casos.isocode = pais.isocode 
AND continent = 'Africa'
) AS af;
 
 
 -- Sexta Questão : Liste os países da Europa e inclua as informações do total de pessoas totalmente
--                  vacinadas em 2021, em valores absolutos e percentuais. Ordene o resultado em
--                  ordem decrescente pelo percentual de vacinados.

SELECT pais.location, people_fully_vaccinated, a.pessoa / b.vacinadas AS Percentual
from
pessoasvacinadas, pais,
 (SELECT population AS pessoa
 FROM pais,pessoasvacinadas 
 WHERE continent = 'Europe' 
 AND date = '2021-12-31'
 AND pais.isocode = pessoasvacinadas.isocode
 GROUP BY location
 ) AS a,
 (SELECT people_fully_vaccinated AS vacinadas
 FROM pessoasvacinadas,pais 
 where pais.continent = 'Europe' 
 AND pais.isocode = pessoasvacinadas.isocode
 AND date = '2021-12-31'
 GROUP BY location
)AS b
where continent = 'Europe'
 AND pais.isocode = pessoasvacinadas.isocode
 AND pessoasvacinadas.date = '2021-12-31'
 AND a.pessoa = pais.population
 AND b.vacinadas = pessoasvacinadas.people_fully_vaccinated
GROUP BY pais.location
ORDER BY Percentual DESC;

/* Setima questão:  Liste os países informando o grau de restrições2 que foram aplicadas à população
					(há um atributo com este índice (stringency) que engloba várias medidas como
					fechamento de escolas, proibição de viagens, . . . ) e o total de novos casos por
					milhão de habitantes confirmados para o mês de janeiro/2022. */

SELECT 
    location, stringency_index, new_cases_per_millon
FROM
    pais,
    informacao_pais,
    novos_casos
WHERE
    stringency_index <> 0
        AND novos_casos.date >= '2022-01-01'
        AND novos_casos.date < '2022-02-01';

-- Oitava Questão: Quais países não possuem informação de pacientes na UTI para o mês de janeiro/
-- 					2022
 
SELECT DISTINCT
    location
FROM
    pais,
    uti
WHERE
    icu_patients = 0 AND date > '2022-01-01'
        AND date < '2022-02-01'
        AND pais.isocode = uti.isocode;

-- Nona Questão : Qual foi o dia com a maior quantidade de novos casos registrados de COVID-19
-- 				no Brasil?

SELECT 
    date
FROM
    novos_casos,
    pais
WHERE
    location = 'Brazil'
        AND pais.isocode = novos_casos.isocode
ORDER BY new_cases DESC
LIMIT 1;

-- Decima Questão : Qual foi o dia com a maior quantidade de mortes confirmadas por COVID-19 no
-- 					mundo?

SELECT 
    date
FROM
    mortes_recentes
ORDER BY new_deaths DESC
LIMIT 1;

