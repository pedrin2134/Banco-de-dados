CREATE DATABASE IF NOT EXISTS prova_PedroHenrique;
USE prova_PedroHenrique;

CREATE TABLE tb_pessoas(
    id_pessoas INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf INT NOT NULL,
    data_nascimento DATE NOT NULL 
);

INSERT INTO tb_pessoas(id_pessoas, nome, cpf, data_nascimento) 
VALUES
(1,'Pedro',1111, '1995-10-25'),
(2,'Julio',2222222, '2000-05-03'),
(3,'Rafael',5555555, '1998-07-09');

CREATE TABLE tb_alunos(
    id_alunos INT AUTO_INCREMENT PRIMARY KEY,
    matricula INT NOT NULL,
    id_pessoas INT,

    FOREIGN KEY (id_pessoas) 
    REFERENCES tb_pessoas(id_pessoas)
);

INSERT INTO tb_alunos(matricula,id_pessoas)
VALUES
('888888',1),
('555555',2);

CREATE TABLE tb_professores(
	id_professores INT AUTO_INCREMENT PRIMARY KEY,
	matricula INT NOT NULL,
	id_pessoas INT,
	
	FOREIGN KEY (id_pessoas) 
    REFERENCES tb_pessoas(id_pessoas)
);

INSERT INTO tb_professores(matricula,id_pessoas)
VALUES
('999233',1);

CREATE TABLE tb_turnos(
	id_turnos INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	horario_inicio TIME,
	horario_fim VARCHAR(45)
);

INSERT INTO tb_turnos(id_turnos, nome, horario_inicio, horario_fim)
VALUES
(1,'matutino', '08:00', '12:00'),
(2,'vespertino', '13:00:00', '17:00:00'),
(3,'noturno', '18:00:00', '22:00:00');

CREATE TABLE tb_cursos(
	id_cursos INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	sigla VARCHAR(45) NOT NULL,
	id_turnos INT,
    
    FOREIGN KEY (id_turnos) 
    REFERENCES tb_turnos(id_turnos)
);

INSERT INTO tb_cursos(id_cursos, nome, sigla, id_turnos)
VALUES
(1,'Técnico em Informática', 'TI', 2),
(2,'Técnico em Administração', 'TA', 1);

CREATE TABLE tb_disciplinas(
	id_disciplinas INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	sigla VARCHAR(45) NOT NULL,
	id_cursos INT,
    id_professores INT,
    
    FOREIGN KEY (id_cursos) 
    REFERENCES tb_cursos(id_cursos),
    
    FOREIGN KEY (id_professores) 
    REFERENCES tb_professores(id_professores)
);

CREATE TABLE tb_matriculas(
	id_matriculas INT AUTO_INCREMENT PRIMARY KEY,
	ano INT NOT NULL,
	semestre INT NOT NULL,
	id_alunos INT,
    id_disciplinas INT,
    
    FOREIGN KEY (id_alunos) 
    REFERENCES tb_alunos(id_alunos),
    
    FOREIGN KEY (id_disciplinas) 
    REFERENCES tb_disciplinas(id_disciplinas)
);

CREATE TABLE tb_status(
	id_status INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	descricao VARCHAR(45)
);

CREATE TABLE tb_conselhos(
	id_conselhos INT AUTO_INCREMENT PRIMARY KEY,
	data DATE NOT NULL,
	nota_final DECIMAL(8,2) NOT NULL,
	id_matriculas INT,
    id_status INT,
    
    FOREIGN KEY (id_matriculas) 
    REFERENCES tb_matriculas(id_matriculas),
    
    FOREIGN KEY (id_status) 
    REFERENCES tb_status(id_status)
);


