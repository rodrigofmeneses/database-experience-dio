select * from Cliente;
select * from Mecanico;
select * from Veiculo;
select * from Peca;
select * from Ordem_de_Servico;
select * from Equipe;

--
-- Quantos clientes a oficina tem?
select count(*) as 'Número de Clientes' from Cliente;

-- Quem são os mecânicos membros das equipes?
select idEquipe, Caracteristicas, Mnome, codigo
from Equipe inner join Mecanicos_Pertencentes_a_Equipe using(idEquipe)
	inner join Mecanico using(idMecanico);

-- Quais equipes fazem parte de cada ordem de serviço?
select Identificacao, Caracteristicas as Nome_do_time
from Ordem_de_Servico inner join Equipe using(idEquipe);

-- Quantas peças foram usadas em todas as ordens de serviço?
select sum(quantidade) as 'Total de Peças utilizadas'
from Ordem_de_Servico inner join Pecas_Utilizadas_na_OS using(idOrdem_de_Servico);

-- Qual o serviço mais prestado na oficina?

select Snome, count(*) as Qtd_Servicos
from Serviços_Prestrados_na_OS inner join Servico using(idServico)
group by idServico
order by Qtd_Servicos desc;