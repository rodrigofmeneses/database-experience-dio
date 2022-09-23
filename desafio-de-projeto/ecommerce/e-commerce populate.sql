use ecommerce;

-- Populate Tables
-- Not dependence of FK

insert into client (Cname, adress, contact) values 
	('Rodrigo', 'Rua 1', '85315486573'),
    ('Marta', 'Rua 4', '68461651845'),
    ('Claudia', 'Rua 2', '85381123344'),
    ('Afonso', 'Rua 3RW', '85311475573'),
    ('Luiz', 'Rua 1', '8531519685'),
    ('Fabrício', 'Rua 123', '8998763553'),
    ('Judite', 'Rua D', '85315481111'),
    ('Carlos', 'Rua 1AA', '85888566573');

--

insert into payment (kind, info) values
	('Dinheiro', 'Dinheiro em espécie'),
    ('Cartão', 'Cartão de crédito'),
    ('Boleto', 'Boleto Bancário');
    
--

insert into product (Pname, classification_kids, category, description, price) values
	('Boneco', 1, 'Brinquedo', 'Boneco de super heroi', 50),
    ('Casinha', 1, 'Brinquedo', 'Casinha para enfeitar', 150),
    ('Roupa infantil', 1, 'Vestimenta', 'Vários animais brincando', 40),
    ('Blusa', 0, 'Vestimenta', 'GG - Verde', 30),
    ('Calça', 0, 'Vestimenta', 'PP - Laranja', 80),
    ('Feijão', 0 , 'Alimento', '1kg', 10),
    ('Arroz', 0 , 'Alimento', '1kg', 5);

--

insert into supplier (fantasyName, adress, contact, cnpj) values 
	('Distribuidora das variedade', 'Rua das flores - Ceará', '87651645798', '147856987532654'),
	('Distribuidora de alimentos', 'Rua das abacates - Pernambuco', '87651654794', '147412546532654'),
    ('Distribuidora tem de tudo', 'Rua dos números - São Paulo', '87665498512', '147856987514753');

--

insert into storage (location) values
	('Rua das bananeiras - Amazonas'),
    ('Avenida do comércio - Piaui');

--

insert into seller (fantasyName, adress, contact) values
	('Vendedor Mascarado', 'Rua dos limões - Espirito Santo', '12332114789'),
    ('Super Varejo', 'Rua das avenidas - Rio de Janeiro', '12361615782'),
    ('Jorge Vendedor', 'Rua das colinas - Goiais', '12548614785'),
    ('Geladão Varegista', 'Rua da neve - Rio Grande do Sul', '12339497784');
    
-- select * from client, payment, product, supplier, storage, seller;


-- Relações

insert into natural_person (idClient, idSeller, cpf) values 
	(1, default, '74415965760'),
    (2, default, '12484845698'),
    (3, default, '33737649198'),
    (4, default, '12345424242'),
    (5, default, '12342222221'),
    (6, default, '32312515611'),
    (default, 1, '51515132324'),
    (default, 3, '77365675345');

--

insert into legal_person (idClient, idSeller, cnpj) values 
    (7, default, '123461623611423'),
    (8, default, '367838289932128'),
    (default, 2, '131232345115625'),
    (default, 4, '525551514545218');

--

insert into product_storage (idProduct, idStorage, quantity) values 
	(1, 1, 20),
    (1, 2, 50),
    (2, 1, 10),
    (3, 2, 110),
    (3, 1, 2),
    (4, 1, 22),
    (5, 2, 33),
    (6, 1, 61),
    (7, 2, 3),
    (7, 1, 41);
    
--

select * from supplier, seller;

desc product_supplier;
insert into product_supplier (idProduct, idSupplier, idSeller, quantity, supplyDate) values 
	(1, 1, default,  20, '2022-05-07'),
    (1, 1, default, 14, '2022-06-06'),
    (1, 2, default, 32,'2022-08-08'),
    (1, 3, default, 511, '2022-09-09'),
	(1, default, 1, 14, '2022-08-08'),
    (1, default, 2, 111, '2022-09-09'),
	(1, default, 3, 30, '2022-08-08'),
    (1, default, 4, 12, '2022-09-09');
    
--

insert into client_payment (idClient, idPayment, personalDataOfPayment) values
	(1, 1, null),
    (1, 2, null),
    (2, 1, null),
    (3, 2, null),
    (4, 2, null),
    (5, 3, null),
    (6, 3, null),
    (7, 1, null);

--

insert into orders
(idClient, idPayment, dateOfOrder, status,  observations, deliveryAdress, deliveryStatus, deliveryCode) values
(1, 1, '2022-08-12', default, null, 'Rua da Joaninha', default, '2315123'),
(1, 2, '2022-08-12', default, null, 'Rua da Caronchinha', default, '24444123'),
(3, 2, '2022-08-12', default, null, 'Rua do Jacaré', default, 'sad1as651'),
(4, 2, '2022-08-12', default, null, 'Rua 42312', default, '231443'),
(5, 3, '2022-08-12', default, null, 'Rua 123', default, '41244'),
(2, 1, '2022-08-12', default, null, 'Rua de colher', default, 'asdq1231'),
(7, 1, '2022-08-12', default, null, 'Rua 111', default, '41532'),
(6, 3, '2022-08-12', default, null, 'Rua 3131', default, '44s4s4'),
(6, 3, '2022-08-12', default, null, 'Rua da Clara', default, '5226'),
(7, 1, '2022-08-12', default, null, 'Rua de Marrocos', default, '64512'),
(5, 3, '2022-08-12', default, null, 'Rua da Joaninha', default, '646462');

--

insert into orders_product (idOrder, idProduct, quantity) values
	(1, 1, 2),
    (1, 5, 3),
    (2, 4, default),
    (2, 2, default),
    (2, 1, default),
    (3, 1, 2),
    (3, 7, default),
    (4, 6, default),
    (4, 4, default),
    (4, 1, 3),
    (5, 2, default),
    (6, 2, 3),
    (7, 3, default),
    (7, 1, 2),
    (8, 1, default),
	(8, 5, default),
    (9, 6, default),
    (10, 1, default),
    (11, 1, 4),
    (11, 2, default),
    (11, 3, default),
    (11, 4, 10),
    (11, 6, default);
    