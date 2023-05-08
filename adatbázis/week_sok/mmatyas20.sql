--select *
--from szerelo.sz_tulajdonos;

--create table m_tulajok
--as 
--select azon,nev
--from szerelo.sz_tulajdonos;

--select *
--from m_tulajok;

--create table m_nev_auto
--as 
--select szin,rendszam
--from szerelo.sz_auto
--where szin = 'kék';

--select *
--from m_nev_auto;

--drop table m_nev_auto;

--create table m_nev_auto
--as 
--select szin,rendszam
--from szerelo.sz_auto
--where szin = 'kék';

--select *
--from m_nev_auto;

create table m_test(
    id number(5),
    nev varchar2(50)
);

select *
from m_test;

create view m_kek_autok
as 
select *
from szerelo.sz_auto
where szin = 'kék';

select *
from m_kek_autok;

select *
from sys.all_indexes
where lower(table_owner) = 'konyvtar';

select *
from konyvtar.szerzo;

--create index mm_szerzo_view on konyvtar.szerzo(keresztnev, vezeteknev);

create table mm_kesztermekek(
    termek_szama number(10) primary key not null,
    megnevezes varchar2(50) not null,
    meret char(5) not null,
    szin varchar2(15),
    szabasminta_szama number(10)
);

create table mm_szabsmintak(
minta_szama number(10) primary key not null,
megnevezes varchar2(50) not null,
szarmazas varchar2(50),
legk_meret varchar(5),
lebn_meret varchar2(5)
);

--alter table m_test
--add email number;

--alter table m_test
--drop column email;

--alter table f_test
--add CONSTRAINT m_test_uq foreign key (id) references szerelo.sz_tulajdonos(id);

alter table mm_kesztermekek
add CONSTRAINT kszt_fk foreign key (szabasminta_szama) references mm_szabasmintak(minta_szama);

drop table m_test;

create table m_test
as
select nev,azon
from szerelo.sz_tulajdonos;

select *
from m_test;

truncate table m_test;

