--select distinct tipus_azon, szin as sz�n
--from szerelo.sz_auto;

--select distinct 6*2 as Solution
--from dual;

--List�zzuk ki a szineket egyedien
--List�zzuk ki a milyen aut�kat ismer az adatb�zis
--List�zzuk ki a aut�kat az els� v�s�rl�si �r tized�t
--�rassuk ki a szerel�k neveit
--List�zzuk ki a tulajok inform�ci�it

--select distinct szin 
--from szerelo.sz_auto;

--select distinct marka, megnevezes
--from szerelo.sz_autotipus;

--select distinct nev
--from szerelo.sz_szerelo;

--select *
--from szerelo.sz_tulajdonos;

--select elso_vasarlasi_ar * 0.1 as V�s�rl�si_�r_tizede
--from szerelo.sz_auto;

--select marka || ' ' || megnevezes
--from szerelo.sz_autotipus;

--select 'AA-' || rendszam as Rendsz�m 
--from szerelo.sz_auto;


--select rendszam, nvl(szin, 'ismeretlen') as sz�n
--from szerelo.sz_auto;

--select rendszam, nvl(tipus_azon, '2') as azonos�t�
--from szerelo.sz_auto;

-- order by -> sorba rendez�s
-- ascending -> n�vekv�
-- descending -> cs�kenn�
-- where -> 


--select distinct kiado 
--from konyvtar.konyv
--order by kiado desc nulls last;

--rendezz�k a szerz�ket abc sorrendbe keresztn�v alapj�n
-- -||- keresztn�v alapj�n n�vekv�, vezet�kn�v alapj�n cs�kken� sorrendbe

--select keresztnev
--from konyvtar.szerzo
--order by keresztnev asc;

--select keresztnev, vezeteknev
--from konyvtar.szerzo
--order by keresztnev asc, vezeteknev desc;

-- list�zzuk ki a tagok k�z�l h�lgyeket

--select *
--from konyvtar.tag
--where upper(nem)='N';-- lower()

--select ar 
--from konyvtar.konyv
--where cim='T�z kicsi n�ger';

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
--where keresztnev like '_r%';-- _ egy karaktert helyetes�t, % b�rmennyi kararaktert helyetes�thet
--list�zzuk ki a azokat a kiad�kat akinek a v�g�n szerepel a KFT felirat pontal vagy n�lk�le, kis �s nagybet�t ignor�lva
--select distinct kiado
--from konyvtar.konyv
--where upper(kiado) like '%KFT_';
-- list�zzuk ki a k�nyveket, amelyek A/Az kezd�dik
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
--where keresztnev in ('S�ndor', 'J�zsef', 'Benedek');

--select *
--from konyvtar.tag
--where keresztnev not in ('�ron', 'Elek', 'Erika');

--select *
--from konyvtar.tag
--where besorolas in ('di�k', 'gyerek', 'nyugd�jas') and cim not like ('%Debrecen, %')
--order by vezeteknev asc;
-- between k�t �rt�k k�z�tt keres
--select *
--from konyvtar.konyv
--where ar between 500 and 5000;
--to_date fv id�pont
--select *
--from konyvtar.tag
--where szuletesi_datum between to_date('1990.01.01', 'yyyy.mm.dd') and to_date('2000.12.31', 'yyyy.mm.dd');
-- sys_date aktu�lis id�
-- kiadott k�nyvek 7 �s 14 nap k�z�tt adt�k ki
--select *
--from konyvtar.kolcsonzes
--where hany_napra between 7 and 14;
-- list�zzuk ki azokat a tagokat akik a 21. sz�zadban sz�lettek
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

select szul_hely, count(*)--count() * kell hozz�, having gel tudunk felt�telt adni
from olimpia.o_versenyzok
where szul_hely not like 'Budapest'
group by szul_hely
having count(*) >1;*/

/*select sum(arany)
from olimpia.o_erem_tabla;

select floor(sum(lakossag)/sum(terulet))-- floor() lefel� kerek�t, round(felt�tel,h�ny tizedesjegyre (ha m�nuszt �rsz be akkor a eg�szekre kezd el kerek�teni))
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
where lakossag/terulet > 30 and foldresz not like 'Eur�pa'; 

select orszag_azon, round(avg(sysdate-szul_dat)/365)
from olimpia.o_versenyzok
group by orszag_azon;

select min(helyezes), max(helyezes)
from olimpia.o_eredmenyek
where mod(versenyzo_azon,2)=0;

select concat(vezeteknev,keresztnev)--�sszef� mez�ket
from konyvtar.szerzo;

select substr(vezeteknev,0,3)--feldarabol stringet, kezd� indexet, h�ny karakter
from konyvtar.szerzo;

select chr(64), ascii('@')
from dual;

select instr(cim,',')
from konyvtar.tag;

select cim
from konyvtar.tag;

select substr(cim, 5, instr(cim,',')-5)
from konyvtar.tag;*/

--Mely aut�kat szerelt�k legal�bb 2 alkalomman
select au.rendszam, count(*)
from szerelo.sz_auto au inner join szerelo.sz_szereles st
on au.azon = auto_azon
Group by au.rendszam
Having count(*)>=2;

--Melyik aut�b�l (m�rka+t�pus) van a legt�bb az adatb�zisban
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

--Mely aut�k Ford m�rkaj�ak?
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
where nev = 'Kiss P�ter')))); 

