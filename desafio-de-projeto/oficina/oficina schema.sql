DROP DATABASE OFICINA;
CREATE SCHEMA IF NOT EXISTS oficina;
USE oficina ;

CREATE TABLE Cliente (
	idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Cnome VARCHAR(45) NULL
  );


CREATE TABLE Veiculo (
	idVeiculo INT AUTO_INCREMENT,
	idCliente INT,
	Caracteristicas VARCHAR(45),
    
	PRIMARY KEY (idVeiculo , idCliente),
	CONSTRAINT fk_Veiculo_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
);


CREATE TABLE Servico (
	idServico INT PRIMARY KEY AUTO_INCREMENT,
	Snome VARCHAR(45) NOT NULL,
	Valor FLOAT NOT NULL
);


CREATE TABLE Mecanico (
	idMecanico INT PRIMARY KEY AUTO_INCREMENT,
	Codigo VARCHAR(45) NOT NULL,
	Mnome VARCHAR(45) NOT NULL,
	Endereco VARCHAR(45) NOT NULL,
	Especialidade VARCHAR(45) NOT NULL
);


CREATE TABLE Equipe (
	idEquipe INT PRIMARY KEY AUTO_INCREMENT,
	Caracteristicas VARCHAR(45) NULL
);



CREATE TABLE Ordem_de_Servico (
	idOrdem_de_Servico INT AUTO_INCREMENT,
	idEquipe INT,
	idVeiculo INT,

	Identificacao VARCHAR(45),
	Status ENUM('Em Andamento', 'Finalizada') NOT NULL default 'Em Andamento',
	Valor_Total FLOAT,
	Data_de_Emissao DATE,
	Data_de_Conclusao DATE,
	
    PRIMARY KEY (idOrdem_de_Servico, idEquipe, idVeiculo),
	CONSTRAINT fk_Ordem_de_Servico_Equipe FOREIGN KEY (idEquipe) REFERENCES Equipe (idEquipe),
	CONSTRAINT fk_Ordem_de_Servico_VeIculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo (idVeiculo)
);


CREATE TABLE Peca (
	  idPeca INT PRIMARY KEY AUTO_INCREMENT,
	  PNome VARCHAR(45) NOT NULL,
	  Preco FLOAT NOT NULL
  );



CREATE TABLE Serviços_Prestrados_na_OS (
	idServicosPrestados INT PRIMARY KEY AUTO_INCREMENT,
	idOrdem_de_Servico INT,
	idServico INT,
	Observacoes VARCHAR(45),

	CONSTRAINT fk_Ordem_de_Serviço_has_Serviço_Ordem_de_Serviço1 FOREIGN KEY (idOrdem_de_Servico) REFERENCES Ordem_de_Servico (idOrdem_de_Servico),
	CONSTRAINT fk_Ordem_de_Serviço_has_Serviço_Serviço1 FOREIGN KEY (idServico) REFERENCES Servico (idServico)
);


CREATE TABLE Pecas_Utilizadas_na_OS (
	idOrdem_de_Servico INT,
	idPeca INT,
    quantidade INT DEFAULT 1,
	Observacoes VARCHAR(45),
	PRIMARY KEY (idOrdem_de_Servico, idPeca),
	CONSTRAINT `fk_Ordem de Serviço_has_Peça_Ordem de Serviço1` FOREIGN KEY (idOrdem_de_Servico) REFERENCES Ordem_de_Servico (idOrdem_de_Servico),
	CONSTRAINT `fk_Ordem de Serviço_has_Peça_Peça1` FOREIGN KEY (idPeca) REFERENCES Peca (idPeca)
);


CREATE TABLE Mecanicos_Pertencentes_a_Equipe (
	idEquipe INT,
	idMecanico INT,
	PRIMARY KEY (idEquipe, idMecanico),
	CONSTRAINT `fk_Equipe_has_Mecânico_Equipe1` FOREIGN KEY (idEquipe) REFERENCES Equipe (idEquipe),
	CONSTRAINT `fk_Equipe_has_Mecânico_Mecânico1` FOREIGN KEY (idMecanico) REFERENCES Mecanico (idMecanico)
);
  
  
  
  
  
  
  
  
  