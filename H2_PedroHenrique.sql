CREATE DATABASE IF NOT EXISTS H2_PedroHenrique;
USE H2_PedroHenrique;

CREATE TABLE tb_pessoas(
id_pessoas INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(14) NOT NULL,
data_nascimento DATE
);
INSERT INTO tb_pessoas (id_pessoas, nome, cpf, data_nascimento) VALUES
(1, 'João da Silva', '12345678900', '2010-05-05'),
(2, 'Maria da Silva', '78945612300', '2001-05-11'),
(3, 'Paulo Santos', '74185296300', '2004-05-14'),
(4, 'Carol Medeiros', '14785236978', '2000-07-10'),
(5, 'Roberta Maria', '96325874125', '2002-05-24'),
(6, 'Lucas Ferreira', '32165498710', '2005-03-15'),
(7, 'Ana Souza', '65498732101', '2004-09-22'),
(8, 'Gabriel Oliveira', '85274196325', '2003-11-08'),
(9, 'Fernanda Lima', '95175348620', '2002-06-30'),
(10, 'Ricardo Alves', '75315948620', '2001-01-18'),
(11, 'Patricia Gomes', '85296374120', '1985-05-12'),
(12, 'Carlos Henrique', '15935748620', '1980-10-25'),
(13, 'Juliana Costa', '45612378945', '1988-07-17'),
(14, 'Marcos Pereira', '78912345698', '1979-02-09'),
(15, 'Vanessa Rocha', '36925814785', '1987-12-01');

CREATE TABLE tb_alunos(
id_alunos INT AUTO_INCREMENT PRIMARY KEY,
matricula INT NOT NULL,
id_pessoas INT,
FOREIGN KEY (id_pessoas) REFERENCES tb_pessoas(id_pessoas)
);
INSERT INTO tb_alunos (id_alunos, matricula, id_pessoas) VALUES
(1, 102030, 1),
(2, 405060, 2),
(3, 206598, 3),
(4, 784596, 4),
(5, 965874, 5),
(6, 123456, 6),
(7, 234567, 7),
(8, 345678, 8),
(9, 456789, 9),
(10, 567890, 10);

CREATE TABLE tb_professores(
id_professores INT AUTO_INCREMENT PRIMARY KEY,
matricula INT NOT NULL,
id_pessoas INT,
FOREIGN KEY (id_pessoas) REFERENCES tb_pessoas(id_pessoas)
);
INSERT INTO tb_professores (id_professores, matricula, id_pessoas) VALUES
(1, 708090, 3),
(2, 963625, 4),
(3, 111111, 11),
(4, 222222, 12),
(5, 333333, 13),
(6, 444444, 14),
(7, 555555, 15);

CREATE TABLE tb_turnos(
id_turnos INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
horario_inicio TIME,
horario_fim TIME
);
INSERT INTO tb_turnos (id_turnos, nome, horario_inicio, horario_fim) VALUES
(1, 'Matutino', '08:00:00', '12:00:00'),
(2, 'Vespertino', '14:00:00', '18:00:00'),
(3, 'Noturno', '19:00:00', '23:00:00');

CREATE TABLE tb_cursos(
id_cursos INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
sigla VARCHAR(45) NOT NULL,
id_turnos INT,
FOREIGN KEY (id_turnos) REFERENCES tb_turnos(id_turnos)
);
INSERT INTO tb_cursos (id_cursos, nome, sigla, id_turnos) VALUES
(1, 'Técnico em Informática', 'TI', 3),
(2, 'Técnico em Administração', 'TA', 2),
(3, 'Técnico em Eletrônica', 'TE', 2);

CREATE TABLE tb_disciplinas(
id_disciplinas INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
sigla VARCHAR(45) NOT NULL,
id_cursos INT,
FOREIGN KEY (id_cursos) REFERENCES tb_cursos(id_cursos),
id_professores INT,
FOREIGN KEY (id_professores) REFERENCES tb_professores(id_professores)    
);
INSERT INTO tb_disciplinas (id_disciplinas, nome, sigla, id_cursos, id_professores) VALUES
(1, 'Operador de microcomputador', 'OP', 1, 1),
(2, 'Banco de dados I', 'BDI', 2, 1),
(3, 'Banco de dados II', 'BDII', 2, 1),
(4, 'Linguagem de Programação I', 'LPI', 2, 1),
(5, 'Linguagem de Programação II', 'LPII', 2, 1),
(6, 'Redes de Computadores', 'RC', 1, 3),
(7, 'Sistemas Operacionais', 'SO', 1, 4),
(8, 'Programação Web', 'PW', 1, 5),
(9, 'Matemática Aplicada', 'MA', 2, 6),
(10, 'Eletrônica Digital', 'ED', 3, 7);

CREATE TABLE tb_matriculas(
id_matriculas INT AUTO_INCREMENT PRIMARY KEY,
ano INT NOT NULL,
semestre INT NOT NULL,
id_alunos INT,
FOREIGN KEY (id_alunos) REFERENCES tb_alunos(id_alunos),
id_disciplinas INT,
FOREIGN KEY (id_disciplinas) REFERENCES tb_disciplinas(id_disciplinas)
);
INSERT INTO tb_matriculas (id_matriculas, ano, semestre, id_alunos, id_disciplinas) VALUES
(1, 2026, 1, 1, 1),
(2, 2026, 1, 2, 1),
(3, 2026, 1, 3, 2),
(4, 2026, 1, 4, 2),
(5, 2026, 1, 5, 3),
(6, 2026, 1, 6, 6),
(7, 2026, 1, 7, 7),
(8, 2026, 1, 8, 8),
(9, 2026, 1, 9, 9),
(10, 2026, 1, 10, 10);
CREATE TABLE tb_status(
id_status INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45) NOT NULL,
descricao VARCHAR(45) NOT NULL
);
INSERT INTO tb_status(id_status, nome, descricao) VALUES
(1, 'Aprovado', 'Aluno aprovado'),
(2, 'Reprovado', 'Aluno Reprovado');

CREATE TABLE tb_conselhos(
id_conselhos INT AUTO_INCREMENT PRIMARY KEY,
data DATE NOT NULL,
nota_final DECIMAL(8,2) NOT NULL,
id_matriculas INT,
FOREIGN KEY (id_matriculas) REFERENCES tb_matriculas(id_matriculas),
id_status INT,
FOREIGN KEY (id_status) REFERENCES tb_status(id_status)
);
INSERT INTO tb_conselhos(id_conselhos, data, nota_final, id_matriculas, id_status) VALUES
(1, '2026-07-10', 8.5, 1, 1),
(2, '2026-07-10', 9, 2, 1),
(3, '2026-07-10', 4, 3, 2),
(4, '2026-07-10', 5, 4, 1),
(5, '2026-07-10', 7, 5, 1),
(6, '2026-07-10', 8.0, 6, 1),
(7, '2026-07-10', 9.5, 7, 1),
(8, '2026-07-10', 6.0, 8, 1),
(9, '2026-07-10', 4.5, 9, 2),
(10, '2026-07-10', 7.5, 10, 1);


-- 1 - Crie uma consulta que retorne a matricula, o nome e cpf do aluno.

SELECT a.matricula, p.nome, p.cpf
FROM tb_alunos a
INNER JOIN tb_pessoas p
ON a.id_pessoas = p.id_pessoas;


-- 2 - Crie uma consulta que retorne os professores e suas respectivas disciplinas.


-- 3 - Crie uma consulta que retorne os os alunos aprovados e a nota_final de cada um.


-- 4 - Crie uma consulta dos alunos matriculados em 2026.
SELECT p.nome, a.matricula, m.ano
FROM tb_matriculas m
INNER JOIN tb_alunos a
ON m.id_alunos = a.id_alunos
INNER JOIN tb_pessoas p
ON a.id_pessoas = p.id_pessoas
WHERE m.ano = 2026;


-- 5 - Crie uma consulta que retorne as disciplinas e seus respectivos alunos.

SELECT d.nome AS disciplina, p.nome AS aluno
FROM tb_matriculas m
INNER JOIN tb_disciplinas d
ON m.id_disciplinas = d.id_disciplinas
INNER JOIN tb_alunos a
ON m.id_alunos = a.id_alunos
INNER JOIN tb_pessoas p
ON a.id_pessoas = p.id_pessoas;


-- 6 - Crie uma consulta que retorne a quantidade de alunos por disciplina.

SELECT d.nome AS disciplina, COUNT(m.id_alunos) AS quantidade_alunos
FROM tb_disciplinas d
INNER JOIN tb_matriculas m
ON d.id_disciplinas = m.id_disciplinas
GROUP BY d.nome;

-- 7 - Crie uma consulta que retorne a quantidade de alunos.


-- 8 - Crie uma consulta que retorne os professores e seus respectivos alunos e disciplinas.


-- 9 - Crie uma consulta que retorne somente os alunos reprovados.


-- 10 - Crie uma consulta que retorne os cursos e seus respectivos turnos.

SELECT c.nome AS curso,
       c.sigla,
       t.nome AS turno
FROM tb_cursos c
INNER JOIN tb_turnos t
ON c.id_turnos = t.id_turnos;