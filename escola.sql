-- Database: Escola

-- DROP DATABASE IF EXISTS "Escola";

CREATE DATABASE "Escola"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE ALUNO (
    chave_id SERIAL PRIMARY KEY,
    nome varchar(35) not null,
    e_mail varchar(35) not null,
    endereço varchar(35) not null
);