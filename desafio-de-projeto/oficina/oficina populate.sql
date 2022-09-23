insert into Cliente (Cnome) values 
	('Rodrigo'),
    ('Marta'),
    ('Claudia'),
    ('Afonso');
    
insert into Veiculo (idCliente, Caracteristicas) values 
	(1, null),
    (2, null),
    (3, null),
    (4, null);
    
insert into Servico (Snome, Valor) values 
	('Lavar', 100),
    ('Pintar', 300),
    ('Consertar Motos', 800);
    
insert into Mecanico (Codigo, Mnome, Endereco, Especialidade) values
	('132131', 'Claudio', 'Rua 01', 'Consertar'),
    ('1321154131', 'Pedro', 'Rua 22', 'Consertar'),
    ('132131', 'Romario', 'Rua 4142', 'Pintas'),
    ('13213221', 'Claudio', 'Rua 01', 'Consertar'),
    ('132144431', 'Pedro', 'Rua 22', 'Consertar'),
    ('131232131', 'Romario', 'Rua 4142', 'Limpar'),
    ('136162131', 'Claudio', 'Rua 01', 'Consertar'),
    ('13214131', 'Pedro', 'Rua 22', 'Consertar'),
    ('132112341331', 'Romario', 'Rua 4142', 'Pintar');

insert into Equipe (Caracteristicas) values 
	('Veloz'),
    ('Eficiente'),
    ('Brava');


insert into Ordem_de_Servico (idEquipe, idVeiculo, Identificacao, Status, Valor_Total, Data_de_Emissao, Data_de_Conclusao) values
	(1, 1, '31231231', default, 1000, '2022-08-08', '2022-08-09'),
    (1, 2, '3111131', default, 5000, '2022-09-09', '2022-10-10'),
    (2, 3, '31231222', default, 2000, '2022-08-08', '2022-11-11'),
    (3, 3, '315151', default, 100, '2022-08-08', '2022-12-12');

insert into Peca (PNome, Preco) values
	('Pneu', '500'),
    ('Motos', '10000'),
    ('Espelho', '200'),
    ('Porta', '100');


insert into Serviços_Prestrados_na_OS (idOrdem_de_Servico, idServico, Observacoes) values
	(1, 1, null),
    (1, 2, null),
    (2, 1, null),
    (3, 2, null),
    (4, 1, null);

insert into Pecas_Utilizadas_na_OS (idOrdem_de_Servico, idPeca, quantidade, Observacoes) values
	(1, 1, 4, null),
    (1, 2, 3, null),
    (2, 1, 10, null),
    (2, 2, 20, null),
    (3, 1, 4, null),
    (4, 1, 3, null);

insert into Mecanicos_Pertencentes_a_Equipe (idEquipe, idMecanico) values
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (3, 9);














