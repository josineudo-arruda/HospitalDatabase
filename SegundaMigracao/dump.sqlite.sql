-- TABLE
CREATE TABLE Consulta (
	id INTEGER PRIMARY KEY NOT NULL,
  	data_consulta DATE NOT NULL,
  	hora_consulta TIME NOT NULL, 
  	valor_consulta DOUBLE NOT NULL DEFAULT 0.00,
 	medico INT,
  	paciente INT,
  	convenio INT,
  	FOREIGN KEY (medico) REFERENCES Medico(cpf),
  	FOREIGN KEY (convenio) REFERENCES Convenio(id),
  	FOREIGN KEY (paciente) REFERENCES Paciente(cpf)
);
CREATE TABLE Convenio (
	id INTEGER PRIMARY KEY NOT NULL,
	nome Varchar(80) NOT NULL, 
	cpnj Varchar(14) NOT NULL,
	tempo_carencia INTEGER NOT NULL
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE Enfermeiro (
	cpf INTEGER PRIMARY KEY NOT NULL, 
  	nome Varchar(80) NOT NULL,
  	coren INTEGER NOT NULL
);
CREATE TABLE Especialidade (
	id SERIAL PRIMARY KEY,
	nome Varchar(80) NOT NULL
);
CREATE TABLE Internacao (
	id INTEGER PRIMARY KEY NOT NULL,
  	data_entrada DATE NOT NULL, 
  	data_prev_saida DATE NOT NULL,
  	descricao TEXT NOT NULL,
  	quarto INT, 
  	enfermeiro INT,
  	medico INT,
  	paciente INT,
  	FOREIGN KEY (quarto) REFERENCES QUARTO(id),
  	FOREIGN KEY (medico) REFERENCES Medico(cpf),
  	FOREIGN KEY (enfermeiro) REFERENCES Enfermeiro(cpf),
  	FOREIGN KEY (paciente) REFERENCES Paciente(cpf)
);
CREATE TABLE Medico (
	cpf INTEGER PRIMARY KEY NOT NULL,
  	nome Varchar(80) NOT NULL,
  	nivel INTEGER NOT NULL,
  	data_nascimento DATE NOT NULL,
  	email Varchar(80) NOT NULL,
  	especialidade INT,
  	FOREIGN KEY (especialidade) REFERENCES Especialidade(id)
);
CREATE TABLE Paciente(
	cpf INTEGER PRIMARY KEY NOT NULL,
	nome Varchar(80) Not NULL,
	rg Varchar(10) NOT NULL,
	data_nascimento DATE NOT NULL,
	email Varchar(80) NOT NULL,
	telefone Varchar(11) NOT NULL,
	endereco Varchar(100) NOT NULL, 
	convenio INT,
	FOREIGN KEY (convenio) REFERENCES Convenio(id)
);
CREATE TABLE Quarto (
	id INTEGER PRIMARY KEY NOT NULL,
  	numero INTEGER NOT NULL,
  	tipo INT,
  	FOREIGN KEY (tipo) REFERENCES TipoQuarto(id)
);
CREATE TABLE TipoQuarto (
	id SERIAL PRIMARY KEY NOT NULL,
  	tipo Varchar(80) NOT NULL,
  	descricao TEXT,
  	valor_diaria DOUBLE not NULL DEFAULT 0.00
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
