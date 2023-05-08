--Hallgato tábla
-- neptun kód -> elsõdleges kulcs
-- név
-- szul. dat
-- cim
-- unipass -> egyedi
-- cipoméret -> 5

CREATE table mm_hallgato(
    neptun_kod varchar2(6) primary key not null,
    nev varchar2(50),
    szul_dat date,
    cim varchar2(50),
    unipass varchar2(10) unique,
    cipo number 
);

alter table mm_hallgato
add CONSTRAINT shoe_check check (cipo > 5);

create table mm_kurzus(
 kod varchar2(12) primary key not null,
 nev varchar2(50),
 kredit number,
 oktato varchar2(50) not null
);

--kapcsolo tabla

create table hallgatja(
neptun_kod varchar2(6) not null,
kurzuskod varchar2(12) not null,

constraint hlg_pk primary key (neptun_kod,kurzuskod)


);

alter table hallgatja
add constraint halg_fk foreign key (neptun_kod) references mm_hallgato(neptun_kod);
alter table hallgatja
add CONSTRAINT kurz_fk FOREIGN key (kurzuskod) REFERENCES mm_kurzus(kod);

-- beillesztés
-- insert into
create table mm_test_m(
nev varchar2(50)
);

insert into mm_test_m
select nev
from szerelo.sz_tulajdonos;
select *
from mm_test_m;

drop table mm_test_m;

insert into mm_hallgato (neptun_kod, nev, szul_dat,cim,unipass,cipo)
values ('FB4B8Z', 'Macháty Mátyás', to_date('2001.04.25','yyyy.mm.dd'),'Debrecen','132484',48);

insert into mm_hallgato (neptun_kod,nev,cipo) values ('H4A5KZ','Tank Aranka',42);

insert into mm_kurzus (kod, nev, kredit, oktato) values ('INBMM0433L','Adatbázis',6,'Belics Fanni');
insert into mm_kurzus (kod, nev, kredit, oktato) values ('INBMM0433K','Prog1',6,'Jabba Laci');

insert into hallgatja(neptun_kod, kurzuskod) values ('FB4B8Z', 'INBMM0433K');

select *
from mm_hallgato h inner join hallgatja hja
on h.neptun_kod = hja.neptun_kod;

update mm_hallgato 
set 
cim = 'Debrecen'
where
cipo > 40;

select *
from mm_hallgato;

--Váltsuk le az adatbázisban az oktatót Adamkó Attilára

update mm_kurzus
set
oktato = 'Dr Adamkó Attila'
where
nev = 'Adatbázis';

select *
from mm_kurzus;

--töröljük azokat a tárgyakat amelyeket nem Adamkó Attila tart
select *
from mm_kurzus;

delete
from mm_kurzus
where oktato != 'Dr Adamkó Attila';

select *
from mm_kurzus;




