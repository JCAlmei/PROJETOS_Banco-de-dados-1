-- CRIAR O BANCO DE DADOS --

CREATE DATABASE "CursoDeProgramacao"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- CRIAR AS TABELAS

create table disciplinas (
  id_disciplinas serial primary key,
  nome_disciplina varchar(50) not null,
  nome_professor varchar(50) not NULL
);

create table alunos (
  id_alunos serial primary key,
  nome_alunos varchar(50) not null,
  disciplinas_id int,
  FOREIGN key (disciplinas_id)
  	REFERENCES disciplinas (id_disciplinas)
);


-- INSERIR DADOS NAS TABELAS --

insert into disciplinas(nome_disciplina, nome_professor) values ('Banco de Dados', 'Maria Alves');
insert into disciplinas(nome_disciplina, nome_professor) values ('Python', 'Pietro Souza');
insert into disciplinas(nome_disciplina, nome_professor) values ('Poo', 'Bia Tavares');

insert into alunos(nome_alunos, disciplinas_id) values ('Claiton', 2);
insert into alunos(nome_alunos, disciplinas_id) values ('Carol', null);
insert into alunos(nome_alunos, disciplinas_id) values ('Ruan', 2);
insert into alunos(nome_alunos, disciplinas_id) values ('Gabi', 1);
insert into alunos(nome_alunos, disciplinas_id) values ('Rian', null);
insert into alunos(nome_alunos, disciplinas_id) values ('Mia', 2);
insert into alunos(nome_alunos, disciplinas_id) values ('Malu', 1);


-- UTILIZAR OS COMANDO JOINS PARA REALIZAR CONSULTAS NA TABELAS --

-- Inner Join --
select nome_alunos, nome_disciplina from alunos inner join disciplinas on disciplinas.id_disciplinas = alunos.disciplinas_id;

-- Left Join --
select nome_alunos, nome_disciplina from alunos left join disciplinas on disciplinas.id_disciplinas = alunos.disciplinas_id;

-- Right Join --
select nome_alunos, nome_disciplina from alunos right join disciplinas on disciplinas.id_disciplinas = alunos.disciplinas_id;

-- Outer Join, Full Outer Join ou Full Join --
(SELECT nome_alunos, nome_disciplina FROM alunos LEFT JOIN disciplinas ON disciplinas.id_disciplinas = alunos.disciplinas_id)
UNION
(SELECT nome_alunos, nome_disciplina FROM alunos RIGHT JOIN disciplinas ON disciplinas.id_disciplinas = alunos.disciplinas_id);