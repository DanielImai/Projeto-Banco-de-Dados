
INSERT INTO INFORMACAO_PAIS (isocode, date,reproduction_rate,stringency_index)
SELECT DISTINCT iso_code, date,reproduction_rate,stringency_index
FROM covid_data
ORDER BY iso_code;


INSERT INTO PAIS (isocode,location, continent, population, extreme_poverty,
gdp_per_capita, handwashing_facilities, human_development_index)
SELECT DISTINCT  iso_code, location, continent, population, extreme_poverty,
gdp_per_capita, handwashing_facilities, human_development_index
FROM covid_data
order by iso_code;

INSERT INTO INFORMACOES_POPULACAO (isocode, population ,
median_age ,aged_65_older ,aged_70_older ,life_expectancy ,
female_smokers ,male_smokers ,cardiovasc_death_rate)
SELECT DISTINCT iso_code, population ,
median_age ,aged_65_older ,aged_70_older ,life_expectancy ,
female_smokers ,male_smokers ,cardiovasc_death_rate
FROM covid_data
order by iso_code;

INSERT INTO CASOS (C_isocode,C_date,total_cases,total_cases_per_million)
SELECT distinct iso_code,date,total_cases,total_cases_per_million
FROM covid_data
order by iso_code;

INSERT INTO NOVOS_CASOS (isocode,date ,new_cases ,new_cases_smothed ,new_cases_per_millon,
new_cases_smoothed_per_million )
SELECT DISTINCT iso_code,date ,new_cases ,new_cases_smoothed , new_cases_per_million,
new_cases_smoothed_per_million
FROM covid_data
ORDER BY iso_code;

INSERT INTO MORTALIDADE (isocode,date,excess_mortality, excess_mortality_cumulative,
 excess_mortality_cumulative_absolute,excess_mortality_cumulative_per_million )
SELECT DISTINCT iso_code,date,excess_mortality, excess_mortality_cumulative,
 excess_mortality_cumulative_absolute,excess_mortality_cumulative_per_million
FROM covid_data
ORDER BY iso_code;

INSERT INTO MORTES_TOTAIS (isocode,date, total_deaths,total_cases_per_million )
SELECT DISTINCT iso_code,date, total_deaths,total_cases_per_million
FROM covid_data
ORDER BY iso_code;

INSERT INTO MORTES_RECENTES ( isocode, date ,new_deaths,new_deaths_smoothed ,new_deaths_per_million ,
new_deaths_smoothed_per_million)
SELECT DISTINCT iso_code, date ,new_deaths,new_deaths_smoothed ,new_deaths_per_million ,
new_deaths_smoothed_per_million
FROM covid_data
ORDER BY iso_code;

INSERT INTO vacinacoes (isocode, date, total_vaccinations, total_vaccinations_per_hundred)
SELECT distinct iso_code, date, total_vaccinations, total_vaccinations_per_hundred
FROM covid_data
order by iso_code;


INSERT INTO pessoasvacinadas (isocode, date, people_vaccinated, people_fully_vaccinated, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred)
SELECT distinct iso_code, date, people_vaccinated, people_fully_vaccinated, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred
FROM covid_data
order by iso_code;

INSERT INTO vacinacoesrecentes (isocode, date, new_vaccinations, new_vaccinations_smoothed,new_vaccinations_smoothed_per_million)
SELECT distinct iso_code, date, new_vaccinations, new_vaccinations_smoothed,new_vaccinations_smoothed_per_million
FROM covid_data
order by iso_code;




INSERT INTO TESTES (isocode, date, total_tests,total_tests_per_thousand , positive_rate , tests_per_case ,
 tests_units  )
SELECT DISTINCT iso_code, date, total_tests,total_tests_per_thousand , positive_rate , tests_per_case ,
 tests_units
FROM covid_data
ORDER BY iso_code;

INSERT INTO TESTESNOVOS (isocode, date, new_tests, new_tests_per_thousand , new_tests_smoothed ,
new_tests_smoothed_per_thousand )
SELECT DISTINCT iso_code, date, new_tests, new_tests_per_thousand , new_tests_smoothed ,
new_tests_smoothed_per_thousand
FROM covid_data
ORDER BY iso_code; 

INSERT INTO TERCEIRADOSE (isocode, date,total_boosters, total_boosters_per_hundred )
SELECT DISTINCT iso_code, date,total_boosters, total_boosters_per_hundred
FROM covid_data
ORDER BY iso_code;

INSERT INTO hospital (isocode, date, hosp_patients, hosp_patients_per_million,hospital_beds_per_thousand, weekly_hosp_admissions, weekly_hosp_admissions_per_million)
SELECT distinct iso_code, date, hosp_patients, hosp_patients_per_million,hospital_beds_per_thousand, weekly_hosp_admissions, weekly_hosp_admissions_per_million
FROM covid_data
order by iso_code;

INSERT INTO uti (isocode, date, icu_patients, icu_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million)
SELECT distinct iso_code,date,icu_patients, icu_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million
FROM covid_data
order by iso_code;



