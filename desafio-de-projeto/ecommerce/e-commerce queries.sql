-- Sugestões de perguntas:
 -- Quantos pedidos foram feitos por cada cliente?
 -- Algum vendedor também é fornecedor?
 -- Relação de produtos fornecedores e estoques.
 -- Relação de nomes dos fornecedores e nomes dos produtos.
 
-- Inicialmente, vamos explorar as tabelas:
-- Essas são as entidades básicas: vendedores, produtos e clientes

select * from client;
select * from product;
select * from supplier;
select * from seller;
select * from client;

-- Vamos explorar incialmente os clientes
 -- Quantos são os clientes?
select count(*) as Number_of_Clients from client;

 -- Quem são eles?
select * from client;

 -- Quais os nomes e atributos que os identificam?

  -- Quais clientes são pessoas físicas?
select Cname, contact, cpf from client inner join natural_person using(idClient);

  -- Quais são pessoa jurídica?
select Cname, contact, cnpj from client inner join legal_person using(idClient);

  -- Quero todos em uma só tabela com suas respectivas identificações
select Cname, cpf, cnpj 
from client left join natural_person using(idClient)
		   left join legal_person using(idClient);
  
  -- Por ultimo, quantos são de cada grupo?
select count(cpf) as Natural_Person_Clients, count(cnpj) as Legal_Person_Clients 
from client left join natural_person using(idClient)
		   left join legal_person using(idClient);
           
 -- Qual os tipos de pagamentos de cada cliente?
select Cname, info 
from client inner join client_payment using(idClient)
    inner join payment using(idPayment)
order by Cname;
 
 -- Quantas formas de pagamento cada cliente tem?
select Cname, count(*) as Qtd_kind_payment from client inner join client_payment using (idClient) group by idClient;

-- Agora vamos aos pedidos
select * from orders;

-- Quantos pedidos foram feito?
select count(*) as Number_of_Orders from orders;

 -- Quantos pedidos cada cliente fez?
select Cname, count(*) as Number_of_Orders 
from orders inner join client using(idClient) 
group by idClient
order by Number_of_Orders desc;

 -- Qual é o produto mais vendido? Quanto arrecadou em cada?
select Pname, sum(quantity) as Total_Sold, sum(quantity) * price as Profit
from orders_product inner join product using(idProduct)
group by idProduct
order by Total_Sold desc;

-- Agora sobre os fornecedores.
-- Quais produtos cada fornecedor trabalha?
-- 
select distinct FantasyName, Pname
from product_supplier inner join supplier using(idSupplier)
	inner join product using(idProduct);

-- E cada vendedor terceiro?

select distinct FantasyName, Pname
from product_supplier inner join seller using(idSeller)
	inner join product using(idProduct);

-- Quanto de cada produto tem em estoque?
desc product_storage;

select Pname, sum(quantity) as Quantity_in_stock
from product inner join product_storage using(idProduct)
	inner join storage using(idStorage)
group by idProduct;









