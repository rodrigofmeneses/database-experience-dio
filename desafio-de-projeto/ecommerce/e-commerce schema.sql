-- Create DB

drop database if exists ecommerce;
create database ecommerce;
use ecommerce;

-- Create Tables
-- Client
create table client(
	idClient int auto_increment primary key,
    Cname varchar(40) not null,
    adress varchar(50) not null,
    contact char(11) not null
);

-- Payment

create table payment (
	idPayment int auto_increment primary key,
    kind varchar(50),
    info varchar(100)
);

-- Product

create table product (
	idProduct int auto_increment primary key,
    Pname varchar(40) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimento', 'Mobilia') not null,
    description varchar(100),
    price float
);

-- Storage

create table storage (
	idStorage int auto_increment primary key,
    location varchar(50)
);

-- Supplier

create table supplier (
	idSupplier int auto_increment primary key,
    fantasyName varchar(50) not null,
    adress varchar(100) not null,
    contact char(11) not null,
    cnpj char(15) not null,
    
    constraint unique_cnpj_supplier unique (cnpj)
);

-- Seller

create table seller (
	idSeller int auto_increment primary key,
	fantasyName varchar(50) not null,
    adress varchar(100) not null,
    contact char(11) not null
);

-- Relations

-- Natural and Legal person!

create table natural_person (
    idClient int default null,
    idSeller int default null,
    cpf char(11) not null,
    
    constraint unique_cpf unique (cpf),
    constraint fk_client_natural_person foreign key (idCLient) references client (idClient),
    constraint fk_seller_natural_person foreign key (idSeller) references seller (idSeller)
);

create table legal_person (
    idClient int default null,
    idSeller int default null,
    cnpj char(15) not null,
    
    -- Constraints
    constraint unique_cnpj unique (cnpj),
    constraint fk_client_legal_person foreign key (idCLient) references client (idClient),
    constraint fk_seller_legal_person foreign key (idSeller) references seller (idSeller)
);

-- Relation Payment

create table client_payment (
	idClient int,
    idPayment int,
    personalDataOfPayment varchar(50),
    
    -- Constraints
    constraint pk_client_payment primary key (idClient, idPayment),
    constraint fk_client_client foreign key (idClient) references client (idClient),
    constraint fk_client_payment foreign key (idPayment) references payment (idPayment)
);

-- Relation Order

create table orders (
	idOrder int auto_increment primary key,
    idClient int,
    idPayment int,
    dateOfOrder date,
	status enum('Em análise', 'Processando', 'Finalizado') default 'Em análise',
    observations varchar(100),
    -- Referents to delivery
    deliveryAdress varchar(100),
    deliveryStatus enum('Em análise', 'Enviado', 'Entregue') default 'Em análise',
    deliveryCode varchar(10),
    
    -- Constraints
    constraint fk_order_client foreign key (idClient) references client (idClient),
    constraint fk_order_payment foreign key (idClient, idPayment) references client_payment (idClient, idPayment)
);

create table orders_product (
	idOrder int,
    idProduct int,
    quantity int default 1,
    
    -- Constraints
    
    constraint pk_orders_product primary key (idOrder, idProduct),
    constraint fk_orders_order foreign key (idOrder) references orders (idOrder),
    constraint fk_orders_product foreign key (idProduct) references product (idProduct)
);


-- Storage

create table product_storage (
    idProduct int,
    idStorage int,
    quantity int default 0,
    
    -- Constraints
    
    constraint pk_product_storage primary key (idProduct, idStorage),
    constraint fk_product_product foreign key (idProduct) references product (idProduct),
    constraint fk_product_storage foreign key (idStorage) references storage (idStorage)
);

-- Supplier

create table product_supplier (
	idProductSupplier int primary key auto_increment,
    idProduct int default null,
    idSupplier int default null,
    idSeller int,
    quantity int default 1,
    supplyDate date,
    
    -- Constraints
    constraint fk_product_product_supplier foreign key (idProduct) references product (idProduct),
    constraint fk_product_supplier foreign key (idSupplier) references supplier (idSupplier),
    constraint fk_product_seller foreign key (idSeller) references seller (idSeller)
);

show tables;






