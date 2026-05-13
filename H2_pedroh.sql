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
