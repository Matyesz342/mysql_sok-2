--select distinct tipus_azon, szin as szín
--from szerelo.sz_auto;

--select distinct 6*2 as Solution
--from dual;

--Listázzuk ki a szineket egyedien
--Listázzuk ki a milyen autókat ismer az adatbázis
--Listázzuk ki a autókat az elsõ vásárlási ár tizedét
--írassuk ki a szerelõk neveit
--Listázzuk ki a tulajok információit

--select distinct szin 
--from szerelo.sz_auto;

--select distinct marka, megnevezes
--from szerelo.sz_autotipus;

--select distinct nev
--from szerelo.sz_szerelo;

--select *
--from szerelo.sz_tulajdonos;

--select elso_vasarlasi_ar * 0.1 as Vásárlási_ár_tizede
--from szerelo.sz_auto;

--select marka || ' ' || megnevezes
--from szerelo.sz_autotipus;

--select 'AA-' || rendszam as Rendszám 
--from szerelo.sz_auto;


--select rendszam, nvl(szin, 'ismeretlen') as szín
--from szerelo.sz_auto;

--select rendszam, nvl(tipus_azon, '2') as azonosító
--from szerelo.sz_auto;

-- order by -> sorba rendezés
-- ascending -> növekvõ
-- descending -> csökennõ
-- where -> 


--select distinct kiado 
--from konyvtar.konyv
--order by kiado desc nulls last;

--rendezzük a szerzõket abc sorrendbe keresztnév alapján
-- -||- keresztnév alapján növekvõ, vezetéknév alapján csökkenõ sorrendbe

--select keresztnev
--from konyvtar.szerzo
--order by keresztnev asc;

--select keresztnev, vezeteknev
--from konyvtar.szerzo
--order by keresztnev asc, vezeteknev desc;

-- listázzuk ki a tagok közül hölgyeket

--select *
--from konyvtar.tag
--where upper(nem)='N';-- lower()

--select ar 
--from konyvtar.konyv
--where cim='Tíz kicsi néger';

--select cim, oldalszam
--from konyvtar.konyv
--where oldalszam < 500;

--select cim 
--from konyvtar.konyv
--where ar < 5000
--order by ar asc;

--select *
--from konyvtar.konyv
--where kiado is not null;

--select cim, ar / oldalszam
--from konyvtar.konyv
--where ar is not null and oldalszam is not null;

--select *
--from konyvtar.tag
--where keresztnev like '_r%';-- _ egy karaktert helyetesít, % bármennyi kararaktert helyetesíthet
--listázzuk ki a azokat a kiadókat akinek a végén szerepel a KFT felirat pontal vagy nélküle, kis és nagybetût ignorálva
--select distinct kiado
--from konyvtar.konyv
--where upper(kiado) like '%KFT_';
-- listázzuk ki a könyveket, amelyek A/Az kezdõdik
--select *
--from konyvtar.konyv
--where upper(cim) like 'A_ %';
-- where in halmzban keres
-- 
--select *
--from konyvtar.konyv
--where tema in ('krimi', 'horror');

--select *
--from konyvtar.szerzo
--where keresztnev in ('Sándor', 'József', 'Benedek');

--select *
--from konyvtar.tag
--where keresztnev not in ('Áron', 'Elek', 'Erika');

--select *
--from konyvtar.tag
--where besorolas in ('diák', 'gyerek', 'nyugdíjas') and cim not like ('%Debrecen, %')
--order by vezeteknev asc;
-- between két érték között keres
--select *
--from konyvtar.konyv
--where ar between 500 and 5000;
--to_date fv idõpont
--select *
--from konyvtar.tag
--where szuletesi_datum between to_date('1990.01.01', 'yyyy.mm.dd') and to_date('2000.12.31', 'yyyy.mm.dd');
-- sys_date aktuális idõ
-- kiadott könyvek 7 és 14 nap között adták ki
--select *
--from konyvtar.kolcsonzes
--where hany_napra between 7 and 14;
-- listázzuk ki azokat a tagokat akik a 21. században születtek
--select *
--from konyvtar.tag
--where szuletesi_datum between to_date('2000.01.01', 'yyyy.mm.dd') and sysdate;

/*select *
from olimpia.o_orszagok
where orszag like 'A_e%';

select *
from olimpia.o_sportagak
where nev not in ('%e%');

select *
from olimpia.o_versenyzok
where szul_dat between to_date('1990.01.01', 'yyyy.mm.dd') and to_date('1999.12.31', 'yyyy.mm.dd');

select arany+ezust+bronz
from olimpia.o_erem_tabla
where orszag_azon = 122;

select * 
from olimpia.o_versenyzok
where szul_dat between to_date('1990.01.01', 'yyyy.mm.dd') and to_date('1999.12.31', 'yyyy.mm.dd')
and egyen_csapat  = 'e';

select *
from olimpia.o_versenyzok
where orszag_azon in (9,131,15,23) and egyen_csapat = 'c';

select szul_hely, count(*)--count() * kell hozzá, having gel tudunk feltételt adni
from olimpia.o_versenyzok
where szul_hely not like 'Budapest'
group by szul_hely
having count(*) >1;*/

/*select sum(arany)
from olimpia.o_erem_tabla;

select floor(sum(lakossag)/sum(terulet))-- floor() lefelé kerekít, round(feltétel,hány tizedesjegyre (ha mínuszt írsz be akkor a egészekre kezd el kerekíteni))
from olimpia.o_orszagok;

select foldresz, count(*)
from olimpia.o_orszagok
group by foldresz;

select orszag_azon, count(*)
from olimpia.o_versenyzok
where egyen_csapat = 'c'
group by orszag_azon;

select foldresz, max(terulet)
from olimpia.o_orszagok
where foldresz is not null
group by foldresz;*/

/*select count(*)
from olimpia.o_orszagok
where foldresz = 'Afrika' and terulet > 50000;
--group by orszag;

select foldresz
from olimpia.o_orszagok
where foldresz is not null 
group by foldresz
having sum(terulet) > 8000000;

select sum(terulet)
from olimpia.o_orszagok
where lakossag < 10000000;

select sum(lakossag)
from olimpia.o_orszagok;

select *
from olimpia.o_orszagok
where lakossag/terulet > 30 and foldresz not like 'Európa'; 

select orszag_azon, round(avg(sysdate-szul_dat)/365)
from olimpia.o_versenyzok
group by orszag_azon;

select min(helyezes), max(helyezes)
from olimpia.o_eredmenyek
where mod(versenyzo_azon,2)=0;

select concat(vezeteknev,keresztnev)--összefû mezõket
from konyvtar.szerzo;

select substr(vezeteknev,0,3)--feldarabol stringet, kezdõ indexet, hány karakter
from konyvtar.szerzo;

select chr(64), ascii('@')
from dual;

select instr(cim,',')
from konyvtar.tag;

select cim
from konyvtar.tag;

select substr(cim, 5, instr(cim,',')-5)
from konyvtar.tag;*/

--Mely autókat szerelték legalább 2 alkalomman
select au.rendszam, count(*)
from szerelo.sz_auto au inner join szerelo.sz_szereles st
on au.azon = auto_azon
Group by au.rendszam
Having count(*)>=2;

--Melyik autóból (márka+típus) van a legtöbb az adatbázisban
select marka, megnevezes, count(au.azon)
from szerelo.sz_autotipus typ inner join szerelo.sz_auto au
on au.tipus_azon = typ.azon
group by marka, megnevezes
order by count(au.azon) desc
fetch first 1 rows only;

select mh.nev, szer.nev
from szerelo.sz_szerelomuhely mh inner join szerelo.sz_dolgozik dolg
on mh.azon = dolg.muhely_azon inner join 
szerelo.sz_szerelo szer on dolg.szerelo_azon = szer.azon
where dolg.munkaviszony_vege is null;

select mh.nev, count(*)
from szerelo.sz_autotipus tip inner join szerelo.sz_auto au
on tip.azon = au.tipus_azon inner join
szerelo.sz_szereles szer on au.azon = szer.auto_azon inner join 
szerelo.sz_szerelomuhely mh on szer.muhely_azon = mh.azon
where tip.marka='Volkswagen'
group by mh.nev
order by count(tip.azon) desc
fetch first 1 rows only;

select avg(fel.ertek)
from szerelo.sz_autofelertekeles fel inner join szerelo.sz_auto au
on fel.auto_azon = au.azon inner join szerelo.sz_auto_tulajdonosa autul
on au.azon = autul.auto_azon inner join szerelo.sz_tulajdonos tul
on autul.tulaj_azon = tul.azon
where tul.cim like 'Debrecen%';

--Mely autók Ford márkajúak?
select rendszam
from szerelo.sz_auto
where tipus_azon in (select azon
from szerelo.sz_autotipus
where marka = 'Ford');

select rendszam
from szerelo.sz_auto
where azon in (select auto_azon
from szerelo.sz_szereles
where muhely_azon in (select azon
from szerelo.sz_szerelomuhely
where azon in (select muhely_azon
from szerelo.sz_dolgozik
where szerelo_azon in (select szerelo_azon
from szerelo.sz_szerelo
where nev = 'Kiss Péter')))); 

