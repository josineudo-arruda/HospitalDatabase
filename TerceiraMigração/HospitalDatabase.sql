
DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE IF NOT EXISTS Hospital;
USE Hospital;

CREATE TABLE IF NOT EXISTS Convenio (
	id SERIAL PRIMARY KEY NOT NULL,
	nome Varchar(80) NOT NULL, 
	cnpj Varchar(14) NOT NULL,
	tempo_carencia INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Paciente (
	id Varchar(6) PRIMARY KEY NOT NULL, -- tipo de id público como: 240UE2
	cpf Varchar(11) NOT NULL,
	nome Varchar(80) NOT NULL,
	rg Varchar(10) NOT NULL,
	data_nascimento DATE NOT NULL,
	email Varchar(80) NOT NULL,
	telefone Varchar(11) NOT NULL,
	endereco Varchar(100) NOT NULL, 
	convenio BIGINT UNSIGNED,
	FOREIGN KEY (convenio) REFERENCES Convenio(id)
);

CREATE TABLE IF NOT EXISTS Especialidade (
	id SERIAL PRIMARY KEY,
	nome Varchar(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Medico (
	id Varchar(6) PRIMARY KEY NOT NULL,
	cpf Varchar(11) NOT NULL,
	nome Varchar(80) NOT NULL,
	nivel INTEGER NOT NULL,
	data_nascimento DATE NOT NULL,
	email Varchar(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Associacao_Medico_Especialidade (
	medico Varchar(6),
    especialidade BIGINT UNSIGNED,
    PRIMARY KEY (medico, especialidade), -- Força a unicidade de uma associação ser apenas se for o mesmo medico e especialidade id 
    FOREIGN KEY (especialidade) REFERENCES Especialidade(id),
    FOREIGN KEY (medico) REFERENCES Medico(id)
);

CREATE TABLE IF NOT EXISTS Consulta (
	id SERIAL PRIMARY KEY NOT NULL,
	data_consulta DATE NOT NULL,
	hora_consulta TIME NOT NULL, 
	valor_consulta DOUBLE NOT NULL DEFAULT 0.00,
	medico Varchar(6),
	paciente Varchar(6),
	convenio BIGINT UNSIGNED,
	FOREIGN KEY (medico) REFERENCES Medico(id),
	FOREIGN KEY (paciente) REFERENCES Paciente(id),
	FOREIGN KEY (convenio) REFERENCES Convenio(id)
);

CREATE TABLE IF NOT EXISTS Enfermeiro (
	id Varchar(6) PRIMARY KEY NOT NULL,
	cpf Varchar(11) NOT NULL,
	nome Varchar(80) NOT NULL,
	coren INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Tipo_Quarto (
	id SERIAL PRIMARY KEY NOT NULL,
	tipo Varchar(80) NOT NULL,
	descricao TEXT,
	valor_diaria DOUBLE NOT NULL DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS Quarto (
	id SERIAL PRIMARY KEY NOT NULL,
	numero INTEGER NOT NULL,
	tipo BIGINT UNSIGNED,
	FOREIGN KEY (tipo) REFERENCES Tipo_Quarto(id)
);

CREATE TABLE IF NOT EXISTS Internacao (
	id SERIAL PRIMARY KEY NOT NULL,
	data_entrada DATE NOT NULL,
	data_prev_saida DATE NOT NULL,
	descricao TEXT NOT NULL,
	quarto BIGINT UNSIGNED,
	enfermeiro Varchar(6),
	medico Varchar(6),
	paciente Varchar(6),
	FOREIGN KEY (quarto) REFERENCES Quarto(id),
	FOREIGN KEY (medico) REFERENCES Medico(id),
	FOREIGN KEY (paciente) REFERENCES Paciente(id)
);

CREATE TABLE IF NOT EXISTS Associacao_Internacao_Enfermeiro (
	enfermeiro Varchar(6),
    internacao BIGINT UNSIGNED,
    PRIMARY KEY (enfermeiro, internacao),
    FOREIGN KEY (enfermeiro) REFERENCES Enfermeiro(id),
    FOREIGN KEY (internacao) REFERENCES Internacao(id)
);

INSERT INTO Especialidade (nome) 
VALUES ('Pediatria'), 
('Clínica Geral'), 
('Dermatologia'), 
('Gastroenterologia'),
('Cardiologia'), 
('Ortopedia'), 
('Oftalmologia'), 
('Neurologia'), 
('Endocrinologia'), 
('Urologia'), 
('Ginecologia'), 
('Psiquiatria');

INSERT INTO Medico (id, cpf, nome, nivel, data_nascimento, email) 
VALUES ('438E21', '2345678972', 'Gabriel Augusto da Silva', 1, '2000-09-17', 'gabriel.augusto@gmail.com'),
('657483', '65748392011', 'Carol Fernandes', 2, '1999-08-12', 'carolfernandes@gmail.com'),
('839102', '83910264588', 'Agnes Portela', 1, '2010-02-16', 'agnesport@gmail.com'),
('555444', '55544433299', 'Lais América', 3, '2000-02-11', 'lais@gmail.com'),
('123456', '12345613299', 'Maria Eduarda', 1, '2000-02-14', 'maryedu@gmail.com'),
('678345', '67834519288', 'Emily Souza', 2, '2001-09-13', 'emily@gmail.com'),
('111555', '11155577771', 'Gael Silva', 1, '1998-02-12', 'gueybrels@gmail.com'),
('123444', '12344413299', 'Sofia Eduarda', 1, '2003-07-14', 'sophie@gmail.com'),
('678368', '67836819288', 'Lilia Souza', 2, '2009-09-13', 'lilidev@gmail.com'),
('111543', '11154377771', 'Devoi Silva', 1, '1999-02-12', 'devan@gmail.com');

INSERT INTO Associacao_Medico_Especialidade (medico, especialidade) 
VALUES ('438E21',1),
('438E21',2),
('438E21',3),
('657483',2),
('657483',3),
('839102',4),
('839102',5),
('111555',3),
('111555',1),
('111555',5);

INSERT INTO Convenio (nome, cnpj, tempo_carencia) 
VALUES ('Unimed Básico', '27384981273972', 365),
('Amil Saúde', '82736491827364', 180), 
('Bradesco Saúde', '91827364518273', 90), 
('SulAmérica Saúde', '19283746519283', 120), 
('Porto Seguro Saúde', '56473829183746', 240);

INSERT INTO Paciente (id, cpf, nome, rg, data_nascimento, email, telefone, endereco, convenio) 
VALUES ('438A92', '58293748311', 'Carlo Mattos', '834471962', '2000-08-18', 'carlos.mato@gmail.com', '11892342', 'Rua Taperoa 229', 1),
('3A4857', '39485726100', 'Ana Clara Silva', '123456789', '1995-05-12', 'ana.silva@gmail.com', '11987654321', 'Rua das Flores 100', 2),
('2857E6', '28574619300', 'Pedro Henrique Souza', '987654321', '1988-09-25', 'pedro.souza@gmail.com', '11987654322', 'Av. Brasil 200', 1),
('478392', '47839261500', 'Fernanda Oliveira', '123789456', '1992-03-10', 'fernanda.oliveira@gmail.com', '11987654323', 'Rua dos Lírios 300', 3),
('5E6837', '59683742100', 'Lucas Pereira', '456123789', '1990-07-22', 'lucas.pereira@gmail.com', '11987654324', 'Av. Paulista 400', 4),
('362R19', '36281954700', 'Beatriz Santos', '789456123', '1997-11-03', 'beatriz.santos@gmail.com', '11987654325', 'Rua do Sol 500', 5),
('284615', '28461539700', 'Rafael Costa', '321654987', '1985-01-15', 'rafael.costa@gmail.com', '11987654326', 'Rua da Lua 600', 1),
('485793', '48579326100', 'Mariana Lima', '654321987', '2001-06-07', 'mariana.lima@gmail.com', '11987654327', 'Rua das Palmeiras 700', 2),
('594P37', '59483726100', 'Gabriel Almeida', '987123654', '1994-02-20', 'gabriel.almeida@gmail.com', '11987654328', 'Rua dos Girassóis 800', 3),
('38Q91R', '38291746500', 'Camila Ferreira', '123987654', '1993-10-05', 'camila.ferreira@gmail.com', '11987654329', 'Av. Rio Branco 900', 4),
('29W736', '29573618400', 'Rodrigo Batista', '456789123', '1987-04-16', 'rodrigo.batista@gmail.com', '11987654330', 'Rua das Orquídeas 1000', 5),
('47Q397', '47839261501', 'Juliana Martins', '789123456', '2000-12-30', 'juliana.martins@gmail.com', '11987654331', 'Rua das Rosas 1100', 1),
('543W37', '59683742101', 'Felipe Cardoso', '321789654', '1998-08-21', 'felipe.cardoso@gmail.com', '11987654332', 'Av. Atlântica 1200', 2),
('362R49', '36281954701', 'Isabela Rocha', '654987321', '1991-03-14', 'isabela.rocha@gmail.com', '11987654333', 'Rua das Violetas 1300', 3),
('282C15', '28461539701', 'Thiago Nogueira', '987654123', '1999-11-19', 'thiago.nogueira@gmail.com', '11987654334', 'Av. Central 1400', 4);

INSERT INTO Consulta (data_consulta, hora_consulta, valor_consulta, medico, paciente, convenio)
VALUES ('2021-08-15', '12:00', 50.00, '438E21', '543W37', 1),
('2021-08-15', '14:00', 100.00, '438E21', '362R49', 1),
('2015-01-10', '09:00', 75.00, '438E21', '438A92', 1),
('2015-02-12', '10:30', 90.00, '657483', '3A4857', 2),
('2015-03-05', '11:00', 60.00, '839102', '2857E6', 1),
('2015-03-20', '13:30', 80.00, '555444', '478392', 3),
('2015-04-15', '15:00', 120.00, '123456', '5E6837', 4),
('2016-05-10', '08:30', 55.00, '678345', '362R19', 5),
('2016-06-12', '11:00', 95.00, '111555', '284615', 1),
('2016-07-21', '14:00', 70.00, '123444', '485793', 2),
('2017-01-05', '09:30', 110.00, '678368', '594P37', 3),
('2017-02-15', '10:00', 65.00, '111543', '38Q91R', 4),
('2018-03-30', '12:00', 85.00, '438E21', '29W736', 5),
('2018-04-25', '16:00', 100.00, '657483', '47Q397', 1),
('2019-01-18', '14:30', 50.00, '839102', '543W37', 2),
('2019-02-22', '13:00', 130.00, '555444', '362R49', 3),
('2020-03-14', '09:15', 45.00, '123456', '282C15', 4),
('2020-05-19', '11:45', 60.00, '678345', '438A92', 1),
('2021-06-11', '10:30', 120.00, '111555', '3A4857', 2),
('2021-07-15', '15:00', 55.00, '123444', '5E6837', 3),
('2021-08-22', '12:30', 100.00, '678368', '362R19', 4);

INSERT INTO Enfermeiro (id, cpf, nome, coren) 
VALUES ('68E790','76528909911','Lessandro Souza da Silva', 2382),
('829I02','26372199812','Andressa Fora Sun', 1212),
('928YT1','19809218288','Lais Ameida', 1111),
('789K01','76543219876','Mariana Gomes', 2383),
('456B78','32165498712','Felipe Martins', 1213),
('963Q85','78945612345','Julia Ribeiro', 1112),
('357D36','65432198745','Ana Clara', 1214),
('159J29','98765432109','Ricardo Almeida', 2384),
('753F84','14725836901','Sofia Lima', 1113),
('258G57','36925814700','Gustavo Ferreira', 1215);

INSERT INTO Tipo_Quarto (tipo, descricao, valor_diaria)
VALUES ('Apartamento','Formato de internação que cabe ao paciente de uma maneira confortável uma suíte com banheiro, televisão e cama king stars', 50.00),
('Quarto Duplo', 'Formato de internação que conta com no minímo um paciente, podendo acompanhar no máximo até 2.', 25.00),
('Enfermaria', 'Formato de internação que cabe no máximo 20 pacientes na mesma sala.', 20.00);

INSERT INTO Quarto (numero, tipo)
VALUES (101, 1),
(102, 1),
(201, 2),
(202, 2),
(203, 2),
(204, 2),
(301, 3);

INSERT INTO Internacao (data_entrada, data_prev_saida, descricao, quarto, medico, paciente)
VALUES ('2023-09-20', '2023-12-25','Cirurgia para retirar retina.', 1,'555444','2857E6'),
('2022-09-10', '2023-04-20', 'Biópsia para retirar tumor beligno.', 2, '123456','284615'),
('2023-10-01', '2023-12-15', 'Tratamento para pneumonia.', 3, '678345', '3A4857'),
('2022-08-15', '2022-09-30', 'Cirurgia de apendicite.', 4, '111555', '362R19'),
('2023-11-01', '2023-12-10', 'Tratamento para diabetes.', 2, '657483', '5E6837'),
('2022-01-20', '2022-02-25', 'Cirurgia de ortopedia.', 1, '438E21', '594P37'),
('2022-02-10', '2022-03-15', 'Internação para desidratação.', 3, '555444', '38Q91R'),
('2022-03-05', '2022-04-10', 'Avaliação cardíaca.', 2, '678345', '47Q397'),
('2022-04-01', '2022-05-05', 'Recuperação pós-cirúrgica.', 4, '839102', '362R49');

SELECT * FROM Paciente;
SELECT * FROM Associacao_Medico_Especialidade;



