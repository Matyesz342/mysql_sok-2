--kik azok az írok akik krimi vagy triller könyvet írtak
/*select szerzo.vezeteknev, szerzo.keresztnev
from konyvtar.szerzo szerzo inner join konyvtar.konyvszerzo ksz 
on szerzo.szerzo_azon = ksz.szerzo_azon inner join konyvtar.konyv konyv 
on ksz.konyv_azon = konyv.konyv_azon
where konyv.tema='krimi' or konyv.tema='thriller'
group by szerzo.vezeteknev, szerzo.keresztnev;*/

--Keressük olyan tagokat akiknek ugyanaz a keresztneve mint egy másik szerzõnek
/*select *
from konyvtar.szerzo;

select vezeteknev, keresztnev
from konyvtar.tag
where keresztnev in (select keresztnev
from konyvtar.szerzo);*/

--Azon könyvek amit Stephen King írt vagy már voltak kölcsönözve
/*Select distinct kv.cim
from konyvtar.konyv kv inner join konyvtar.konyvtari_konyv kkv
on kv.konyv_azon = kkv.konyv_azon
inner join konyvtar.kolcsonzes kcs
on kkv.leltari_szam = kcs.leltari_szam;
minus
select kv.cim
from konyvtar.konyv kv inner join konyvtar.konyvszerzo ksz
on kv.konyv_azon = ksz.konyv_azon
inner join konyvtar.szerzo sz
on sz.szerzo_azon = ksz.szerzo_azon
where sz.keresztnev = 'Stephen' and sz.vezeteknev = 'King';*/

/*select cim
from konyvtar.konyv
where tema = 'informatika'
union
select kv.cim
from konyvtar.konyv kv inner join konyvtar.konyvszerzo ksz
on kv.konyv_azon = ksz.konyv_azon
inner join konyvtar.szerzo sz
on sz.szerzo_azon = ksz.szerzo_azon
where sz.keresztnev = 'Agatha' and sz.vezeteknev = 'Christie';*/

--Olyan tag aki kisfiu és nem vett még ki 500 oldalnál hosszab könyvet
/*select olvasojegyszam
from konyvtar.tag
where lower(nem) = 'f' and besorolas = 'gyerek'
intersect
select tag_azon
from konyvtar.konyv kv inner join konyvtar.konyvtari_konyv kkv
on kv.konyv_azon = kkv.konyv_azon
inner join konyvtar.kolcsonzes kcs
on kkv.leltari_szam = kcs.leltari_szam
where kv.oldalszam <= 500;*/

--olan konyvek amiknek a szerzoje ismert, de cserepes virág nem vette ki
/*select kv.cim
from konyvtar.konyv kv inner join konyvtar.konyvszerzo ksz 
on kv.konyv_azon = ksz.konyv_azon inner join konyvtar.szerzo sz
on ksz.szerzo_azon = sz.szerzo_azon
minus
select tag_azon
from konyvtar.tag tg inner join konyvtar.kolcsonzes kcs
on tg.olvasojegyszam = kcs.tag_azon
where vezeteknev = 'Cserepes' and keresztnev = 'Virág';*/

--olyan könyvek amiket már kivett áron de erika nem//nem jó ez a megoldás
select kv.cim
from konyvtar.tag tg inner join konyvtar.kolcsonzes kcs
on tg.olvasojegyszam = kcs.tag_azon inner join konyvtar.konyvtari_konyv kkv
on kcs.leltari_szam = kkv.leltari_szam inner join konyvtar.konyv kv
on kkv.leltari_szam = kv.konyv_azon
where keresztnev = 'Áron'
minus
select kv.konyv_azon
from konyvtar.tag tg inner join konyvtar.kolcsonzes kcs
on tg.olvasojegyszam = kcs.tag_azon inner join konyvtar.konyvtari_konyv kkv
on kcs.leltari_szam = kkv.leltari_szam inner join konyvtar.konyv kv
on kkv.leltari_szam = kv.konyv_azon
where keresztnev = 'Erika';
/*select tag_azon
from konyvtar.tag tg inner join konyvtar.kolcsonzes kcs
on tg.olvasojegyszam = kcs.tag_azon
where keresztnev = 'Erika';*/