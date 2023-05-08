select *
from U_UXF1FP.cim;

--grant select -> hozz�f�r�s ad�s 
--on U_UXF1FP.cim -> kit�l
--to public -> kinek
--with grant OPTION; ->milyen opci�val

--revoke select on table from who;

--INSERT INTO U_UXF1FP.halg (neptun, nev)
--VALUES ('FB4B8Z','Mach�ty_M�ty�s');

update U_UXF1FP.halg
set nev = 'MACH�TY_M�TY�S'
where neptun = 'FB4B8Z';

select *
from U_UXF1FP.halg;

create synonym au for szerelo.sz_auto;

select * from au;

-- K�sz�ts�nk fejleszt� t�bl�t 
-- azon integer primary key not null
-- nev varchar2(50) not null
-- szint varchar2(15)
-- szerep varchar2(50)
-- iroda_id integer

--k�sz�ts�nk szekvenci�t a fejleszt�knek, 1-t�l indulva 

--adjuk hozz� magunkat mint intern/junior fejleszt�, haszn�ljuk a szekvenci�t

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
values (asd.nextval,'Mach�ty M�ty�s','junior','tanulo',asd.nextval);

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
VALUES (asd.nextval,'B�k�scsaba','Kossuth u. 32');

alter table mm_iroda
add foreign key (id) REFERENCES mm_fejleszto(iroda);