
drop table if exists PAIS;
CREATE TABLE PAIS (
    isocode VARCHAR(15),
    location TEXT,
    continent TEXT,
    population FLOAT,
    extreme_poverty FLOAT,
    gdp_per_capita FLOAT,
    handwashing_facilities FLOAT,
    human_development_index FLOAT,
    PRIMARY KEY (isocode)
);

drop table if exists CASOS;
CREATE TABLE CASOS (
    C_isocode VARCHAR(15),
    C_date DATE,
    total_cases FLOAT,
    total_cases_per_million FLOAT,
    PRIMARY KEY (C_isocode , C_date)
);

drop table if exists NOVOS_CASOS;
CREATE TABLE NOVOS_CASOS (
    isocode VARCHAR(15),
    date DATE,
    new_cases FLOAT,
    new_cases_smothed FLOAT,
    new_cases_per_millon FLOAT,
    new_cases_smoothed_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists MORTALIDADE;
CREATE TABLE MORTALIDADE (
    isocode VARCHAR(15),
    date DATE,
    excess_mortality FLOAT,
    excess_mortality_cumulative FLOAT,
    excess_mortality_cumulative_absolute FLOAT,
    excess_mortality_cumulative_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists MORTES_TOTAIS;
CREATE TABLE MORTES_TOTAIS (
    isocode VARCHAR(15),
    date DATE,
    total_deaths FLOAT,
    total_cases_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists MORTES_RECENTES;
CREATE TABLE MORTES_RECENTES (
    isocode VARCHAR(15),
    date DATE,
    new_deaths FLOAT,
    new_deaths_smoothed FLOAT,
    new_deaths_per_million FLOAT,
    new_deaths_smoothed_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists INFORMACAO_PAIS;
CREATE TABLE INFORMACAO_PAIS (
    isocode VARCHAR(15),
    date DATE,
    reproduction_rate FLOAT,
    stringency_index FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists UTI;
CREATE TABLE UTI (
    isocode VARCHAR(15),
    date DATE,
    icu_patients FLOAT,
    icu_patients_per_million FLOAT,
    weekly_icu_admissions FLOAT,
    weekly_icu_admissions_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

drop table if exists HOSPITAL;
CREATE TABLE HOSPITAL (
    isocode VARCHAR(15),
    date DATE,
    hosp_patients FLOAT,
    hosp_patients_per_million FLOAT,
    hospital_beds_per_thousand FLOAT,
    weekly_hosp_admissions FLOAT,
    weekly_hosp_admissions_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS TESTES;
CREATE TABLE TESTES (
    isocode VARCHAR(15),
    date DATE,
    total_tests FLOAT,
    total_tests_per_thousand FLOAT,
    positive_rate FLOAT,
    tests_per_case FLOAT,
    tests_units FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS TESTESNOVOS;
CREATE TABLE TESTESNOVOS (
    isocode VARCHAR(15),
    date DATE,
    new_tests FLOAT,
    new_tests_per_thousand FLOAT,
    new_tests_smoothed FLOAT,
    new_tests_smoothed_per_thousand FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS VACINACOES;
CREATE TABLE VACINACOES (
    isocode VARCHAR(15),
    date DATE,
    total_vaccinations FLOAT,
    total_vaccinations_per_hundred FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS VACINACOESRECENTES;
CREATE TABLE VACINACOESRECENTES (
    isocode VARCHAR(15),
    date DATE,
    new_vaccinations FLOAT,
    new_vaccinations_smoothed FLOAT,
    new_vaccinations_smoothed_per_million FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS PESSOASVACINADAS;
CREATE TABLE PESSOASVACINADAS (
    isocode VARCHAR(15),
    date DATE,
    people_vaccinated FLOAT,
    people_fully_vaccinated FLOAT,
    people_vaccinated_per_hundred FLOAT,
    people_fully_vaccinated_per_hundred FLOAT,
    new_people_vaccinated_smoothed FLOAT,
    new_people_vaccinated_smoothed_per_hundred FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS TERCEIRADOSE;
CREATE TABLE TERCEIRADOSE (
    isocode VARCHAR(15),
    date DATE,
    total_boosters FLOAT,
    total_boosters_per_hundred FLOAT,
    PRIMARY KEY (isocode , date)
);

DROP TABLE IF EXISTS  INFORMACOES_POPULACAO;
CREATE TABLE INFORMACOES_POPULACAO (
    isocode VARCHAR(15),
    population FLOAT,
    median_age FLOAT,
    aged_65_older FLOAT,
    aged_70_older FLOAT,
    life_expectancy FLOAT,
    female_smokers FLOAT,
    male_smokers FLOAT,
    cardiovasc_death_rate FLOAT,
    PRIMARY KEY (isocode)
);

alter table PAIS
add foreign key (isocode) references INFORMACAO_PAIS (isocode);

alter table INFORMACOES_POPULACAO
add foreign key (isocode)references PAIS (isocode);
-- =======
alter table CASOS
add foreign key (C_isocode) references PAIS (isocode);

alter table NOVOS_CASOS
add foreign key (isocode) references CASOS(C_isocode);

-- =======

alter table VACINACOES
add foreign key (isocode)references PAIS (isocode);

alter table PESSOASVACINADAS 
add foreign key (isocode) references vacinacoes (isocode);

alter table terceiradose
add foreign key (isocode) references vacinacoes (isocode);

alter table VACINACOESRECENTES
add foreign key (isocode)references vacinacoes (isocode);

-- ====
alter table HOSPITAL
add foreign key (isocode)references pais (isocode);

alter table UTI
add foreign key (isocode)references hospital (isocode);

-- =====
alter table MORTALIDADE
add foreign key (isocode)references pais (isocode);

alter table MORTES_TOTAIS
add foreign key (isocode)references mortalidade (isocode);

alter table MORTES_RECENTES
add foreign key (isocode)references mortes_totais(isocode);

-- =======

alter table TESTES
add foreign key (isocode)references casos (C_isocode);

alter table TESTESNOVOS
add foreign key (isocode) references testes (isocode);


-- ============================================================================

/*
alter table TESTES drop foreign key testes_ibfk_1;
alter table TESTESNOVOS drop foreign key TESTESNOVOS_ibfk_1; 
alter table NOVOS_CASOS drop foreign key NOVOS_CASOS_ibfk_1;
alter table MORTES_TOTAIS drop foreign key MORTES_TOTAIS_ibfk_1;
alter table MORTES_RECENTES drop foreign key MORTES_RECENTES_ibfk_1;
alter table MORTALIDADE drop foreign key MORTALIDADE_ibfk_1;
alter table UTI drop foreign key uti_ibfk_1;
alter table HOSPITAL drop foreign key HOSPITAL_ibfk_1;
alter table VACINACOESRECENTES drop foreign key VACINACOESRECENTES_ibfk_1;
alter table pessoasvacinadas drop foreign key pessoasvacinadas_ibfk_1;
alter table terceiradose drop foreign key terceiradose_ibfk_1;
alter table VACINACOES drop foreign key VACINACOES_ibfk_1;
alter table CASOS drop foreign key casos_ibfk_1 ; 
alter table INFORMACOES_POPULACAO drop foreign key informacoes_populacao_ibfk_1;
alter table PAIS drop foreign key pais_ibfk_1 
*/