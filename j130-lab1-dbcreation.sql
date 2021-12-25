create table PRODUCTS (
    ARTICLE char(7) primary key,
    NAME varchar(50) not null,
    COLOR varchar(20),
    PRICE int not null,
    BALANCE int not null,
    check (PRICE > 0),
    check (BALANCE >= 0)
);

create table ORDERS (
    ID int primary key,
    REG_DATE date not null,
    CUSTOMER_FIO varchar(100) not null,
    PHONE varchar(50),
    EMAIL varchar(50),
    DELIVERY_ADDRESS varchar(200) not null,
    STATUS char(1) not null,
    SHIP_DATE date,
    --check (STATUS = 'P' or STATUS = 'S' or STATUS = 'C'),
    check (STATUS in ('P', 'S', 'C')),
    --check (STATUS like '[PSC]')
    check (STATUS in ('P', 'C') and SHIP_DATE is null
        or STATUS = 'S' and SHIP_DATE is not null)
);

create table POSITIONS (
    ORDER_ID int not null,
    ARTICLE char(7) not null,
    PRICE int not null,
    QUANTITY int not null,
    primary key (ORDER_ID, ARTICLE),
    foreign key (ORDER_ID) references ORDERS (ID),
    foreign key (ARTICLE) references PRODUCTS (ARTICLE),
    check (PRICE > 0),
    check (QUANTITY > 0)
);

insert into PRODUCTS values ('3251615', 'Стол кухонный', 'белый', 8000, 12);
insert into PRODUCTS values ('3251616', 'Стол кухонный', null, 8000, 15);
insert into PRODUCTS
    values ('3251617', 'Стул столовый "гусарский"', 'орех', 4000, 0),
        ('3251619', 'Стул столовый с высокой спинкой', 'белый', 3500, 37),
        ('3251620', 'Стул столовый с высокой спинкой', 'коричневый', 3500, 52);

insert into ORDERS (ID, REG_DATE, CUSTOMER_FIO, PHONE, DELIVERY_ADDRESS, STATUS, SHIP_DATE)
    values (1, '20.11.2020', 'Сергей Иванов', '(981)123-45-67', 'ул. Веденеева, 20-1-41', 'S', '29.11.2020');
insert into POSITIONS values (1, '3251616', 7500, 1);

insert into ORDERS (ID, REG_DATE, CUSTOMER_FIO, PHONE, DELIVERY_ADDRESS, STATUS, SHIP_DATE)
    values (2, '22.11.2020', 'Алексей Комаров', '(921)001-22-33', 'пр. Пархоменко 51-2-123', 'S', '29.11.2020');
insert into POSITIONS values (2, '3251615', 7500, 1);

insert into ORDERS (ID, REG_DATE, CUSTOMER_FIO, PHONE, DELIVERY_ADDRESS, STATUS)
    values (3, '28.11.2020', 'Ирина Викторова', '(911)009-88-77', 'Тихорецкий пр. 21-21', 'P');
insert into POSITIONS
    values (3, '3251615', 8000, 1),
        (3, '3251617', 4000, 4);

insert into ORDERS (ID, REG_DATE, CUSTOMER_FIO, EMAIL, DELIVERY_ADDRESS, STATUS)
    values (4, '03.12.2020', 'Павел Николаев', 'pasha_nick@mail.ru', 'ул. Хлопина 3-88', 'P');
insert into POSITIONS values (4, '3251619', 3500, 2);

insert into ORDERS (ID, REG_DATE, CUSTOMER_FIO, PHONE, EMAIL, DELIVERY_ADDRESS, STATUS)
    values (5, '03.12.2020', 'Антонина Васильева', '(931)777-66-55', 'antvas66@gmail.com', 'пр. Науки, 11-3-9', 'P'),
        (6, '10.12.2020', 'Ирина Викторова', '(911)009-88-77', null, 'Тихорецкий пр. 21-21', 'P');
insert into POSITIONS
    values (5, '3251615', 8000, 1),
        (5, '3251617', 4000, 4),
        (6, '3251617', 4000, 2);
