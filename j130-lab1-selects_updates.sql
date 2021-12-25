select *
from ORDERS
--where reg_date between '2020-11-01' and '2020-11-30';
where year(REG_DATE) = 2020 and month(REG_DATE) = 12;

select *
from ORDERS
where SHIP_DATE between '2020-11-01' and '2020-11-30';
--where year(SHIP_DATE) = 2020 and month(SHIP_DATE) = 12;

select distinct CUSTOMER_FIO, PHONE, EMAIL
from ORDERS;

select *
from POSITIONS
where ORDER_ID = 3;

select PRODUCTS.ARTICLE, NAME, COLOR, POSITIONS.PRICE, QUANTITY,
        POSITIONS.PRICE * QUANTITY
from POSITIONS
    join PRODUCTS on POSITIONS.ARTICLE = PRODUCTS.ARTICLE
where ORDER_ID = 3;

select ORDERS.*, POS_STAT.POS_CNT
from ORDERS
    join (select ORDER_ID, count(*) as POS_CNT
            from POSITIONS
            group by ORDER_ID) as POS_STAT
        on ORDERS.ID = POS_STAT.ORDER_ID
where STATUS = 'S';

select ORDERS.*, POS_CNT, TOTAL
from ORDERS
    join (select ORDER_ID, count(*) as POS_CNT, sum(PRICE * QUANTITY) as TOTAL
            from POSITIONS
            group by ORDER_ID) as POS_STAT
        on ORDERS.ID = POS_STAT.ORDER_ID;

update ORDERS
set STATUS = 'S', SHIP_DATE = '2020-12-23'
where ID = 5;

update PRODUCTS
set BALANCE = BALANCE 
    - (select QUANTITY 
        from POSITIONS 
        where ORDER_ID = 5 and POSITIONS.ARTICLE = PRODUCTS.ARTICLE)
where ARTICLE in (select ARTICLE from POSITIONS where ORDER_ID = 5);


------------------------------------------------
update POSITIONS
set ARTICLE = '3251619'
where ORDER_ID = 5 and ARTICLE = '3251617';

select *
from ORDERS;

select *
from POSITIONS;

select *
from PRODUCTS;
