create table AUTHORS (
    ID int primary key,
    CUSTOMER_FIO varchar(64) not null,
    OTHER varchar(255)
);

insert into AUTHORS (ID,CUSTOMER_FIO) values (1, 'Arnold Grey');
insert into AUTHORS values (2, 'Tom Hawkins', 'new author');
insert into AUTHORS (ID, CUSTOMER_FIO) values (3, 'Jim Beam');

-- End first table

create table DOCUMENTS (
    ID int primary key,
    DOC_NAME varchar(64) not null,
    TEXT varchar(1024),
    CREATE_DATE date not null default '1980-01-01',
    AUTHOR_ID int not null,
    foreign key (AUTHOR_ID) references AUTHORS (ID)
);

insert into DOCUMENTS (ID, DOC_NAME, TEXT, AUTHOR_ID)
    values (1, 'Project plan', 'First content', 1);
insert into DOCUMENTS (ID, DOC_NAME, TEXT, AUTHOR_ID)
    values (2, 'First report', 'Second content', 2);
insert into DOCUMENTS (ID, DOC_NAME, TEXT, AUTHOR_ID)
    values (3, 'Test result', 'Third content', 2);
insert into DOCUMENTS (ID, DOC_NAME, TEXT, AUTHOR_ID)
    values (4, 'Second report', 'Report content', 3);

-- End second table

