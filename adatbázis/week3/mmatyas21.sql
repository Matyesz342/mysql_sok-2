select *
from U_UXF1FP.cim;

--grant select -> hozzáférés adás 
--on U_UXF1FP.cim -> kitõl
--to public -> kinek
--with grant OPTION; ->milyen opcióval

--revoke select on table from who;

--INSERT INTO U_UXF1FP.halg (neptun, nev)
--VALUES ('FB4B8Z','Macháty_Mátyás');

update U_UXF1FP.halg
set nev = 'MACHÁTY_MÁTYÁS'
where neptun = 'FB4B8Z';

select *
from U_UXF1FP.halg;

create synonym au for szerelo.sz_auto;

select * from au;

-- Készítsünk fejlesztõ táblát 
-- azon integer primary key not null
-- nev varchar2(50) not null
-- szint varchar2(15)
-- szerep varchar2(50)
-- iroda_id integer

--készítsünk szekvenciát a fejlesztõknek, 1-tõl indulva 

--adjuk hozzá magunkat mint intern/junior fejlesztõ, használjuk a szekvenciát

create table mm_fejleszto(
azon integer primary key not null,
nev varchar2(50) not null,
szint varchar2(15),
szerep varchar2(50),
iroda_id integer
);

create SEQUENCE asd
start with 1
increment by 1;


insert into mm_fejleszto (azon,nev,szint,szerep,iroda_id)
values (asd.nextval,'Macháty Mátyás','junior','tanulo',asd.nextval);

create table mm_iroda(
id integer primary key,
varos varchar2(50),
cim varchar2(50)
);

INSERT INTO mm_iroda (id,varos,cim)
VALUES (asd.nextval,'Debrecen','Kossuth u. 32');
INSERT INTO mm_iroda (id,varos,cim)
VALUES (asd.nextval,'Budapest','Kossuth u. 32');
INSERT INTO mm_iroda (id,varos,cim)
VALUES (asd.nextval,'Békéscsaba','Kossuth u. 32');

alter table mm_iroda
add foreign key (id) REFERENCES mm_fejleszto(iroda);