-- Criar o banco de dados

CREATE DATABASE IF NOT EXISTS aula22;
USE aula22;

-- Usar o banco de dados



-- Criar a tabela 1--
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL
);


-- Criar o intert1--
INSERT INTO clientes (id_cliente, nome) VALUES
(1, 'Paulo'),
(2,'Maria'),
(3,'Pedro');

CREATE DATABASE IF NOT EXISTS prova26;
USE prova26;

CREATE TABLE tb_cursos(
    id_cursos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sigla VARCHAR(45) NOT NULL 
);

INSERT INTO tb_cursos(id_cursos,nome,sigla) 
VALUES
(1,'INFORMATICA','TI'),
(2,'ADMINISTRAÇÃO','ADM');

CREATE TABLE tb_alunos(
    id_alunos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    matricular VARCHAR(45) NOT NULL,
    id_cursos INT,

    FOREIGN KEY (id_cursos) 
    REFERENCES tb_cursos(id_cursos)
);

INSERT INTO tb_alunos(nome,cpf,matricular,id_cursos)
VALUES
('leonardo','999999','888888',1),
('anderson','77777','555555',2);
